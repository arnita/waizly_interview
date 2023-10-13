<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use App\Models\M_study_group;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class StudyGroupController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $result =  M_study_group::with(['class_room','unit','class_grade'])->orderBy('study_group_id','desc');

        if(!empty($request->q))
        {
            $result->where('study_group_name','ilike','%'.$request->q.'%');
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
        $this->validate($request,[
            'study_group_name'=>'required',
            'class_room_id'=>'required',
            'class_grade_id'=>'required',
            'unit_id'=>'required',
        ]);

        $data = $request->all();
        
    
        $data['study_group_insert_time'] = date('Y-m-d H:i:s');
        $data['study_group_insert_by'] = \Auth::user()->id;
        
        $save = M_study_group::create($data);    
        

        return response()->json(['status' => 'success']);
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
        return M_study_group::find($id);
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
            'study_group_name'=>'required',
            'class_room_id'=>'required',
            'class_grade_id'=>'required',
            'unit_id'=>'required',
        ]);


        $data = $request->all();
        $data['study_group_update_time'] = date('Y-m-d H:i:s');
        $data['study_group_update_by'] = \Auth::user()->id;
        unset($data['study_group_id']);
        
        $update = M_study_group::find($id);
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
        try {
            if(!empty($id))
            {
                $data = M_study_group::find($id);
                $data->delete();
                return BaseException::jsonSuccessResponse();
            }
            else
            {
                return BaseException::jsonErrorResponse('1','error');
            }
        } catch (Exception $e) {
            return BaseException::jsonErrorResponse('1',$e);
        }
        
    }

}
