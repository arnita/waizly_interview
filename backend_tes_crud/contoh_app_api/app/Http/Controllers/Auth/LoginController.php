<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    public function username()
    {
        return 'username';
    }

    public function login(Request $request)
    {

        $this->validate($request,[
            'username'=>'required|exists:users,username',
            'password'=>'required',
        ]);
        
        $auth = $request->only(['username','password']);
        if(auth()->attempt($auth)){
            $user = Auth::user();
            if($user->user_status != 'active')
            {
                return response()->json(['status'=>'failed']);        
            }
            $token = str_replace(['+','/','='],['-','_',''],base64_encode(json_encode([
                'user_id'=>$user->id,
                'username'=>$user->username,
                ])
            ));
            $user->api_token = Str::random(20).'-'.$token;
            $user->save();
            return response()->json(['status'=>'success','data'=>auth()->user()->api_token],200);
        }
        return response()->json(['status'=>'failed']);

    }
}
