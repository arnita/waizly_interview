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
    use App\Models\M_employee;
    use App\Exceptions\BaseException;
    use App\Imports\Employee;
    use Spatie\Permission\Models\Role;
    use Spatie\Permission\Models\Permission;

    class EmployeeController extends Controller
    {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
      $result =  M_employee::with('user')->whereNull('employee_delete_time')->orderBy('employee_id','desc');
      

      if(!empty($request->q))
      {
        $result->where('employee_name','ilike','%'.$request->q.'%');
      }
      return $result->paginate(10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }


    public function generate_id_employee()
    {
      $employee_id_card;
      $query = M_employee::
      where('employee_id_card','ilike','%'.date('Ymd').'%') 
      ->whereNull('employee_delete_time') 
      ->orderBy('employee_id','desc')
      ->first();
      if(!empty($query))
      {
        $get_employee = substr($query->employee_id_card, -3);
        $max = ((int)$get_employee) + 1;
        return $employee_id_card =  'EM'.date('Ymd').sprintf("%03s",$max);
      }
      else
      {
        return $employee_id_card =  'EM'.date('Ymd')."001";
      }
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
        'employee_name'=>'required',
        'employee_status'=>'required',
        'employee_nik'=>'required',
        'employee_gender'=>'required',
        'employee_birth_date'=>'required',
        'employee_birth_place'=>'required',
        'employee_religion'=>'required',
        'employee_email'=>'required',
        'employee_role'=>'required',
      ]);


      \DB::beginTransaction();
      try {

       $u_ex = explode(' ',$request->employee_name);
       $user['username'] =  strtolower($u_ex[0]);
       $user['password'] = bcrypt('123123');
       $user['user_status'] = 'active';
       $user['api_token'] = generateRandomString(30);
       $save_user = \App\Models\User::create($user);
       $user = \App\Models\User::findOrFail($save_user->id);
       $user->syncRoles($request->employee_role);


       $data["employee_status"]= $request->employee_status;
       $data["employee_name"]= $request->employee_name;
       $data["employee_nik"]= $request->employee_nik;
       $data["employee_gender"]= $request->employee_gender;
       $data["employee_birth_place"]= $request->employee_birth_place;
       $data["employee_religion"]= $request->employee_religion;
       $data["employee_identity"]= $request->employee_identity;
       $data["employee_last_education"]= $request->employee_last_education;
       $data["employee_marital_status"] = $request->employee_marital_status;
       $data["employee_hp"]= $request->employee_hp;
       $data["employee_website"]= $request->employee_website;
       $data["employee_telp"]= $request->employee_telp;
       $data["employee_address"]= $request->employee_address;
       $data["photo_assign"]= $request->photo_assign;
       $data["employee_desc"]= $request->employee_desc;
       $data["employee_email"]= $request->employee_email;
       $data["employee_role"] = $request->employee_role;
       $data["employee_birth_date"] = $request->employee_birth_date;
       $data['employee_insert_time'] = date('Y-m-d H:i:s');
       $data['employee_insert_by'] = \Auth::user()->id;;

       /* if upload photo employee */
       if(!empty($request->get('photo_assign'))) 
       {
        $image = $request->get('photo_assign');
        $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
        \Image::make($request->get('photo_assign'))->save(public_path('image_employee/').$name);
        $data['photo_assign'] = $name;
      }
      

      $data['user_id'] = $save_user->id;
      $data['employee_id_card']=$this->generate_id_employee();



      $save_employee =M_employee::create($data);

      foreach ($request->selected as  $value) 
      {
        $unit = \App\Models\M_unit::where('unit_name','ilike','%'.$value.'%')->first();
        $emp['employee_id'] = $save_employee->employee_id;
        $emp['unit_id']=  $unit->unit_id;
        $emp['employee_unit_update_time'] = date('Y-m-d H:i:s');
        $emp['employee_unit_update_by'] = \Auth::user()->id;
        \App\Models\Employee_unit::create($emp);
      }

      \DB::commit();

      return BaseException::jsonSuccessResponse();
    } catch (\Exception $e) {
      \DB::rollback();
      return BaseException::jsonErrorResponse('1', $e->getMessage());
    }

        // return response()->json(['status' => 'success']);
  }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
      $employee = M_employee::find($id);
      $user = \App\Models\User::where('id',$employee->user_id)->first();
      

      return BaseException::jsonSuccessResponse(['employee'=>$employee,'user'=>$user,'tanggal_lahir'=>date('Y-m-d',strtotime($employee->employee_birth_date)) ] );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
      $this->validate($request,[
        'employee_name'=>'required',
        // 'username'=>'required',
        'employee_status'=>'required',
        'employee_nik'=>'required',
        'employee_gender'=>'required',
        'employee_birth_date'=>'required',
        'employee_birth_place'=>'required',
        'employee_religion'=>'required',
        'employee_email'=>'required',
        'employee_role'=>'required',
      ]);



      \DB::beginTransaction();
      try {
            // update employee

        $data["employee_status"]= $request->employee_status;
        $data["employee_name"]= $request->employee_name;
        $data["employee_email"]= $request->employee_email;
        $data["employee_nik"]= $request->employee_nik;
        $data["employee_gender"]= $request->employee_gender;
        $data["employee_birth_place"]= $request->employee_birth_place;
        $data["employee_religion"]= $request->employee_religion;
        $data["employee_identity"]= $request->employee_identity;
        $data["employee_last_education"]= $request->employee_last_education;
        $data["employee_marital_status"] = $request->employee_marital_status;
        $data["employee_hp"]= $request->employee_hp;
        $data["employee_website"]= $request->employee_website;
        $data["employee_telp"]= $request->employee_telp;
        $data["employee_address"]= $request->employee_address;
        $data["employee_role"]= $request->employee_role;
        $data["photo_assign"]= $request->photo_assign;
        $data["employee_desc"]= $request->employee_desc;
        $data["employee_birth_date"] = $request->employee_birth_date;
        $data['employee_update_time'] = date('Y-m-d H:i:s');
        $data['employee_update_by'] = \Auth::user()->id;;


        $update = M_employee::find($id);
        $emp = \App\Models\M_employee::find($update->employee_id);
        
        /* if upload photo employee */
        if(!empty($request->get('photo_assign')) && $emp->photo_assign != $request->get('photo_assign'))
        {
          $image = $request->get('photo_assign');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
          \Image::make($request->get('photo_assign'))->save(public_path('image_employee/').$name);
          $data['photo_assign'] = $name;
        }

        $update->update($data);


            // update User
        $user['username'] = $request->username;
        $user['user_status'] = $request->user_status;
        $update_user = \App\Models\User::find($update->user_id);
        $update_user->syncRoles($request->employee_role);
        $update_user->update($user);


        \App\Models\Employee_unit::where('employee_id',$request->employee_id)->delete();
        foreach ($request->employee_unit as  $value) 
        {
          $ins_emp['employee_id'] = $request->employee_id;
          $ins_emp['unit_id']=  $value['unit_id'];
          $ins_emp['employee_unit_update_time'] = date('Y-m-d H:i:s');
          $ins_emp['employee_unit_update_by'] = \Auth::user()->id;
          \App\Models\Employee_unit::create($ins_emp);
        }
        \DB::commit();
        return BaseException::jsonSuccessResponse();
      } catch (\Exception $e) {
        \DB::rollback();
        return BaseException::jsonErrorResponse('1', $e->getMessage());
      }

    }  

    public function update_profile(Request $request)
    {
        //
      $this->validate($request,[
        'employee_name'=>'required',
        'employee_nik'=>'required',
        'employee_gender'=>'required',
        'employee_birth_date'=>'required',
        'employee_birth_place'=>'required',
        'employee_religion'=>'required',
      ]);



      \DB::beginTransaction();
      try {
            // update employee

        $data["employee_status"]= $request->employee_status;
        $data["employee_name"]= $request->employee_name;
        $data["employee_email"]= $request->employee_email;
        $data["employee_nik"]= $request->employee_nik;
        $data["employee_gender"]= $request->employee_gender;
        $data["employee_birth_place"]= $request->employee_birth_place;
        $data["employee_religion"]= $request->employee_religion;
        $data["employee_identity"]= $request->employee_identity;
        $data["employee_last_education"]= $request->employee_last_education;
        $data["employee_marital_status"] = $request->employee_marital_status;
        $data["employee_hp"]= $request->employee_hp;
        $data["employee_website"]= $request->employee_website;
        $data["employee_telp"]= $request->employee_telp;
        $data["employee_address"]= $request->employee_address;
        $data["photo_assign"]= $request->photo_assign;
        $data["employee_desc"]= $request->employee_desc;
        $data["employee_birth_date"] = $request->employee_birth_date;
        $data['employee_update_time'] = date('Y-m-d H:i:s');
        $data['employee_update_by'] = \Auth::user()->id;;


        $id = \Auth::user()->id;
        
        $update = M_employee::where('user_id',$id);
        
        /* if upload photo employee */
        if(!empty($request->get('photo_assign')))
        {
          $image = $request->get('photo_assign');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
          \Image::make($request->get('photo_assign'))->save(public_path('image_employee/').$name);
          $data['photo_assign'] = $name;
        }

        $update->update($data);



        \DB::commit();
        return BaseException::jsonSuccessResponse();
      } catch (\Exception $e) {
        \DB::rollback();
        return BaseException::jsonErrorResponse('1', $e->getMessage());
      }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
      if(!empty($id))
      {
        \DB::beginTransaction();
        try {

          $employee = M_employee::find($id);
          $data['employee_delete_time'] = date('Y-m-d H:i:s');
          $data['employee_delete_by'] = \Auth::user()->id;
          $data['employee_status'] = 'deactive';
          $employee->update($data);


          $user = \App\Models\User::find($employee->user_id);
          $data['user_status'] = 'deactive';
          $user->update($data);


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


    public function employee_upload(Request $request)
    {
      $validate = $request->validate([
        'file_excel'=>"required|mimes:xls,xlsx|max:500",
      ]);

      $dt = \Excel::toArray(new Employee, $request->file('file_excel')); 
      $count_row = count($dt[0]);
      $count_column = count($dt[0][0]);


      \DB::beginTransaction();
      try {    

        for($i=1;$i < $count_row; $i++)
        {
          $ex = M_employee::where('employee_nik',$dt[0][$i][2])->first() ;
          if(!empty($ex))
          {
           $u_ex = explode(' ',$dt[0][$i][1]);
           $user['username'] = $u_ex[0].date('dms');
           $user['password'] = bcrypt('123123');
           $user['user_status'] = 'active';
           $user['api_token'] = generateRandomString(30);
           $save_user = \App\Models\User::create($user);

           $data["employee_status"]= 'active';
           $data["employee_name"]= $dt[0][$i][1];
           $data["employee_nik"]= $dt[0][$i][2];
           $data["employee_religion"]= $dt[0][$i][3];
           $data["employee_gender"]= $dt[0][$i][4];
           $data["employee_birth_place"]= $dt[0][$i][5];
           $data["employee_email"]= $dt[0][$i][6];
           $data["employee_desc"]= $dt[0][$i][7];
           $data["employee_address"]= $dt[0][$i][8];


           $data['employee_update_time'] = date('Y-m-d H:i:s');
           $data['employee_update_by'] = \Auth::user()->id;

           $update_employee =M_employee::where('employee_id',$ex->employee_id)->update($data);

         }
         else
         {
           $u_ex = explode(' ',$dt[0][$i][1]);
           $user['username'] = $u_ex[0].date('dms');
           $user['password'] = bcrypt('123123');
           $user['user_status'] = 'active';
           $user['api_token'] = generateRandomString(30);
           $save_user = \App\Models\User::create($user);

           $data["employee_status"]= 'active';
           $data["employee_name"]= $dt[0][$i][1];
           $data["employee_nik"]= $dt[0][$i][2];
           $data["employee_religion"]= $dt[0][$i][3];
           $data["employee_gender"]= $dt[0][$i][4];
           $data["employee_birth_place"]= $dt[0][$i][5];
           $data["employee_email"]= $dt[0][$i][6];
           $data["employee_desc"]= $dt[0][$i][7];
           $data["employee_address"]= $dt[0][$i][8];


           $data['employee_insert_time'] = date('Y-m-d H:i:s');
           $data['employee_insert_by'] = \Auth::user()->id;


           $data['user_id'] = $save_user->id;
           $data['employee_id_card']=$this->generate_id_employee();
           $save_employee =M_employee::create($data);
         }

       }

       \DB::commit();
       return BaseException::jsonSuccessResponse(['data'=>'sucess']);
     } catch (\Exception $e) {
      \DB::rollback();
      return BaseException::jsonErrorResponse('1',$e->getMessage());    
    }
  }


  public function change_pass_emp(Request $request)
  {
    $request->validate([
      'password_baru'=>"required|same:confirm_password|min:6",
      'confirm_password' => 'required|min:6',
    ]);

    $data = ['password'=>bcrypt($request->password_baru)];

    \App\Models\User::where('id',\Auth::user()->id)->update($data); 
  }

  public function delete_employee_unit($id)
  {
    if(!empty($id))
    {
      $delete = \DB::table('employee_unit')
      ->where('employee_unit_id', $id)
      ->delete();
      return BaseException::jsonSuccessResponse();
    }
    else
    {
      return BaseException::jsonErrorResponse('1','error');
    }
  }

  public function edit_employee_unit(Request $request)
  {
    $data['employee_unit_insert_time'] = date('Y-m-d H:i:s');
    $data['employee_unit_insert_by'] = \Auth::user()->id;


    $data['unit_id'] = $request->unit_id;
    $data['employee_id']=$request->employee_id;



    $delete = \DB::table('employee_unit')
    ->where('employee_id', $request->employee_id)
    ->where('unit_id',  $request->unit_id)
    ->delete();


    $save = \DB::table('employee_unit')->insert(
      $data
    );  

    if($save)
    {
      return BaseException::jsonSuccessResponse();
    }

    return BaseException::jsonErrorResponse('1','error');
  }

  public function edit_profile()
  {
    $id  = \Auth::user()->id;

    $user = \App\Models\M_employee::where('user_id',$id)->first();

    return BaseException::jsonSuccessResponse($user);



  }



}
