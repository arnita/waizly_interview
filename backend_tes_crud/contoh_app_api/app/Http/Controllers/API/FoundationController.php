<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;

class FoundationController extends Controller
{
    public function index(Request $request)
    {
        //
        $result =  \App\Models\M_foundation::orderBy('institution_id','desc')->first();
    
        return response()->json(['data' => $result]);
    }

    public function store(Request $request)
    {
        //

        $this->validate($request,[
            'institution_name'=>'required',
            'institution_telp'=>'required|numeric',
            'institution_address'=>'required',
            'institution_email'=>'required',
        
        ]);


        
        if(!empty($request->institution_id))
        {
            $data = $request->all();
            $data['updated_at'] = date('Y-m-d H:i:s');
            $update = \App\Models\M_foundation::find($request->institution_id);
            $update->update($data);
        }
        else
        {
            
            $data = $request->all();
            unset($data['institution_id']);
            $data['created_at'] = date('Y-m-d H:i:s');
            $save = \App\Models\M_foundation::create($data);    
        }


        return response()->json(['status' => 'success']);
    }

    public function edit($id)
    {
        //
        return \App\Models\M_foundation::find($id);
    }

    public function update(Request $request, $id)
    {
        //

        $this->validate($request,[
            'institution_name'=>'required',
            'institution_telp'=>'required|numeric',
            'institution_address'=>'required',
            'institution_email'=>'required',
          
        ]);

        $data = $request->all();
        $data['updated_time'] = date('Y-m-d H:i:s');
        
        $update = \App\Models\M_foundation::find($id);
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

    public function destroy($id)
    {
        //
        if(!empty($id))
        {
            $data = \App\Models\M_foundation::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
