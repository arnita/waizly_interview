<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use App\Exceptions\BaseException;


class DataParlookupController extends Controller
{
     public function parlookup_index(Request $request)
    {
        //

        $result = \App\Models\Parlookup::with('unit')->where('category',$request->category)->orderBy('parlookup_id','desc');


        if(!empty($request->q))
        {
           $result =  $result->where('name','ilike','%'.$request->q.'%');
        }
        return $result->paginate(10);
    }


     public function edit_parlookup($id)
    {
        //
        return \App\Models\Parlookup::find($id);
    }


    public function store_parlookup(Request $request)
    {
        //
        $this->validate($request,[
            'name'=>'required',
            'unit_id'=>'required',
        ]);

        $data['name'] = $request->name;
        $data['desc'] = $request->desc;
        $data['unit_id'] = $request->unit_id;
        $data['category'] = $request->category;
        $data['value'] = str_replace(' ', '_', $request->name);
        
        $data['created_at'] = date('Y-m-d H:i:s');
        $save = \App\Models\Parlookup::create($data);    
            
        

        return response()->json(['status' => 'success']);
    }


    public function update_parlookup(Request $request, $id)
    {
        //
        $this->validate($request,[
            'name'=>'required',
            'unit_id'=>'required',
        ]);

        $data['name'] = $request->name;
        $data['desc'] = $request->desc;
        $data['unit_id'] = $request->unit_id;
        $data['category'] = $request->category;
        $data['value'] = str_replace(' ', '_', $request->name);
        $data['created_at'] = date('Y-m-d H:i:s');

        
        $update = \App\Models\Parlookup::find($id);
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


    public function destroy_parlookup($id)
    {
        //
        if(!empty($id))
        {
            $data = \App\Models\Parlookup::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

}
