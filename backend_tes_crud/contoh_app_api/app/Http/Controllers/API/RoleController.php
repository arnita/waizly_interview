<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Exceptions\BaseException;




class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $result = Role::orderBy('id','desc');

        if(!empty($request->q))
        {
            $result->where('name','ilike','%'.$request->q.'%');
        }
        return $result->paginate(10);   
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function role_setting(Request $request)
    {
        //
        $result = Permission::orderBy('id','desc');

        if(!empty($request->q))
        {
            $result->where('name','ilike','%'.$request->q.'%');
        }
        return $result->get();   
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request,[
            'name'=>'required',
        ]);

        if(!empty($request->id))
        {

            $update = Role::find($request->id);
            $update->name =  $request->name;
            $update->save();
        }
        else
        {
            $data = $request->all();
            $save = Role::create($data);            
        }


        return response()->json(['status' => 'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function save_role_permission(Request $request)
    {
        //

        $data_permission = $request->permission_id;
        $role_id =[];
        foreach ($data_permission as $key => $value) 
        {
            $role_id['role_id'][] = $value;
        }  

        // dd($role_id);


        if(!empty($data_permission))
        {
            \DB::beginTransaction();
            try {
             
                $role = Role::findByName($request->name);
                $role->syncPermissions($role_id);
                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1', $e->getMessage());
            }
            
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        return Role::find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function get_selected(Request $request)
    {
        $hasPermission = \DB::table('role_has_permissions')
        ->select('permissions.name','permissions.id')
        ->join('permissions', 'role_has_permissions.permission_id', '=', 'permissions.id')
        ->where('role_id', $request->id)->get()->pluck('id')->all();
        return $hasPermission;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(!empty($id))
        {
            $data = Role::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
