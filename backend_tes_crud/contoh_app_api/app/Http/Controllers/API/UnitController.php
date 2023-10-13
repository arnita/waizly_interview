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


class UnitController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $result =  \App\Models\M_unit::orderBy('unit_id','desc');
        if(!empty($request->q))
        {
            $result->where('unit_name','ilike','%'.$request->q.'%');
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
            'unit_name'=>'required',
            'unit_telp'=>'required|numeric',
            'unit_address'=>'required',
        ]);

        $data = $request->all();
        $data['unit_insert_time'] = date('Y-m-d H:i:s');
        $data['unit_insert_by'] = \Auth::user()->id;
        $save = \App\Models\M_unit::create($data);

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
        return \App\Models\M_unit::find($id);
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
            'unit_name'=>'required',
            'unit_telp'=>'required|numeric',
            'unit_address'=>'required',
        ]);

        $data = $request->all();
        $data['unit_update_time'] = date('Y-m-d H:i:s');
        $data['unit_update_by'] = \Auth::user()->id;
        
        $update = \App\Models\M_unit::find($id);
        $update->update($request->except('unit_id'));

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
            $data = \App\Models\M_unit::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
