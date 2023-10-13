<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use App\Models\M_course;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        
        $result =  M_course::orderBy('course_id','desc');

        if(!empty($request->q))
        {
            $result->where('course_name','ilike','%'.$request->q.'%');
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
            'course_name'=>'required',
            'course_type'=>'required',
        ]);

        $data = $request->all();
        
    
        $data['course_insert_time'] = date('Y-m-d H:i:s');
        $data['course_insert_by'] = \Auth::user()->id;
        
        $save = M_course::create($data);    
        

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
        return M_course::find($id);
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
            'course_name'=>'required',
            'course_type'=>'required',
        ]);


        $data = $request->all();
        $data['course_update_time'] = date('Y-m-d H:i:s');
        $data['course_update_by'] = \Auth::user()->id;
        
        
        $update = M_course::find($id);
        $update->update($request->except('course_id'));


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
            $data = M_course::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


}
