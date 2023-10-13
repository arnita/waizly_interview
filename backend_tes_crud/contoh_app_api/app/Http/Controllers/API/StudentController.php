<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

    namespace App\Http\Controllers\API;

    use App\Models\M_student;
    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Exceptions\BaseException;
    use Image;
    use App\Imports\Student;



    class StudentController extends Controller
    {
   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $result =  M_student::with(['unit','class_grade'])->whereNull('student_delete_time')->orderBy('student_name','asc');
        $q = $request->q;
        $class_grade_id = $request->class_grade_id;
       
        if(!empty($q) && !empty($class_grade_id))
        {
       
            $result = $result->where('student_name','ilike','%'.$q.'%')
            ->WhereHas('class_grade', function ($query) use ($q,$class_grade_id){
                $query->where('class_grade_id',$class_grade_id);
            })->orWhere('student_nisn','ilike','%'.$q.'%')
            ;

        }
        else if(!empty($class_grade_id))
        {
            $result->WhereHas('class_grade', function ($query) use ($q,$class_grade_id){
                $query->where('class_grade_id',$class_grade_id);
            });
        }
        else
        {
            $result->where('student_name','ilike','%'.$q.'%')
            ->orWhere('student_nisn','ilike','%'.$q.'%');
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


    public function generate_id_student()
    {
        $student_id_card;
        $query = M_student::
        where('student_id_card','ilike','%'.date('Ymd').'%') 
        ->whereNull('student_delete_time') 
        ->orderBy('student_id','desc')
        ->first();
        if(!empty($query))
        {
            $get_student = substr($query->student_id_card, -3);
            $max = ((int)$get_student) + 1;
            return $student_id_card =  'ST'.date('Ymd').sprintf("%03s",$max);
        }
        else
        {
            return $student_id_card =  'ST'.date('Ymd')."001";
        }
    }

    
    public function generate_id_parent()
    {
        $parent_id_card;
        $query = \App\Models\M_parent::
        where('parent_id_card','ilike','%'.date('Ymd').'%') 
        ->whereNull('parent_delete_time') 
        ->orderBy('parent_id','desc')
        ->first();
        if(!empty($query))
        {
            $get_parent = substr($query->parent_id_card, -3);
            $max = ((int)$get_parent) + 1;
            return $parent_id_card =  'ST'.date('Ymd').sprintf("%03s",$max);
        }
        else
        {
            return $parent_id_card =  'ST'.date('Ymd')."001";
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
            'student_name'=>'required',
            'student_status'=>'required',
            'student_nisn'=>'required',
            'student_gender'=>'required',
           
            'unit_id'=>'required',
            'class_grade_id'=>'required',
        ]);


        \DB::beginTransaction();
        try {

             // Save user for student
         $u_ex = explode(' ',$request->student_name);
         $user['username'] = $u_ex[0].date('dms');
         $user['password'] = bcrypt('123123');
         $user['user_status'] = $request->student_status;
         $save_user = \App\Models\User::create($user);

            // save Student
         $data = $request->all();
         $data['student_insert_time'] = date('Y-m-d H:i:s');
         $data['student_insert_by'] = \Auth::user()->id;

         /* if upload photo student */
         if(!empty($request->get('student_photo')))
         {
            $image = $request->get('student_photo');
            $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            \Image::make($request->get('student_photo'))->save(public_path('image_student/').$name);
            $data['student_photo'] = $name;
        }

        $data['user_id'] = $save_user->id;
        $data['student_id_card']=$this->generate_id_student();

        $save_student = M_student::create(array_except($data,['password','username']));


               // Save user for parent
        $u_ex = explode(' ',$request->student_name);
        $user_parent['username'] = 'PA'.$u_ex[0].date('dms');
        $user_parent['password'] = bcrypt('epis123');
        $user_parent['user_status'] = $request->student_status;
        $save_user_parent = \App\Models\User::create($user_parent);


            // Save Parent
        $parent['user_id'] = $save_user_parent->id;
        $parent['student_id'] = $save_student->student_id;
        $parent['parent_name'] = $save_student->student_name;
        $parent['parent_id_card'] = $this->generate_id_parent();
        $parent['parent_status'] = $save_student->student_status;
        \App\Models\M_parent::create($parent);

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
        return $student = M_student::with('user')->find($id);
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
            'student_name'=>'required',
            'user_status'=>'required',
            'student_nisn'=>'required',
            'student_gender'=>'required',
            'unit_id'=>'required',
            'class_grade_id'=>'required',
        ]);



        \DB::beginTransaction();
        try {
            // update Student
            $data = $request->all();
            $data['student_update_time'] = date('Y-m-d H:i:s');
            $data['student_update_by'] = \Auth::user()->id;


            $update = M_student::find($id);



            /* if upload photo student */
            if(!empty($request->get('student_photo')))
            {
                $image = $request->get('student_photo');
                $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                \Image::make($request->get('student_photo'))->save(public_path('image_student/').$name);
                $data['student_photo'] = $name;
            }

            $update->update(array_except($data,['password','username','user_status']));


            // update User
            $user['username'] = $request->username;
            $user['user_status'] = $request->user_status;

            $update_user = \App\Models\User::find($update->user_id);
            $update_user->update($user);

            \DB::commit();
            return BaseException::jsonSuccessResponse();
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1', $e->getMessage());
        }




        $data = $request->all();
        
        $data['student_update_time'] = date('Y-m-d H:i:s');
        
        
        $update = M_student::find($id);
        $update->update($request->except('student_id'));


        if($update)
        {
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
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


                $student = M_student::find($id);


                $data['student_delete_time'] = date('Y-m-d H:i:s');
                $data['student_delete_by'] = \Auth::user()->id;
                $data['student_status'] = 'deactive';
                $student->update($data);


                $user = \App\Models\User::find($student->user_id);
                $data['user_status'] = 'deactive';
                $user->update($data);




                $parent = \App\Models\M_parent::where('student_id',$id);
                $data_parent['parent_delete_time'] = date('Y-m-d H:i:s');
                $data_parent['parent_delete_by'] = \Auth::user()->id;
                $data_parent['parent_status'] = 'deactive';
                $parent->update($data_parent);

             

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




    public function student_upload(Request $request)
    {
       $validate = $request->validate([
        'file_excel'=>"required|mimes:xls,xlsx|max:500",
        'unit_id'=>'required',
        'class_grade_id'=>'required',
    ]);



       $dt = \Excel::toArray(new Student, $request->file('file_excel')); 
       $count_row = count($dt[0]);
       $count_column = count($dt[0][0]);
       // dd($dt[0][1][3]);
       \DB::beginTransaction();
       try {    

        for($i=1;$i < $count_row; $i++)
        {
            // dd(                  $update["student_name"]= $dt[0][$i][4]);

                    // Save user for student
            $ex = M_student::where('student_nis',$dt[0][$i][3])->whereOr('student_nisn',$dt[0][$i][2])->first();
            if(!empty( $ex ) )
            {
                $update["student_status"]= 'active';
                $update["student_name"]= $dt[0][$i][1];
                $update["student_nisn"]= $dt[0][$i][2];
                $update["student_nis"]= $dt[0][$i][3];
                $update["student_religion"]= $dt[0][$i][4];
                $update["student_gender"]= $dt[0][$i][5];
                $update["student_birth_place"]= $dt[0][$i][6];
                $update["student_email"]= $dt[0][$i][7];
                $update["student_address"]= $dt[0][$i][8]; 


                $update['unit_id'] = $request->unit_id;
                $update['class_grade_id'] = $request->class_grade_id;
                
                
                $update['student_update_time'] = date('Y-m-d H:i:s');
                $update['student_update_by'] = \Auth::user()->id;
                $update_student =M_student::where('student_id',$ex->student_id)->update($update);
            }
            else
            {

                $u_ex = explode(' ',$dt[0][$i][1]);
                $user['username'] = $u_ex[0].date('dms');
                $user['password'] = bcrypt('123123');
                $user['user_status'] = 'active';
                $user['api_token'] = generateRandomString();
                $save_user = \App\Models\User::create($user);

                      // save student

                $data["student_status"]= 'active';
                $data["student_name"]= $dt[0][$i][1];
                $data["student_nis"]= $dt[0][$i][2];
                $data["student_nis"]= $dt[0][$i][3];
                $data["student_religion"]= $dt[0][$i][4];
                $data["student_gender"]= $dt[0][$i][5];
                $data["student_birth_place"]= $dt[0][$i][6];
                $data["student_email"]= $dt[0][$i][7];
                $data["student_address"]= $dt[0][$i][8];


              
                $data['unit_id'] = $request->unit_id;
                $data['class_grade_id'] = $request->class_grade_id;


                $data['student_insert_time'] = date('Y-m-d H:i:s');
                $data['student_insert_by'] = \Auth::user()->id;


                $data['user_id'] = $save_user->id;
                $data['student_id_card']=$this->generate_id_student();
                $save_student =M_student::create($data);

            }

        }


        \DB::commit();
        return BaseException::jsonSuccessResponse(['data'=>'sucess']);
    } catch (\Exception $e) {
        \DB::rollback();
        return BaseException::jsonErrorResponse('1',$e->getMessage());    
    }
}

}
