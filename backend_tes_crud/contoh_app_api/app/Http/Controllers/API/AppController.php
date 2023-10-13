<?php
/*

    CLASS FOR GLOBAL SETTING MASTER ,
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class AppController extends Controller
{
    //
    /* API for get unit all */
    public function get_unit()
    {
        $data = 
        \App\Models\M_unit::all();
      
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }  

    public function get_unit_per_emp()
    {

        $get_unit = \DB::table('m_employee as a')
        ->join('users as b','a.user_id','b.id')
        ->join('employee_unit as c','a.employee_id','c.employee_id')
        ->join('m_unit as d','d.unit_id','c.unit_id')
        ->where('a.user_id',\Auth::user()->id)->get();

       

        return BaseException::jsonSuccessResponse(['data'=>$get_unit]);
    }
   

    /* API for get unit with class */
    public function get_unit_with_class(Request $request)
    {
        $data = \App\Models\M_class_grade::with('unit')->where('class_grade_id',$request->class_grade_id)->first();

        if($data)
        {
            return BaseException::jsonSuccessResponse($data);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
    /** add By Yud'z 28-11-2019 API for get tahun ajaran */
    public function get_unit_year()
    {
        $data = \App\Models\M_unit_year::where('unit_year_status', 'active')->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get Step Study */
    public function get_step_study()
    {
        $data = \App\Models\M_step_study::where('step_study_status', 'active')->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
    /* end */

     /* API for get class grade with unit id */
    public function get_class_grade(Request $request)
    {
        $data = \App\Models\M_class_grade::where('unit_id',$request->unit_id)->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get all data class grade  */
    public function get_class_grade_all()
    {
        $user = \Auth::user();

        $data=  \DB::table('m_employee as a') 
        ->select('class_grade_name','e.class_grade_id')
        ->join('teacher_setting as b','b.employee_id','a.employee_id')
        ->join('m_study_group as d','d.study_group_id','b.study_group_id')
        ->join('m_class_grade as e','e.class_grade_id','d.class_grade_id')
        ->join('users as c','c.id','a.user_id')
        ->where('c.id',$user->id)->get();



        $role =  \DB::table('m_employee as a') 
        ->join('users as b','b.id','a.user_id')
        ->join('roles as c','c.id','a.employee_role')
        ->where('b.id',$user->id)->first();




        $id = [];
        foreach ($data as $key => $value) {
            $id []= $value->class_grade_id;
        }


        if($role->name =='Admin')
        {
            $data = \App\Models\M_class_grade::all();
        }
        else
        {
            $data = \App\Models\M_class_grade::whereIn('class_grade_id',$id)->get();

        }




        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get data class room with unit id */
    public function get_class_room(Request $request)
    {
        $data = \App\Models\M_class_room::where('unit_id',$request->unit_id)->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get all data class room */
    public function get_class_room_all()
    {
        $data = \App\Models\M_class_room::all();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get gender */
    public function gender()
    {
        $data = \App\Models\Parlookup::where('category','gender')->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get religion */
    public function religion()
    {
        $data = \App\Models\Parlookup::where('category','religion')->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    } 

    /* API for get course */
    public function get_course()
    {
        $data = \App\Models\M_course::all();


        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get study group with class grade id */
    public function get_study_group(Request $request)
    {
        $data = \App\Models\M_study_group::where('class_grade_id',$request->class_grade_id)->get();
        // dd($data);

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


    /* API for get study group with study group   */
    public function get_study_group_all(Request $request)
    {
        $user = \Auth::user();

         $data=  \DB::table('m_employee as a') 
        ->select('study_group_name','d.study_group_id')
        ->join('teacher_setting as b','b.employee_id','a.employee_id')
        ->join('m_study_group as d','d.study_group_id','b.study_group_id')
        ->join('m_class_grade as e','e.class_grade_id','d.class_grade_id')
        ->join('users as c','c.id','a.user_id')
        ->where('c.id',$user->id)->get();


        $role =  \DB::table('m_employee as a') 
        ->join('users as b','b.id','a.user_id')
        ->join('roles as c','c.id','a.employee_role')
        ->where('b.id',$user->id)->first();

        $id = [];
        foreach ($data as $key => $value) {
            $id []= $value->study_group_id;
        }


        if($role->name =='Admin')
        {
            $data = \App\Models\M_study_group::where('class_grade_id',$request->class_grade_id)->get();
        }
        else
        {
            $data = \App\Models\M_study_group::whereIn('study_group_id',$id)->where('class_grade_id',$request->class_grade_id)->get();
        }

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }  

    /* API for get study group with id  */
    public function get_study_group_by_id(Request $request)
    {
        $data = \App\Models\M_study_group::where('study_group_id',$request->study_group_id)->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }  


    public function get_course_per_kd(Request $request)
    {

        $user = \Auth::user();
        $stepStudyActive = stepStudyActive();
        $yearActive = yearActive();

         $data=  \DB::table('m_employee as a') 
        ->select('d.course_id','d.course_name')
        ->join('teacher_setting as b','b.employee_id','a.employee_id')
        ->join('m_course as d','d.course_id','b.course_id')
        ->join('users as c','c.id','a.user_id')
        ->where('c.id',$user->id)->get();
       

        $id = [];
        foreach ($data as $key => $value) {
            $id []= $value->course_id;
        }


        if($request->type_kd =='non_tema')
        {

            $course_non_tema =  
               \DB::table('m_kd as a')
               ->select('g.course_id')
            ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
            ->join('m_course as g','g.course_id','c.course_id')
            ->join('quiz_per_kd as d','d.kd_id','a.kd_id')
            ->join('m_class_grade as e','e.class_grade_id','c.class_grade_id')
            ->where('d.type_question',$request->type_question)
            ->where('d.step_study_id',stepStudyActive())
            ->groupBy('g.course_id')
            ->get();
            $cs_non_tema  = [];
            foreach($course_non_tema as $cs)
            {
                $cs_non_tema[] = $cs->course_id;
            }
        }


        // dd($cs_non_tema);




        $cek_tematic = 
        \DB::table('structure_tematic as st')
        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
        ->join('m_kd as k','std.kd_id','k.kd_id')
        ->join('course_setting as cs','cs.course_setting_id','k.course_setting_id')
        ->join('m_course as c','cs.course_id','c.course_id')
        ->where('st.step_study_id',$stepStudyActive)
        ->where('st.study_group_id',$request->study_group_id)
        ->get();



        $course_id = [];
        foreach ($cek_tematic as $key => $value) 
        {
            $course_id[] = $value->course_id;
        }





        $role =  \DB::table('m_employee as a') 
        ->join('users as b','b.id','a.user_id')
        ->join('roles as c','c.id','a.employee_role')
        ->where('b.id',$user->id)->first();


        if($role->name =='Admin')
        {

            if($request->type_kd=='non_tema')
            {
                $data = \DB::table('m_course as a')
                ->select('a.course_id','a.course_name')
                ->join('course_setting as b','a.course_id','b.course_id')
                ->whereIn('a.course_id',$cs_non_tema)
                // ->groupBy('a.course_name','a.course_id')
                ->where('b.class_grade_id',$request->class_grade_id)
                ->where('unit_year_id',$yearActive)
                ->get();
            }
            else
            {
                $data = \DB::table('m_course as a')
                ->select('a.course_id','a.course_name')
                ->join('course_setting as b','a.course_id','b.course_id')
                // ->whereIn('a.course_id',$id)
                ->groupBy('a.course_name','a.course_id')
                ->where('b.class_grade_id',$request->class_grade_id)
                ->where('unit_year_id',$yearActive)
                ->get();

            }

              
        }
        else
        {

              $data = \DB::table('m_course as a')
            ->select('a.course_id','a.course_name')
            ->join('course_setting as b','a.course_id','b.course_id')
            ->whereIn('a.course_id',$id)
            ->groupBy('a.course_name','a.course_id')
            ->where('b.class_grade_id',$request->class_grade_id)
            ->where('unit_year_id',$yearActive)
            ->get();

        }


        if($data)
        {
            return BaseException::jsonSuccessResponse($data);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }


    }

    /* API for get course with rombel id */
    public function get_course_study_group_type(Request $request)
    {
        $yearActive = yearActive();

        $data = \DB::table('m_course as a')
        ->select('a.course_id','a.course_name','a.course_code')
        ->join('course_setting as b','a.course_id','=','b.course_id')
        ->join('m_kd as c','c.course_id','=','b.course_id')
        ->where('b.study_group_id',$request->study_group_id)
        ->where('c.kd_type',$request->kd_type)
        ->groupBy('a.course_name','a.course_id')
        ->get();
        
        if($data)
        {
            return BaseException::jsonSuccessResponse($data);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }  


    /* API for get course with rombel id per kd type */
    public function get_course_study_group(Request $request)
    {
        $yearActive = yearActive();
        $user = \Auth::user();

        $data=  \DB::table('m_employee as a') 
        ->select('class_grade_name','e.class_grade_id','course_id')
        ->join('teacher_setting as b','b.employee_id','a.employee_id')
        ->join('m_study_group as d','d.study_group_id','b.study_group_id')
        ->join('m_class_grade as e','e.class_grade_id','d.class_grade_id')
        ->join('users as c','c.id','a.user_id')
        ->where('c.id',$user->id)->get();

        // dd($data);
        // dd($data);


        $id = [];
        foreach ($data as $key => $value) {
            $id []= $value->course_id;
        }



        $role =  \DB::table('m_employee as a') 
        ->join('users as b','b.id','a.user_id')
        ->join('roles as c','c.id','a.employee_role')
        ->where('b.id',$user->id)->first();


        if($role->name =='Admin')
        {
             $data = \DB::table('m_course as a')
            ->select('a.course_id','a.course_name','a.course_code')
            ->join('course_setting as b','a.course_id','b.course_id')
            // ->whereIn('a.course_id',$id)
            ->groupBy('a.course_name','a.course_id')
            ->where('b.class_grade_id',$request->class_grade_id)
            ->where('unit_year_id',$yearActive)
            ->get();

        }
        else
        {

             $data = \DB::table('m_course as a')
            ->select('a.course_id','a.course_name','a.course_code')
            ->join('course_setting as b','a.course_id','b.course_id')
            ->whereIn('a.course_id',$id)
            ->groupBy('a.course_name','a.course_id')
            ->where('b.class_grade_id',$request->class_grade_id)
            ->where('unit_year_id',$yearActive)
            ->get();
        }

        // dd($data);


        

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }  

    /* API for get data student per class */
    public function get_student_by_class(Request $request)
    {
        $unit_year_id = yearActive();
        $cek = \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','=','b.student_id')
        ->where('a.class_grade_id',$request->class_grade_id)
        ->where('unit_year_id',$unit_year_id)
        ->whereNull('a.student_delete_time')
        ->get();


        if($cek->count() == 0 )
        {
            $result = \App\Models\M_student::where('class_grade_id',$request->class_grade_id)
            ->whereNull('student_delete_time');

            if(!empty($request->q))
            {
                $result->where('student_name','ilike','%'.$request->q.'%');
            }
            $data =   $result->paginate(10);
            
        }
        else
        {
           $get_student = \DB::table('m_student as a')
            ->join('study_group_setting as b','a.student_id','=','b.student_id')
            ->where('a.class_grade_id',$request->class_grade_id)
            ->where('unit_year_id',$unit_year_id)
            ->whereNull('a.student_delete_time')
            ->get();

            $student_id=[];
            foreach ($get_student as $key => $value) 
            {
                $student_id[] = $value->student_id;
            }

            $result = \App\Models\M_student::whereNotIn('student_id',$student_id)->where('class_grade_id',$request->class_grade_id)->whereNull('student_delete_time');

            if(!empty($request->q))
            {
                $result->where('student_name','ilike','%'.$request->q.'%');
            }
            
            $data=   $result->paginate(10);
        }

            
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


  
    /* API for get employee setting for setting teacher class */
    public function get_course_by_class(Request $request)
    {

        
        $cek = \DB::table('m_course as a')
        ->join('course_setting as b','a.course_id','=','b.course_id')
        ->where('b.class_grade_id',$request->class_grade_id)
        ->get();


        if(empty($cek) )
        {
            $result = \DB::table('m_course as a')
            ->join('course_setting as b','a.course_id','=','b.course_id');
            if(!empty($request->q))
            {
                $result->where('course_name','ilike','%'.$request->q.'%');
            }
            $data = $result->paginate(10);
        }
        else
        {
           $get_course = \DB::table('m_course as a')
            ->join('course_setting as b','a.course_id','b.course_id')
            ->where('b.class_grade_id',$request->class_grade_id)
            ->where('b.unit_year_id',yearActive())
            ->get();

            $course_id=[];
            foreach ($get_course as $key => $value) 
            {
                $course_id[] = $value->course_id;
            }

            $result = 
             \DB::table('m_course as a')
            ->whereNotIn('a.course_id',$course_id);


            if(!empty($request->q))
            {
                $result->where('course_name','ilike','%'.$request->q.'%');
            }

            
            $data=$result->paginate(10);

        }

            
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


    /* API for get employee setting for setting teacher class */
    public function get_course_by_class_drop(Request $request)
    {
        $data = \DB::table('m_course')
        // ->join('course_setting as b','a.course_id','=','b.course_id')
        ->where('class_grade_id',$request->class_grade_id)
        ->get();
        return $data;
    }

    /* API for get data KD */
    public function get_data_kd(Request $request)
    {
        $cek = \DB::table('course_setting as a')
        ->join('m_kd as b','a.course_setting_id','=','b.course_setting_id')
        ->join('m_kd_detail as c','c.kd_id','=','b.kd_id')
        ->where('c.step_study_id',$request->step_study_id)
        ->get();

        if($cek->count() == 0 )
        {

            
            $result = \DB::table('m_kd as a')
            ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
            ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
            ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
            ->join('m_course as g','g.course_id','c.course_id')
            ->orderBy('kd_id','desc');


            if(!empty($request->q))
            {
                if( ( !empty($request->course_id) )  && ( !empty($request->class_grade_id) ) )
                {
                    $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->class_grade_id))
                {
                    $result->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->course_id))
                {
                    $result->where('c.course_id',$request->course_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else
                {
                    $result->where('kd_code','ilike','%'.$request->q.'%')->orWhere('kd_type','%'.$request->q.'%');
                }
                
            }
            else if( ( !empty($request->course_id) )  &&  ( !empty($request->class_grade_id) ) )
            {
                
                $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id);

            }
            else if(!empty($request->class_grade_id))
            {
                
                $result->where('f.class_grade_id',$request->class_grade_id);
            }
            else if(!empty($request->course_id))
            {
                
                $result->where('c.course_id',$request->course_id);   
            }
            

            $data = $result->paginate(10);
            
            
        }
        else
        {
        	
            $get_kd = \DB::table('course_setting as a')
            ->join('m_kd as b','a.course_setting_id','=','b.course_setting_id')
            ->join('m_kd_detail as c','c.kd_id','=','b.kd_id')
            ->where('c.step_study_id',$request->step_study_id)
            ->get();

            $kd_id=[];
            foreach ($get_kd as $key => $value) 
            {
                $kd_id[] = $value->kd_id;
            }


            $result = \DB::table('m_kd as a')
            ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
            ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
            ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
            ->join('m_course as g','g.course_id','c.course_id')
            ->whereNotIn('kd_id',$kd_id)
            ->orderBy('kd_id','desc');

            // $result = \App\Models\M_kd::with(['unit_year','course'])->whereNotIn('kd_id',$kd_id);
            if(!empty($request->q))
            {
                if( ( !empty($request->course_id) )  && ( !empty($request->class_grade_id) ) )
                {
                    $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->class_grade_id))
                {
                    $result->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->course_id))
                {
                    $result->where('c.course_id',$request->course_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else
                {
                    $result->where('kd_code','ilike','%'.$request->q.'%')->orWhere('kd_type','%'.$request->q.'%');
                }
                
            }
            else if( ( !empty($request->course_id) )  &&  ( !empty($request->class_grade_id) ) )
            {
                
                $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id);

            }
            else if(!empty($request->class_grade_id))
            {
                
                $result->where('f.class_grade_id',$request->class_grade_id);
            }
            else if(!empty($request->course_id))
            {
                
                $result->where('c.course_id',$request->course_id);   
            }
            

            
            $data=$result->paginate(5);
        }

            
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get step study active / tahapan belajar yang aktif */
    public function get_step_study_active()
    {
        $year_id =  \App\Models\M_unit_year::where('unit_year_status','active')->first();
    
        $data = \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',$year_id->unit_year_id)->first(); 
            

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    } 

    /* API for get class to setting wali kelas */
    public function get_class_advisor(Request $request)
    {
        $unit_year_id = yearActive();
        $result = \DB::table('m_study_group as a')
        ->select('a.study_group_id','a.study_group_name','c.employee_id','c.employee_name','class_advisor_insert_time','b.class_advisor_id')
        ->join('class_advisor as b','a.study_group_id','=','b.study_group_id','left')
        ->join('m_employee as c','c.employee_id','=','b.employee_id','left')
        ->where('a.class_grade_id',$request->class_grade_id);
        if(!empty($request->q))
        {
            $result->where('a.study_group_name','ilike','%'.$request->q.'%');
        }
        $data = $result->paginate(10);
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    } 

    /* API for get employee setting for setting wali kelas */
    public function get_employee_advisor(Request $request)
    {
        $unit_year_id = yearActive();
        $data = \DB::table('m_study_group as a')
        ->leftJoin('class_advisor as b','a.study_group_id','=','b.study_group_id')
        ->leftJoin('m_employee as c','c.employee_id','=','b.employee_id')
        ->get();

        $employee_id =[];
        foreach($data as $d)
        {
            if(!empty($d->employee_id))
            {
                $employee_id[] = $d->employee_id;    
            }
        }
        

        $result = [];
        if(!empty($employee_id))
        {
            $result = \App\Models\M_employee::whereNotIn('employee_id',$employee_id)
            ->where('employee_status','active')
            ;
            if(!empty($request->q))
            {
                $result->where('employee_name','ilike','%'.$request->q.'%');
            }

            $result = $result->paginate(10);
        }
        else
        {
            $result = \App\Models\M_employee::where('employee_status','active');
            if(!empty($request->q))
            {
                $result->where('employee_name','ilike','%'.$request->q.'%');
            }
            $result = $result->paginate(10);

        }

        if($result)
        {
            return BaseException::jsonSuccessResponse(['data'=>$result]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    } 

    /* API for get menu parent */
    public function get_menu_parent(Request $request)
    {
       

        $user = request()->user();
        $karyawan = \App\Models\M_employee::where('user_id',$user->id)->first();
        $sub = [];

        $parent=[];
         $data = 
            \DB::table('menu as a')
            ->join('permissions as b','a.menu_id','b.menu_id')
            ->join('role_has_permissions as c','c.permission_id','b.id')
            ->orderBy('a.no_urut','asc')
            ->where('c.role_id',$karyawan->employee_role)
            ->get();

        foreach ($data as $key => $value) 
        {
           
            $data_sub = 
            \DB::table('menu as a')
            ->join('permissions as b','a.menu_id','b.menu_id')
            ->where('menu_parent',$value->menu_id)
            ->orderBy('a.no_urut','asc')
            ->get();


            if( count($data_sub) >0 )
            {   
               foreach ($data_sub as $key => $val) {
                    $parent[$value->menu_name][$val->menu_url] =     

                     $val->menu_name;
                }
            }
        }

      
        return response()->json(['data'=>$parent ]);
    }  


    /* API for get menu */
    public function get_menu()
    {
        $data = \App\Models\Menu::where('menu_parent','0')->where('menu_url','!=','#')->get();
        return BaseException::jsonSuccessResponse($data);
    } 


 /* API for get menu */
    public function get_role()
    {
        $data = \App\Models\Role::all();
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    } 

       /* API for get menu */
    public function get_menu_all()
    {
        $parent=[];
        $data = \App\Models\Menu::all();
        foreach ($data as $key => $value) 
        {
           
            $data_sub = \App\Models\Menu::where('menu_parent',$value->menu_id)->get();

            if( count($data_sub) >0 )
            {   
               foreach ($data_sub as $key => $val) {
                    $parent[$value->menu_id.'-'.$value->menu_name]['sub'][] =     
                    [ $val->menu_id.'-'.$val->menu_name ] ;
                }
            }
            else
            {
                $parent[$value->menu_id.'-'.$value->menu_name]['sub'][]='';                
            }

        }

        return BaseException::jsonSuccessResponse(['data'=>$parent]);
    }

    /* API for get employee setting for setting teacher class */
    public function get_employee_setting(Request $request)
    {
        $unit_year_id = yearActive();
        $cek = \DB::table('m_employee as a')
        ->join('teacher_setting as b','a.employee_id','=','b.employee_id');
        if($request->employee_id != 0)
        {
            $cek->where('employee_id',$request->employee_id);
        }
        $cek = $cek->where('unit_year_id',$unit_year_id)
        ->where('course_id',$request->course_id)
        ->whereNull('a.employee_delete_time')
        ->get();


        if($cek->count() == 0 )
        {
            $result = \App\Models\M_employee::query();
            if($request->employee_id != 0)
            {
                $result->where('employee_id',$request->employee_id);
            }
            $result = $result->whereNull('employee_delete_time');

            if(!empty($request->q))
            {
                $result = $result->where('employee_name','ilike','%'.$request->q.'%');
            }
            $data = $result->paginate(10);
        }
        else
        {
            $result = \App\Models\M_employee::whereNull('employee_delete_time');

            if(!empty($request->q))
            {
                $result->where('employee_name','ilike','%'.$request->q.'%');
            }
            $data=$result->paginate(10);
        }
            
        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get tematic with id */
    public function  get_tematic_active(Request $request)
    {
    	$stepStudyActive= stepStudyActive();
        $data = \App\Models\Structure_tematic::where('step_study_id',$stepStudyActive)->find($request->id);

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /* API for get tematic with id */
    public function  get_tematic_group(Request $request)
    {
    	$stepStudyActive= stepStudyActive();
        $data = \App\Models\Structure_tematic::where('class_grade_id',$request->class_grade_id)->where('step_study_id',$stepStudyActive)->get();

        if($data)
        {
            return BaseException::jsonSuccessResponse(['data'=>$data]);
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
 
    
    /* API for get course by id*/
    public function get_course_by_study_group(Request $request)
    {
        return \DB::table('m_course  as a')
        ->join('course_setting as b','a.course_id','b.course_id')
        ->where('b.class_grade_id',$request->id)
        ->get();
    }


    /* API FOR get all KD */
    public function get_all_kd(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        return \DB::table('m_kd  as a')
        ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        ->where('step_study_id',$stepStudyActive)
        ->where('course_id',$request->course_id)
        ->where('kd_type',$request->kd_type)
        ->get();
    }

    /* API FOR get month in absensi */
    public function get_month(Request $request)
    {
        $unit_year_id = yearActive();
        $data =  \App\Models\M_step_study::where('unit_year_id',$unit_year_id)
        ->selectRaw(" extract(month from step_study_start ) as start, extract(month from step_study_end ) as end  ")
        ->where('step_study_status','active')
        ->first();

        $month=[];

        for($i = $data->start ; $i <= $data->end ; $i++)
        {
            $month [] = (int)$i;
        }

        return $month;
    }


 /* API FOR get type fisik untuk input fisik / fisik siswa */
    public function get_type_fisik(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','Fisik')
        ->get();
        return $data;
    }


/* API FOR get type fisik untuk input fisik / kesehatan siswa */
    public function get_type_kes(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','Kesehatan')
        ->get();
        return $data;
    }

/* API FOR get data ekstrakurikuler */
    public function get_ekstrakurikuler(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','ekstrakurikuler')
        ->get();
        return $data;
    }

/* API FOR get data observasi spritual */
    public function get_observasi_spiritual(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','spiritual')
        ->get();
        return $data;
    }

/* API FOR get data observasi sosial */
    public function get_observasi_sosial(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','sosial')
        ->get();
        return $data;
    }


/* API FOR get data Penilaian diri sendiri spritual */
    public function get_pd_spiritual(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','spiritual')
        ->get();
        return $data;
    }

/* API FOR get data Penilaian diri sendiri sosial */
    public function get_pd_sosial(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','sosial')
        ->get();
        return $data;
    }


/* API FOR get data Penilaian antar teman spritual */
    public function get_friendly_value_spiritual(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','spiritual')
        ->get();
        return $data;
    }

/* API FOR get data Penilaian antar teman sosial */
    public function get_friendly_value_sosial(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','sosial')
        ->get();
        return $data;
    }
    

/* API FOR get data tahsin di parlookup */
    public function get_tahsin(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','tahsin')
        ->get();
        return $data;
    }
    

/* API FOR get data tahfizh di parlookup */
    public function get_tahfizh(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','tahfizh')
        ->get();
        return $data;
    }
    

/* API FOR get data personality di parlookup */
    public function get_personality(Request $request)
    {
        $data =  \App\Models\Parlookup::where('category','personality')
        ->get();
        return $data;
    }
    


/* API FOR get data employee unit di parlookup */
    public function get_employee_unit(Request $request)
    {
        $data =  
        \DB::table('m_unit as a')
        ->join('employee_unit as b','a.unit_id','b.unit_id')
        ->where('employee_id',$request->employee_id)
        ->get();
        return $data;
    }
    

/* API FOR get data course by id di parlookup */
    public function get_course_by_id(Request $request)
    {
        $data = \DB::table('m_course as a')
        ->select('a.course_name','a.course_id','b.course_setting_id')
        ->join('course_setting as b','a.course_id','=','b.course_id')
        ->join('m_class_grade as d','d.class_grade_id','=','b.class_grade_id')
        ->where('d.class_grade_id',$request->class_grade_id)
        ->get();

        return $data;
    }



    public function get_total_pd(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $pd = \App\Models\PD::
        where('step_study_id',stepStudyActive())
        ->get();

        $spiritual=  \App\Models\Parlookup::where('category','spiritual')->get();

        $sosial =  \App\Models\Parlookup::where('category','sosial')->get();
 
        return response()->json(['spiritual'=>$spiritual,'sosial'=>$sosial,'data_pd'=>$pd]);
    }

    public function get_total_daily_exercise(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $daily_exercise = \App\Models\Daily_exercise::
        where('step_study_id',stepStudyActive())
        ->get();

        $structure_tematic = \App\Models\Structure_tematic::where('class_grade_id',$request->class_grade_id)->where('step_study_id',$stepStudyActive)->get();

         $dt_k =  \DB::table('m_kd  as a')
        ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->where('c.class_grade_id',$request->class_grade_id)
        ->where('step_study_id',$stepStudyActive)
        ->where('c.course_id',$request->course_id)
        ->where('kd_type',$request->kd_type);

     
        $tot_d = count($dt_k->get());

     

        $data_kd2 = 
        \DB::table('m_kd  as a')
        ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->where('step_study_id',$stepStudyActive)
        ->where('c.course_id',$request->course_id)
        ->where('kd_type',$request->kd_type)
        ->where('c.class_grade_id',$request->class_grade_id)
        ->orderBy('a.kd_code','asc')
        // ->take($tot_d-1)
        ->get();

        return response()->json(['data_daily_exercise'=>$daily_exercise,'structure_tematic'=>$structure_tematic,'dt_k'=>$dt_k->get(),'tot_d'=>$tot_d,'data_kd2'=>$data_kd2]);
    }

    public function get_total_daily_exercise_skill(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $daily_exercise = \App\Models\Daily_exercise_skill::
        where('step_study_id',stepStudyActive())
        ->get();

        $structure_tematic = \App\Models\Structure_tematic::where('study_group_id',$request->study_group_id)->where('step_study_id',$stepStudyActive)->get();

       
        $dt_k = \DB::table('m_kd as a')
        ->join('m_kd_detail as b','b.kd_id','a.kd_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as d','d.course_id','c.course_id')
        ->where('c.class_grade_id',$request->class_grade_id)
        ->where('step_study_id',$stepStudyActive)
        ->where('c.course_id',$request->course_id)
        ->where('kd_type',$request->kd_type)->get();


        return response()->json(['dt_k'=>$dt_k]);
    }

    public function get_total_tahsin(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $tahsin = \App\Models\Tahsin::
        where('step_study_id',stepStudyActive())
        ->get();

        $tahsin_type =  \App\Models\Parlookup::where('category','tahsin')->get();
 
        return response()->json(['tahsin_type'=>$tahsin_type,'data_tahsin'=>$tahsin]);
    }


    public function get_total_tahfizh(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $tahfizh = \App\Models\Tahfizh::
        where('step_study_id',stepStudyActive())
        ->get();

        $tahfizh_type =  \App\Models\Parlookup::where('category','tahfizh')->get();
 
        return response()->json(['tahfizh_type'=>$tahfizh_type,'data_tahfizh'=>$tahfizh]);
    }

    public function get_total_personality(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $personality = \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->get();

        $personality_type =  \App\Models\Parlookup::where('category','personality')->get();
 
        return response()->json(['personality_type'=>$personality_type,'data_personality'=>$personality]);
    }

    /* API get data kd all by course */
    public function get_data_kd_course(Request $request)
    {

        $stepStudyActive = stepStudyActive();
        if($request->type == 'per_kd')
        {

            if($request->type_tema == 'tematic')
            {
                $data_ex = \DB::table('structure_tematic_detail as a')
                ->join('structure_tematic as b','b.structure_tematic_id','a.structure_tematic_id')
                ->join('m_kd_detail as c','c.kd_id','a.kd_id')
                ->join('m_kd as d','d.kd_id','c.kd_id')
                ->join('course_setting as e','e.course_setting_id','d.course_setting_id')
                ->where('e.class_grade_id',$request->class_grade_id)
                ->where('d.kd_type','Pengetahuan')
                ->where('b.step_study_id',$stepStudyActive)
                ->where('a.type_question',$request->type_question)
                ->get();

                $vl_ex = [];
                foreach ($data_ex as $key => $value) {
                    # code...
                    $vl_ex[]=$value->kd_id; 
                }

                
            }
            else
            {

                $data_ex = \DB::table('quiz_per_kd as a')
                ->leftJoin('m_kd_detail as b','b.kd_id','a.kd_id')
                ->join('m_kd as c','c.kd_id','b.kd_id')
                ->join('course_setting as d','d.course_setting_id','c.course_setting_id')
                ->where('d.class_grade_id',$request->class_grade_id)
                ->where('c.kd_type','Pengetahuan')
                ->where('b.step_study_id',$stepStudyActive)
                ->where('a.type_question',$request->type_question)
                ->get();

                $vl_ex = [];
                foreach ($data_ex as $key => $value) {
                    # code...
                    $vl_ex[]=$value->kd_id; 
                }

            }

            // dd($vl_ex);

            // dd($stepStudyActive);
            $data =  
            \DB::table('m_kd as a')
            ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
            ->join('m_course as g','g.course_id','c.course_id')
            ->join('m_kd_detail as h','h.kd_id','a.kd_id')
            ->where('g.course_id',$request->course_id)
            ->where('step_study_id',$stepStudyActive)
            ->where('c.class_grade_id',$request->class_grade_id)
            ->where('kd_type','Pengetahuan')
            ->whereNotIn('h.kd_id',$vl_ex)
            ->get();

            return $data;
        }
        else
        {
            if($request->type_tema == 'tematic')
            {
                $data_ex = \DB::table('structure_tematic_detail as a')
                ->join('structure_tematic as b','b.structure_tematic_id','a.structure_tematic_id')
                ->join('m_kd_detail as c','c.kd_id','a.kd_id')
                ->join('m_kd as d','d.kd_id','c.kd_id')
                ->join('course_setting as e','e.course_setting_id','d.course_setting_id')
                ->where('e.class_grade_id',$request->class_grade_id)
                ->where('b.step_study_id',$stepStudyActive)
                ->where('a.type_question',$request->type_question)
                ->get();

                $vl_ex = [];
                foreach ($data_ex as $key => $value) {
                    # code...
                    $vl_ex[]=$value->kd_id; 
                }
            }
            else
            {
                 $data_ex = \DB::table('quiz_per_kd as a')
                ->join('m_kd_detail as b','b.kd_id','a.kd_id')
                ->join('m_kd as c','c.kd_id','b.kd_id')
                ->where('a.step_study_id',$stepStudyActive)
                ->join('course_setting as d','d.course_setting_id','c.course_setting_id')
                ->where('d.class_grade_id',$request->class_grade_id)

                ->where('a.type_question',$request->type_question)
                ->get();

                $vl_ex = [];
                foreach ($data_ex as $key => $value) {
                    # code...
                    $vl_ex[]=$value->kd_id; 
                }
            }
        

            $data =  
            \DB::table('m_kd as a')
            ->select('h.kd_id','a.kd_code','a.kd_name','a.kd_type')
            ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
            ->join('m_course as g','g.course_id','c.course_id')
            ->join('m_kd_detail as h','h.kd_id','a.kd_id')
            
            ->where('g.course_id',$request->course_id)
            ->where('step_study_id',$stepStudyActive)
            ->where('c.class_grade_id',$request->class_grade_id)
            ->whereNotIn('h.kd_id',$vl_ex)
            ->get();



            return $data;
        }
     
    }
    

    /* API get data kd all by course */
    public function get_list_question_per_kd(Request $request)
    {
        $stepStudyActive = stepStudyActive();

        $data =  
      
        \DB::table('quiz_per_kd as b')
        ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        ->where('b.quiz_per_kd_id',$request->quiz_per_kd_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();
        
        return $data;
    }


     /* API get data kd all by course */
    public function get_total_absensi(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $absen = \App\Models\Absensi::
        where('step_study_id',stepStudyActive())
        ->get();

        $unit_year_id = yearActive();
        $data =  \App\Models\M_step_study::where('unit_year_id',$unit_year_id)
        ->where('step_study_status','active')
        ->first();

   
        $month=[];
        $start = strtotime($data->step_study_start);
        $end = strtotime($data->step_study_end);
        while($start < $end)
        {
            $month[] = (int)date('m',$start);
            $start = strtotime("+1 month", $start);
        }


        return response()->json(['month'=>$month,'absen'=>$absen]);
    }


     /* API get data kd all by course */
    public function get_total_extracurricular(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $extra = \App\Models\Extracurricular::
        where('step_study_id',stepStudyActive())
        ->get();

        $category =  \App\Models\Parlookup::where('category','ekstrakurikuler')
        ->get();
 
        return response()->json(['category'=>$category,'extra'=>$extra]);
    }

     /* API get data kd all by course */
    public function get_total_prestation(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $extra = \App\Models\Prestation::
        where('step_study_id',stepStudyActive())
        ->get();

        $category =  \App\Models\Parlookup::where('category','prestation')
        ->get();
 
        return response()->json(['category'=>$category,'extra'=>$extra]);
    }

     /* API get data kd all by course */
    public function get_total_teacher_note(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $extra = \App\Models\TeacherNote::
        where('step_study_id',stepStudyActive())
        ->get();

        $category =  \App\Models\Parlookup::where('category','prestation')
        ->get();
 
        return response()->json(['category'=>$category,'extra'=>$extra]);
    }

     /* API get data kd all by course */
    public function get_total_observasi(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $observasi = \App\Models\Observasi::
        where('step_study_id',stepStudyActive())
        ->get();

        $spiritual=  \App\Models\Parlookup::where('category','spiritual')->get();

        $sosial =  \App\Models\Parlookup::where('category','sosial')->get();
 
        return response()->json(['spiritual'=>$spiritual,'sosial'=>$sosial,'data_observasi'=>$observasi]);
    }

     /* API get data kd all by course */
    public function get_total_friendly_value(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $friendly_value = \App\Models\FriendlyValue::
        where('step_study_id',stepStudyActive())
        ->get();

        $spiritual=  \App\Models\Parlookup::where('category','spiritual')->get();

        $sosial =  \App\Models\Parlookup::where('category','sosial')->get();
 
        return response()->json(['spiritual'=>$spiritual,'sosial'=>$sosial,'data_friendly_value'=>$friendly_value]);
    }


    /// API GET ALL KD 
    public function get_kd()
    {
        $stepStudyActive = stepStudyActive();
        $data =  
         \DB::table('m_kd_detail as a')
        ->join('m_kd as b','b.kd_id','a.kd_id')
        ->where('step_study_id',$stepStudyActive)
        ->get();
        return $data;   
    }   

    /// API GET ALL KD 
    public function get_first_kd(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $data =  
        \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_course as c','c.course_id','z.course_id')
        // ->where('b.type_question','uts')
        ->where('z.course_id',$request->course_id)
        ->where('z.kd_id',$request->kd_id)
        ->where('z.class_grade_id',$request->class_grade_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->first();
        return response()->json(['data'=>$data]);   
    }
    
  /// API  input analysis harian 
    public function get_daily_tema(Request $request)
    {
        $q = $request->id;
        $stepStudyActive = stepStudyActive();


        $data = \DB::table('list_question_per_tema as a')
        ->join('structure_tematic_detail as z','z.structure_tematic_detail_id','a.structure_tematic_detail_id')
        ->where('z.kd_id',$request->id)
        ->where('z.type_question','daily')
        ->where('z.step_study_id',$stepStudyActive)
        ->orderBy('list_question_per_tema_id','asc')
        ->get();
  
        return $data;
    }
    


  /// API  input analysis uts
    public function get_uts_tema(Request $request)
    {
        $q = $request->id;
        $stepStudyActive = stepStudyActive();

      


        $data = \DB::table('list_question_per_tema as a')
        ->join('structure_tematic_detail as z','z.structure_tematic_detail_id','a.structure_tematic_detail_id')
        ->where('z.kd_id',$request->id)
        ->where('z.type_question','uts')
        ->where('z.step_study_id',$stepStudyActive)
        ->orderBy('list_question_per_tema_id','asc')
        ->get();

        return $data;
    }

    
  /// API  input analysis uas
    public function get_uas_tema(Request $request)
    {
        $q = $request->id;
        $stepStudyActive = stepStudyActive();

        $data = \DB::table('list_question_per_tema as a')
        ->join('structure_tematic_detail as z','z.structure_tematic_detail_id','a.structure_tematic_detail_id')
        ->where('z.kd_id',$request->id)
        ->where('z.type_question','uas')
        ->where('z.step_study_id',$stepStudyActive)
        ->orderBy('list_question_per_tema_id','asc')
        ->get();

      
        return $data;
    }

    // get for list student per rombel
    public function get_study_group_setting(Request $request)
    {
        $unit_year_id = yearActive();
        $result =  
    
        \DB::table('m_student as a')
        ->select('a.student_id','a.student_name','a.student_gender')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)
        ->orderBy('a.student_name','ASC')
        ->get();
        return $result;
    }

     /* API get data list question n total kd  */
    public function get_list_question_n_total_kd(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('m_kd as a')
        ->join('m_kd_detail as d','d.kd_id','a.kd_id')
        ->join('quiz_per_kd as b','b.kd_id','d.kd_id')
        ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        ->where('b.type_question','daily')
        ->where('b.kd_id',$request->kd_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    } 



     /* API get data list question n total kd  */
    public function get_list_question_n_total_kd_uts(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_kd_detail as d','d.kd_id','a.kd_id')
        ->join('quiz_per_kd as b','b.kd_id','d.kd_id')
        ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        ->where('b.type_question','uts')
        ->where('z.course_id',$request->course_id)
        ->where('z.class_grade_id',$request->class_grade_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();


        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    } 


     /* API get data list question n total kd  */
    public function get_list_question_n_total_kd_uas(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_kd_detail as d','d.kd_id','a.kd_id')
        ->join('quiz_per_kd as b','b.kd_id','d.kd_id')
        ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        ->where('b.type_question','uas')
        ->where('z.course_id',$request->course_id)
        ->where('z.class_grade_id',$request->class_grade_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();


        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    } 


    /* API get data list question n total kd daily  */
    public function get_list_question_n_total_tema(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('a.step_study_id',$stepStudyActive)
        ->where('b.type_question','daily')
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    }



   /* API get data list question n total kd uts */
    public function get_list_question_n_total_tema_uts(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('a.step_study_id',$stepStudyActive)
        ->where('b.type_question','uts')
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    }

   /* API get data list question n total kd uts */
    public function get_list_question_n_total_physical_stu(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $data =  \App\Models\PhysicalStudent::where('step_study_id',$stepStudyActive)->get();
        $fisik =  \App\Models\Parlookup::where('category','Fisik')
        ->get();
        $kesehatan =  \App\Models\Parlookup::where('category','Kesehatan')
        ->get();
       

        return response()->json(['data_physical'=>$data,'fisik'=>$fisik,'kesehatan'=>$kesehatan]);
    }


   /* API get data list question n total kd uas */
    public function get_list_question_n_total_tema_uas(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('b.type_question','uas')
        ->where('a.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    }



   /* API get data list question n total kd uts */
    public function get_value_physical_student(Request $request)
    {
        $stepStudyActive = stepStudyActive();
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('b.type_question','uts')
        ->where('a.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }


        return response()->json(['list_question'=>$list_question,'total'=>$total]);
    }


   /* API get data list question n total kd uts */
    public function get_year_step_active(Request $request)
    {
        return stepStudyActiveJson();
    }


    public function get_list_user(Request $request)
    {
        $user = request()->user();



        $permission = [];
        foreach (\App\Models\Permission::all() as $key => $value) 
        {
            if(!empty($value->name))
            {
                if(request()->user()->can($value->name))
                {
                    $permission[] =  $value->name;
                }    
            }
            
        }

        return response()->json(['status'=>'success','user'=>$user]);
    }

    public function validation_check(Request $request)
    {
        $data = \App\Models\Class_advisor::where('study_group_id',$request->study_group_id)->first();
        if(empty($data))
        {
            return response()->json(['status'=>'success','message'=>'Wali Kelas Belum di Tetapkan'],422);
        }
    }

    public function view_summary(Request $request)
    {

        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();
        $q = $request->class_grade_id;


        $data_siswa = \DB::table('study_group_setting as a')
        ->join('m_student as b','b.student_id','a.student_id')
        ->join('m_study_group as c','c.study_group_id','a.study_group_id')
        ->join('m_class_grade as d','d.class_grade_id','c.class_grade_id')
        ->where('b.class_grade_id',$request->class_grade_id)
        ->where('a.study_group_id',$request->study_group_id)
        ->where('a.unit_year_id',$unit_year_id)
        ->orderBy('b.student_name','ASC')
        ->get();



        $study_group = \App\Models\M_study_group::with('class_grade')->where('study_group_id',$request->study_group_id)->first();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$request->study_group_id)
        ->first();


        $cek_tematic = 
        \DB::table('structure_tematic as st')
        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
        ->join('m_kd as k','std.kd_id','k.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','k.course_setting_id')
        ->join('m_course as c','cd.course_id','c.course_id')
        ->where('st.step_study_id',$stepStudyActive)
        ->where('c.course_id',$request->course_id)
        ->where('cd.unit_year_id',$unit_year_id)
        ->first();

        $course_setting_pengetahuan = 
        \DB::table('m_kd as mk')
        ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
        ->join('m_course as c','c.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('c.course_id',$request->course_id)
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('md.step_study_id',$stepStudyActive)
        ->where('kd_type','Pengetahuan')
        ->get();




    	$course_setting_keterampilan = 
        \DB::table('m_kd as mk')
        ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
        ->join('m_course as c','c.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('c.course_id',$request->course_id)
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('md.step_study_id',$stepStudyActive)
        ->where('kd_type','Keterampilan')
        ->get();
        

        $summary_skill=[];
        $tb = '';


        if(!empty($cek_tematic))
        {
            #tematik

            $course_name = '';
            if( ( count($course_setting_pengetahuan) != 0 )  &&  ( count($course_setting_keterampilan) != 0  ) )
            {
                $course_name = ( count($course_setting_pengetahuan) == 0 )  ?  0 : $course_setting_pengetahuan[0]->course_name;   
            }
            else
            {
                $course_name = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_name;   
            }


            $tb='<table ref="table" id="loremTable" border="1" summary="Input analisis" class="table table-bordered">
            <thead>

                <tr>
                    <th style="font-weight:bold; ">Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; "> '. $walas->study_group->study_group_name  .'  </th>
                </tr>
                <tr>
                    <th style="font-weight:bold; ">Wali Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; ">  '. $walas->employee->employee_name  .'  </th>
                </tr> 

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                
                <tr>
                    <th rowspan ="4" >No</th>
                    <th rowspan ="4" >ID</th>
                    <th rowspan ="4"  style="text-align:center"> Nama </th>
                    <th colspan="20" style="text-align: center;"> Rekapitulasi Nilai '.$course_name.' </th>
                </tr>
                <tr>
                    <th style="text-align: center;" colspan="'.count($course_setting_pengetahuan).'" rowspan="2"> Pengetahuan </th>
                    <th colspan="2"  style="text-align: center;">Tertinggi</th>
                    <th colspan="2"  style="text-align: center;">Terendah</th>
                    <td  style="text-align: center;" rowspan ="3"  >NA</td>
                    <td  style="text-align: center;"  rowspan ="3"  >P</td>
                    <th style="text-align: center;" colspan="'.count($course_setting_keterampilan).'" rowspan="2"> Keterampilan </th>
                    <th colspan="2"  style="text-align: center;">Tertinggi</th>
                    <th colspan="2"  style="text-align: center;">Terendah</th>
                    <td  style="text-align: center;" rowspan ="3"  >NA</td>
                    <td  style="text-align: center;"  rowspan ="3"  >P</td>
                </tr>
                <tr>
                    <td style="text-align: center;" rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                    <td style="text-align: center;"  rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>

                    <td style="text-align: center;" rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                    <td style="text-align: center;"  rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                  
                </tr>';

                $tb.='<tr>';
                    if(count($course_setting_pengetahuan) > 0 )
                    {
                        foreach($course_setting_pengetahuan as $ct)
                        {
                            $tb.='<th style="text-align: center;" rowspan="1">'.$ct->kd_code.' </th>';
                        }
                        
                    }
                    if( count($course_setting_keterampilan) > 0 )
                    {
                        foreach($course_setting_keterampilan as $ct)
                        {
                           $tb.='<th style="text-align: center;" rowspan="1">'.$ct->kd_code.'</th>';
                        }
                    }
                  
                $tb.='</tr>
            </thead>
            <tbody>';
                    $no = 1;    
                    $tot_val = 0;
                    $tot_p = 0;
                    $min =0;
                    $max = 0;
                    $summary  =[];
                    $kd_summary = [];
                foreach($data_siswa as $row)
                {
                    $tb.='<tr>   
                        <td>'.$no.'</td>
                        <td>'.$row->student_id.'</td>
                        <td>'.$row->student_name.'</td>';
                        foreach($course_setting_pengetahuan as $ct)
                        {
                                /*  Get Total Per KD */
                                 $val_h = 
                                \DB::table('daily_exercise as de')
                                ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id"))
                                ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                                ->join('m_kd as k','k.kd_id','kd.kd_id')
                                ->groupBy('student_id','k.kd_id')
                                ->where('student_id',$row->student_id)
                                ->where('k.kd_id',$ct->kd_id)
                                ->where('k.kd_type','Pengetahuan')
                                ->where('de.step_study_id',stepStudyActive())
                                ->first();
                                
                                $val_h_ = (!empty($val_h)) ? $val_h->tot : 0 ;
                                // dump($val_h_);

                               
                                $uts = \App\Models\Summary_tematic::where('type','uts')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                // dd($uts);
                                $val_uts = (!empty($uts)) ? $uts->total : 0 ;
                                
                                $uas = \App\Models\Summary_tematic::where('type','uas')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                $val_uas = (!empty($uas)) ? $uas->total : 0 ;

                                $daily = \App\Models\Summary_tematic::
                                where('type','daily')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                $val_daily = (!empty($daily)) ? $daily->total : 0 ;
                                
                                 if($ct->class_grade_name == "GRADE 6")
                                 {
                                    if($val_uas > 0)
                                    {
                                        if($val_h_ > 0)   
                                        {
                                            $tot_p = ($val_daily + $val_uas)/2 ;   
                                            // $tot_p =  $val_uas + $val_daily;   
                                        }
                                        else
                                        {
                                            // $tot_p = ($val_h_+$val_daily) /2  ;   
                                            $tot_p = $val_daily  ;   
                                        }
                                    }
                                    else
                                    {
                                        if($val_h_ > 0)   
                                        {
                                            $tot_p = ($val_uas + $val_daily + $val_h_)/3 ;
                                            
                                        }
                                        else
                                        {
                                            $tot_p = ($val_uas + $val_daily)/2 ;

                                        }
                                    }       
                                 }
                                 
                                 else
                                 {
                                    // dd('tes');
                                    if(empty($val_uas)){
                                        $tot_p = ($val_uts + $val_daily + $val_h_)/3 ;   
                                    }else{
                                        $tot_p = ($val_uts + $val_uas + $val_daily + $val_h_)/4 ;
                                    }
                                 }


                                 $summary[$ct->kd_code] = $tot_p;
                                 $kd_summary[round($tot_p)] = $ct->kd_code;
                           
                            $tb.='<td style="text-align: center;"> '.round($tot_p).'</td>';   
                        }
                        if( count ($course_setting_pengetahuan)  > 0 )
                        {
                             /* mendapatkan nilai tertinggi dan terendah */
                            /* Mendapatkan nilai max */
                            $sum_v1 = round(max($summary));
                            $tot_na = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v1 == $key)
                                {
                                    $tot_na = $value;    
                                }
                            }
                            $tb.='<td  style="text-align: center;">'.$tot_na.'</td>'; 
                            $tb.='<td  style="text-align: center;">'.round(max($summary)) .' </td>';
                            /* Mendapatkan nilai min */
                           $sum_v2 = round(min($summary));
                            $tot_na = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v2 == $key)
                                {
                                    $tot_na = $value;    
                                }
                            }
                            $nilai_akhir_a = round (round(array_sum($summary)) / count($summary) );
                            $tot_ket = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_id;
                            $nilai_ket = ( count($course_setting_keterampilan) == 0 ) ? 0 : get_kkm($tot_ket,$nilai_akhir_a,$study_group->class_grade->class_grade_id);

                            $tb.='<td  style="text-align: center;">'.$tot_na.'</td>';
                            $tb.='<td style="text-align: center;"> '.round(min($summary)) .'</td>
                            <td style="text-align: center;"> '. round (round(array_sum($summary)) / count($summary) ) .'</td>
                            <td style="text-align: center;"> '.$nilai_ket .' </td>';
                        }
                        else
                        {
                           $tb.='<td  style="text-align: center;">
                            </td>
                            <td  style="text-align: center;"></td>
                       
                            <td  style="text-align: center;">
                            </td>

                            <td style="text-align: center;"> </td>
                            <!-- Mendapatkan nilai akhir  -->
                            <td style="text-align: center;"> </td>
                            <!-- Mendapatkan nilai Predikat  -->
                            <td style="text-align: center;"> </td>
                            
                            <td style="text-align: center;"> </td>';
                        }

                        foreach($course_setting_keterampilan as $ck)
                        {
                                /*  Get Total Per KD */
                                $skill = \App\Models\Summary_skill::
                                where('student_id',$row->student_id)
                                ->where('kd_id',$ck->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 

                                $count = \App\Models\Summary_skill::
                                where('student_id',$row->student_id)
                                ->where('kd_id',$ck->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->get(); 
                                $c_count = (!empty($count)) ? count($count) : 1;
                                $val_skill = (!empty($skill)) ? $skill->total_skill : 0 ;
                                
                                $val_daily = (!empty($skill)) ? $skill->total_skill : 0 ;
                                $tot_p = ($val_skill) ;
                                $summary_skill[$ck->kd_code] = $tot_p;
                                $kd_summary_skill[round($tot_p)] = $ck->kd_code;

                                // dump($tot_p);


                                $tb.='<td style="text-align: center;"> '.round($tot_p).'</td>';
                        }


                        
                        $tot_na_s1 = 0;
                        $sum_s1 = 0;

                        if(count($summary_skill) > 0)
                        {
                            $sum_s1 = round(max($summary_skill));
                            foreach ($kd_summary_skill as $key => $value) 
                            {
                                if($sum_s1 == $key)
                                {
                                    $tot_na_s1 = $value;    
                                }
                              
                            }
                        }
                            
                     

                        $tb.='<td  style="text-align: center;"> '.$tot_na_s1.'</td>';
                        
                                /* mendapatkan nilai tertinggi dan terendah */

                                /* Mendapatkan nilai max */
                                
                        $tb.='<td  style="text-align: center;"> '. $sum_s1 .'</td>';
                        
                        $sum_s2 = 0;
                        $nilai_akhir = 0;
                        $tot_na_s2 = 0;
                        if(count($summary_skill) > 0)
                        {
                            /* Mendapatkan nilai min */
                            $sum_s2 = round(min($summary_skill));
                            foreach ($kd_summary_skill as $key => $value) 
                            {
                                if($sum_s2 == $key)
                                {
                                    $tot_na_s2 = $value;    
                                }
                            }
                            $nilai_akhir = round (round(array_sum($summary_skill)) / count($summary_skill) );
                        }
                        $tb.='<td  style="text-align: center;">'.$tot_na_s2.''; 

                        $tot_ket = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_id;
                        $nilai_ket = ( count($course_setting_keterampilan) == 0 ) ? 0 : get_kkm($tot_ket,$nilai_akhir,$study_group->class_grade->class_grade_id);
                        $tb.='</td>
                        <td style="text-align: center;"> '. $sum_s2 .'</td>
                        <td style="text-align: center;"> '. $nilai_akhir .'</td>
                        <td style="text-align: center;"> '.$nilai_ket.' </td>

                    </tr>';
                    $no++;
                    
            }
                $tb.='</tbody>
            </table>';

        }
        else #cek tematick atau tidak
        {
            #bukan tematik
            
            $course_name = '';
            if( ( count($course_setting_pengetahuan) != 0 )  &&  ( count($course_setting_keterampilan) != 0  ) )
            {
                $course_name = ( count($course_setting_pengetahuan) == 0 )  ?  0 : $course_setting_pengetahuan[0]->course_name;   
            }
            else
            {

                $course_row = ( count($course_setting_keterampilan) == 0 )  ?  2 : count($course_setting_keterampilan);   
                $course_name = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_name;  
                if ( count($course_setting_pengetahuan) != 0 )
                {
                    $course_name = ( count($course_setting_pengetahuan) == 0 )  ?  0 : $course_setting_pengetahuan[0]->course_name;      
                } 
            }

            $tb='<table ref="table" id="loremTable" border="1" summary="Input analisis" class="table table-bordered">
            <thead>

                <tr>
                    <th style="font-weight:bold; ">Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; "> '. $walas->study_group->study_group_name  .'  </th>
                </tr>
                <tr>
                    <th style="font-weight:bold; ">Wali Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; ">  '. $walas->employee->employee_name  .'  </th>
                </tr> 

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                
                <tr>
                    <th rowspan ="4" >No</th>
                    <th rowspan ="4" >ID</th>
                    <th rowspan ="4"  style="text-align:center"> Nama </th>
                    <th colspan="20" style="text-align: center;"> Rekapitulasi Nilai '.$course_name.' </th>
                </tr>
                <tr>
                    <th style="text-align: center;" colspan="'.count($course_setting_pengetahuan).'" rowspan="2"> Pengetahuan </th>
                    <th colspan="2"  style="text-align: center;">Tertinggi</th>
                    <th colspan="2"  style="text-align: center;">Terendah</th>
                    <td  style="text-align: center;" rowspan ="3"  >NA</td>
                    <td  style="text-align: center;"  rowspan ="3"  >P</td>
                    <th style="text-align: center;" colspan="'.count($course_setting_keterampilan).'" rowspan="2"> Keterampilan </th>
                    <th colspan="2"  style="text-align: center;">Tertinggi</th>
                    <th colspan="2"  style="text-align: center;">Terendah</th>
                    <td  style="text-align: center;" rowspan ="3"  >NA</td>
                    <td  style="text-align: center;"  rowspan ="3"  >P</td>
                </tr>
                <tr>
                    <td style="text-align: center;" rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                    <td style="text-align: center;"  rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>

                    <td style="text-align: center;" rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                    <td style="text-align: center;"  rowspan="2">KD</td>
                    <td style="text-align: center;"  rowspan="2">N</td>
                  
                </tr>';

                $tb.='<tr>';
                    if(count($course_setting_pengetahuan) > 0 )
                    {
                        foreach($course_setting_pengetahuan as $ct)
                        {
                            $tb.='<th style="text-align: center;" rowspan="1">'.$ct->kd_code.' </th>';
                        }
                        
                    }
                    else
                    {
                        $tb.='<th style="text-align: center;" rowspan="1">&nbsp; </th>';
                    }
                    // $tb.='<th> 0 </th>';
                    if( count($course_setting_keterampilan) > 0 )
                    {
                        foreach($course_setting_keterampilan as $ct)
                        {
                           $tb.='<th style="text-align: center;" rowspan="1">'.$ct->kd_code.'</th>';
                        }
                    }
                $tb.='</tr>
            </thead>
            <tbody>';
                    $no = 1;    
                    $tot_val = 0;
                    $tot_p = 0;
                    $min =0;
                    $max = 0;
                    $summary  =[];
                    $kd_summary = [];
                foreach($data_siswa as $row)
                {
                    $tb.='<tr>   
                        <td>'.$no.'</td>
                        <td>'.$row->student_id.'</td>
                        <td>'.$row->student_name.'</td>';
                        foreach($course_setting_pengetahuan as $ct)
                        {
                                /*  Get Total Per KD */
                                $val_h = 
                                \DB::table('daily_exercise as de')
                                ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id"))
                                ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                                ->join('m_kd as k','k.kd_id','kd.kd_id')
                                ->groupBy('student_id','k.kd_id')
                                ->where('student_id',$row->student_id)
                                ->where('k.kd_id',$ct->kd_id)
                                ->where('k.kd_type','Pengetahuan')
                                ->where('de.step_study_id',stepStudyActive())
                                ->first();
                                $val_h_ = (!empty($val_h)) ? $val_h->tot : 0 ;

                                $uts = \App\Models\Summary_kd::where('type','uts')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                // dd($uts);
                                $val_uts = (!empty($uts)) ? $uts->total : 0 ;
                                
                                $uas = \App\Models\Summary_kd::where('type','uas')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                $val_uas = (!empty($uas)) ? $uas->total : 0 ;

                                $daily = \App\Models\Summary_kd::
                                where('type','daily')
                                ->where('student_id',$row->student_id)
                                ->where('kd_id',$ct->kd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first(); 
                                $val_daily = (!empty($daily)) ? $daily->total : 0 ;
                                // dump($val_h_);
                                // dump($val_uts);
                                // dd($val_daily);


                                 if($ct->class_grade_name == "GRADE 6")
                                 {
                                    if(empty($val_uas))
                                    {
                                        $tot_p = ($val_daily + $val_h_)/2 ;   
                                    }
                                    else
                                    {
                                        $tot_p = ($val_uas + $val_daily + $val_h_)/3 ;
                                    }   
                                 }
                                 
                                 else
                                 {
                                    // dd('tes');

                                    if(empty($val_uas))
                                    {
                                      
                                        $tot_p = ($val_uts + $val_daily + $val_h_)/3 ;   
                                    }
                                    else
                                    {
                                        $tot_p = ($val_uts + $val_uas + $val_daily + $val_h_)/4 ;
                                    }
                                 }
                             
                                 // echo ;
                                 $summary[$ct->kd_code] = $tot_p;
                                 $kd_summary[round($tot_p)] = $ct->kd_code;
                           
                            $tb.='<td style="text-align: center;"> '.round($tot_p).'</td>';   
                        }
                        if( count ($course_setting_pengetahuan)  > 0 )
                        {
                             /* mendapatkan nilai tertinggi dan terendah */
                            /* Mendapatkan nilai max */
                            $sum_v1 = round(max($summary));
                            $tot_na = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v1 == $key)
                                {
                                    $tot_na = $value;    
                                }
                            }
                            $tb.='<td  style="text-align: center;">'.$tot_na.'</td>'; 
                            $tb.='<td  style="text-align: center;">'.round(max($summary)) .' </td>';
                            /* Mendapatkan nilai min */
                           $sum_v2 = round(min($summary));
                            $tot_na = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v2 == $key)
                                {
                                    $tot_na = $value;    
                                }
                            }
                            $nilai_akhir_a = round (round(array_sum($summary)) / count($summary) );
                            $tot_ket = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_id;
                            $nilai_ket = ( count($course_setting_keterampilan) == 0 ) ? 0 : get_kkm($tot_ket,$nilai_akhir_a,$study_group->class_grade->class_grade_id);

                            $tb.='<td  style="text-align: center;">'.$tot_na.'</td>';
                            $tb.='<td style="text-align: center;"> '.round(min($summary)) .'</td>
                            <td style="text-align: center;"> '. round (round(array_sum($summary)) / count($summary) ) .'</td>
                            <td style="text-align: center;"> '.$nilai_ket .' </td>';
                        }
                        else
                        {
                           $tb.='<td  style="text-align: center;">
                            </td>
                            <td  style="text-align: center;"></td>
                       
                            <td  style="text-align: center;">
                            </td>

                            <td style="text-align: center;"> </td>
                            <!-- Mendapatkan nilai akhir  -->
                            <td style="text-align: center;"> </td>
                            <!-- Mendapatkan nilai Predikat  -->
                            <td style="text-align: center;"> </td>
                            
                            <td style="text-align: center;"> </td>';
                        }

                        foreach($course_setting_keterampilan as $ck)
                        {
                                    /*  Get Total Per KD */
                                    $skill = \App\Models\Summary_skill::
                                    where('student_id',$row->student_id)
                                    ->where('kd_id',$ck->kd_id)
                                    ->where('step_study_id',stepStudyActive())
                                    ->first(); 

                                    $count = \App\Models\Summary_skill::
                                    where('student_id',$row->student_id)
                                    ->where('kd_id',$ck->kd_id)
                                    ->where('step_study_id',stepStudyActive())
                                    ->get(); 
                                    $c_count = (!empty($count)) ? count($count) : 1;
                                    $val_skill = (!empty($skill)) ? $skill->total_skill : 0 ;
                                 
                                    $val_daily = (!empty($skill)) ? $skill->total_skill : 0 ;
                                    $tot_p = ($val_skill) ;
                                    $summary_skill[$ck->kd_code] = $tot_p;
                                    $kd_summary_skill[round($tot_p)] = $ck->kd_code;


                                $tb.='<td style="text-align: center;"> '.round($tot_p).'</td>';
                        }


                        
                        $tot_na_s1 = 0;
                        $sum_s1 = 0;

                        if(count($summary_skill) > 0)
                        {
                            $sum_s1 = round(max($summary_skill));
                            foreach ($kd_summary_skill as $key => $value) 
                            {
                                if($sum_s1 == $key)
                                {
                                    $tot_na_s1 = $value;    
                                }
                               
                            }
                        }
                            
                     

                        $tb.='<td  style="text-align: center;"> '.$tot_na_s1.'</td>';
                        
                                /* mendapatkan nilai tertinggi dan terendah */

                                /* Mendapatkan nilai max */
                                
                        $tb.='<td  style="text-align: center;"> '. $sum_s1 .'</td>';
                        
                        $sum_s2 = 0;
                        $nilai_akhir = 0;
                        $tot_na_s2 = 0;
                        if(count($summary_skill) > 0)
                        {
                            /* Mendapatkan nilai min */
                            $sum_s2 = round(min($summary_skill));
                            foreach ($kd_summary_skill as $key => $value) 
                            {
                                if($sum_s2 == $key)
                                {
                                    $tot_na_s2 = $value;    
                                }
                            }
                            $nilai_akhir = round (round(array_sum($summary_skill)) / count($summary_skill) );
                        }
                        $tb.='<td  style="text-align: center;">'.$tot_na_s2.''; 

                        $tot_ket = ( count($course_setting_keterampilan) == 0 )  ?  0 : $course_setting_keterampilan[0]->course_id;
                        $nilai_ket = ( count($course_setting_keterampilan) == 0 ) ? 0 : get_kkm($tot_ket,$nilai_akhir,$study_group->class_grade->class_grade_id);
                        $tb.='</td>
                        <td style="text-align: center;"> '. $sum_s2 .'</td>
                        <td style="text-align: center;"> '. $nilai_akhir .'</td>
                        <td style="text-align: center;"> '.$nilai_ket.' </td>

                    </tr>';
                    $no++;
                    
            }
                $tb.='</tbody>
            </table>';
        }
        #end if else for cek tematik

              
        return ['data_all'=>$tb];
    }
    


}
