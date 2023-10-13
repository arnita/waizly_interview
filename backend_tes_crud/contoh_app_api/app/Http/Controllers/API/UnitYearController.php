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

class UnitYearController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        
        $result =  \App\Models\M_unit_year::with('unit')->orderBy('unit_year_id','desc');


        if(!empty($request->q))
        {
            $result->where('unit_year_name','ilike','%'.$request->q.'%');
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
            'unit_year_name'=>'required',
            'unit_id'=>'required',
        ]);

        $data = $request->all();

        
        
        if($request->unit_year_status == 'active')
        {
            $data['unit_year_update_time'] = date('Y-m-d H:i:s');
            $data['unit_year_update_by'] = \Auth::user()->id;
            $update = \App\Models\M_unit_year::where('unit_year_name',$request->unit_year_name)->first();
            if(!empty($update))
            {   
                $data['unit_year_status'] = 'deactive';
                \App\Models\M_unit_year::where('unit_year_name',$request->unit_year_name)
                ->update($data);       
            }
            else
            {
                $update_year = \App\Models\M_unit_year::where('unit_year_status','active')->get();
                // dd($update_year);

                foreach($update_year as $k => $vl)
                {
                    \App\Models\M_unit_year::where('unit_year_id',$vl->unit_year_id)->update(['unit_year_status'=>'deactive']);
                }
                $data['unit_year_insert_time'] = date('Y-m-d H:i:s');
                $data['unit_year_status'] = 'active';
                $save = \App\Models\M_unit_year::create($data);   
            }
            
        }
        else
        {
            $data['unit_year_insert_time'] = date('Y-m-d H:i:s');
            $data['unit_year_insert_by'] = \Auth::user()->id;
            \App\Models\M_unit_year::create($data);    
        }
        
        

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
        return \App\Models\M_unit_year::find($id);
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
            'unit_year_name'=>'required',
            'unit_id'=>'required'
        ]);

        $data = $request->all();
        $data['unit_year_update_time'] = date('Y-m-d H:i:s');
        $data['unit_year_update_by'] = \Auth::user()->id;

        
        $update = \App\Models\M_unit_year::find($id);
        $update->update($request->except('unit_year_id'));


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
            $data = \App\Models\M_unit_year::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    // change status unit year
    public function change_status(Request $request)
    {
        if(!empty($request->unit_year_id))
        {
            \DB::beginTransaction();
            try {    
                  
                $data['unit_year_status'] = $request->status;
                \App\Models\M_unit_year::find($request->unit_year_id)
                    ->update($data);       
                $update_step['step_study_status'] = $request->status;
                \App\Models\M_step_study::where('unit_year_id',$request->unit_year_id)
                    ->update($update_step);       

                $change_unit_year = \App\Models\M_unit_year::where('unit_year_status','active')->whereNotIn('unit_year_id',[$request->unit_year_id])->get();
                // dd($change_unit_year);
                foreach($change_unit_year as $key=> $vl)
                {
                    \App\Models\M_unit_year::where('unit_year_id',$vl->unit_year_id)
                    ->update(['unit_year_status'=>'deactive']);    
                    \App\Models\M_step_study::where('unit_year_id',$vl->unit_year_id)
                    ->update(['step_study_status'=>'deactive']);     
                }
                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1',$e->getMessage());    
            }

        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
