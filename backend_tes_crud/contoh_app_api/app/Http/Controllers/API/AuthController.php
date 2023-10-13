<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    //
     /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
       
        $credentials = request(['username', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        $user = \Auth::user();
        // dd($user);
        return $this->respondWithToken($token,$request->username);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token,$username)
    {
        $user = \Auth::user();


        $v_unit_id = "";
        $v_class_grade_id = "";
        $v_study_group_id = "";
        $v_course_id = "";

        $unit_id =  \DB::table('m_employee as a') 
        ->join('employee_unit as b','a.employee_id','b.employee_id')
        ->join('users as c','c.id','a.user_id')
        ->join('roles as d','d.id','a.employee_role')
        ->where('c.id',$user->id)->first();
        // dd($unit_id);

         $roles =  \DB::table('m_employee as a') 
         ->select('d.name as role_name')
        ->join('users as c','c.id','a.user_id')
        ->join('roles as d','d.id','a.employee_role')
        ->where('c.id',$user->id)->first();
        
        // dd($roles);
        if(!empty($unit_id))
        {
            $v_unit_id = $unit_id->unit_id;
        }


        $study_group_id =  \DB::table('teacher_setting as a') 
        ->join('m_employee as b','a.employee_id','b.employee_id')
        ->where('b.user_id',$user->id)->first();


        
        if(!empty($study_group_id))
        {
            $class_grade_id = \App\Models\M_study_group::where('study_group_id',$study_group_id->study_group_id)->first();    
            $v_class_grade_id = $class_grade_id->class_grade_id;
            $v_study_group_id = $study_group_id->study_group_id;
            $v_course_id = $study_group_id->course_id;
        }
        


        return response()->json([
            'access_token' => $token,
            'role_name' => $roles->role_name,
            'token_type' => 'bearer',
            'username'=>$username,
            'class_grade_id'=>$v_class_grade_id,
            'unit_id'=>$v_unit_id,
            'study_group_id'=>$v_study_group_id,
            'course_id'=>$v_course_id,
            'expires_in' => 10800
        ]);
    }
}
