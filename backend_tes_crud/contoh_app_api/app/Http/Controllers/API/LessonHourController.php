<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use App\Models\M_lesson_hour;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class LessonHourController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        
        $result =  M_lesson_hour::orderBy('lesson_hour_id','desc')->whereNull('lesson_hour_delete_time');


        if(!empty($request->q))
        {
            $result->where('day','ilike','%'.$request->q.'%');
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
            'lesson_day'=>'required',
            'hour_to'=>'required',
            'lesson_hour_start'=>'required',
            'lesson_hour_end'=>'required',
            'lesson_hour_type'=>'required',
        ]);

        $data = $request->all();
        
    
        $data['lesson_hour_insert_time'] = date('Y-m-d H:i:s');
        $data['lesson_hour_insert_by'] = \Auth::user()->id;
        $data['lesson_hour_start'] = date('H:i',strtotime($request->lesson_hour_start));
        $data['lesson_hour_end'] = date('H:i',strtotime($request->lesson_hour_end));
        $save = M_lesson_hour::create($data);    
        

        return response()->json(['status' => 'success']);
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
        return M_lesson_hour::find($id);
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
            'lesson_day'=>'required',
            'hour_to'=>'required',
            'lesson_hour_start'=>'required',
            'lesson_hour_end'=>'required',
            'lesson_hour_type'=>'required',
        ]);

        $data = $request->all();
        $data['lesson_hour_update_time'] = date('Y-m-d H:i:s');
        $data['lesson_hour_update_by'] = \Auth::user()->id;
        $data['lesson_hour_start'] = date('H:i',strtotime($request->lesson_hour_start));
        $data['lesson_hour_end'] = date('H:i',strtotime($request->lesson_hour_end));
        
        $update = M_lesson_hour::find($id);
        $update->update($request->except('lesson_hour_id'));


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
            $data = M_lesson_hour::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


}
