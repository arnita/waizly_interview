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
use App\Models\Teacher_setting;


class TeacherSettingController extends Controller
{
    //

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //

        $result =  \App\Models\Teacher_setting::with('course','employee')
        ->where('course_id',$request->course_id)
        ->where('study_group_id',$request->study_group_id)
        ;
        $q = $request->q;
        if(!empty($request->q))
        {
            $result->whereHas('employee', function ($query) use ($q){
                    $query->where('employee_name','ilike','%'.$q.'%');
            });
        }
        $data = $result->paginate(10);
        
        return BaseException::jsonSuccessResponse(['data'=>$data]);
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
        $data_employee = $request->employee_id;

     
        if(!empty($data_employee))
        {
            \DB::beginTransaction();
            try {

                    $data['teacher_setting_insert_time'] = date('Y-m-d H:i:s');
                    $data['teacher_setting_insert_by'] = \Auth::user()->id;
                    $data['unit_year_id'] = yearActive();
                    $data['course_id'] = $request->course_id;
                    $data['study_group_id'] = $request->study_group_id;
                    $data['employee_id'] = $request->employee_id;
                    $save = Teacher_setting::create($data);    

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
        return Teacher_setting::find($id);
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

        $data['teacher_setting_update_time'] = date('Y-m-d H:i:s');
        
        
        $update = Teacher_setting::where('teacher_setting_id',$id);
        $update->update(['teacher_setting_setting_status'=>'final']);

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
            $data = Teacher_setting::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
