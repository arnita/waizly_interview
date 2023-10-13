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
use App\Models\Study_group_setting;


class StudyGroupSettingController extends Controller
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
        $result =  \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)
        ->orderBy('a.student_name','ASC');
        $q = $request->q;
        if(!empty($request->q))
        {
            $result= $result->where('student_name','ilike','%'.$q.'%');
        }

        return $result->paginate(10);
        
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
        $data_student = $request->student_id;
     
        if(!empty($data_student))
        {
            \DB::beginTransaction();
            try {
                foreach ($data_student as $key => $value) 
                {

                    $data['study_group_setting_insert_time'] = date('Y-m-d H:i:s');
                    $data['study_group_setting_insert_by'] = \Auth::user()->id;
                    $data['study_group_id'] = $request->study_group_id;
                    $data['study_group_setting_status'] = 'draft';
                    $data['unit_year_id'] = yearActive();
                    $data['student_id'] = $value;
                    $save = Study_group_setting::create($data);    
                }  

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
        return Study_group_setting::find($id);
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

        $data['study_group_update_time'] = date('Y-m-d H:i:s');
        
        
        $update = Study_group_setting::where('study_group_id',$id);
        $update->update(['study_group_setting_status'=>'final']);

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
            $data = Study_group_setting::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
