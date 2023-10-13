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
use App\Exceptions\BaseException;
use App\Models\Course_setting;


class CourseSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //

        $unit_year_id = yearActive();
        $result =  Course_setting::with(['course','employee'])
        ->where('unit_year_id',$unit_year_id)
        ->where('class_grade_id',$request->class_grade_id)
        ->orderBy('course_setting_id','desc')
        ;
        $q = $request->q;
// dd($request);
        if(!empty($request->q))
        {
            $result = $result->whereHas('course', function ($query) use ($q){
                    $query->where('course_name','ilike','%'.$q.'%');
                    $query->orWhere('course_code','ilike','%'.$q.'%');
            });
        }
        return $result = $result->paginate(10);
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //        
        $data_course = $request->course_id;

     
        if(!empty($data_course))
        {
            \DB::beginTransaction();
            try {
                foreach ($data_course as $key => $value) 
                {

                    $data['course_setting_insert_time'] = date('Y-m-d H:i:s');
                    $data['course_setting_insert_by'] = \Auth::user()->user_id;
                    $data['unit_year_id'] = yearActive();
                    $data['course_id'] = $value;
                    $data['study_group_id'] = null;
                    $data['class_grade_id'] = $request->class_grade_id;
                    $save = Course_setting::create($data);    
                }  

                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1', $e->getMessage());
            }
            
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
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
        return Course_setting::find($id);
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

        $data['course_setting_update_time'] = date('Y-m-d H:i:s');
        $data['course_setting_update_by'] = \Auth::user()->user_id;
        $data['course_setting_status'] = 'final';

        
        $update = Course_setting::where('course_id',$id);
        $update->update($data);

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
            $data = Course_setting::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    public function teacher_coordinator(Request $request)
    {
        $data['course_setting_update_time'] = date('Y-m-d H:i:s');
        $data['course_setting_update_by'] = \Auth::user()->id;
        $data['employee_id'] = $request->employee_id;
        
        // dd($data);
        $update = Course_setting::where('course_id',$request->course_id);
        $update->update(['employee_id'=>null]);


        
        $update = Course_setting::where('course_setting_id',$request->course_setting_id);
        $update->update($data);

        if($update)
        {
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
