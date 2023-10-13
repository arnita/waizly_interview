<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use App\Models\M_step_study;
use App\Models\M_unit_year;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class StepStudyController extends Controller
{
    public function index(Request $request)
    {
        //
        $q = $request;

        $result =  M_step_study::
        with('unit_year')->whereHas('unit_year',function($query) use ($q){
            $query->where('unit_year_id',$q->id);
        })
        ->orderBy('step_study_id','desc');


        if(!empty($request->q))
        {
            $result->where('step_study_name','ilike','%'.$request->q.'%');
        }
        return BaseException::jsonSuccessResponse(['list'=>$result->paginate(10),'unit_year'=>M_unit_year::find($request->id)]);


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
            'step_study_name'=>'required|unique:m_step_study',
            'step_study_start'=>'required',
            'step_study_end'=>'required',
            'date_pts'=>'required',
            'date_pas'=>'required',

        ]);

        $data = $request->all();
        $data['step_study_insert_time'] = date('Y-m-d H:i:s');
        $data['step_study_insert_by'] = \Auth::user()->id;
        $data['step_study_status'] = 'deactive';
        $save = M_step_study::create($data);

        return response()->json(['status' => 'success']);
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
            'step_study_name'=>'required',
            'step_study_start'=>'required',
            'step_study_end'=>'required',
            'date_pts'=>'required',
            'date_pas'=>'required',
        ]);

        $data = $request->all();
        $data['step_study_update_time'] = date('Y-m-d H:i:s');
        $data['step_study_update_by'] = \Auth::user()->id;

        
        $update = M_step_study::find($id);
        $update->update($request->except('step_study_id'));


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
            $data = M_step_study::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    public function edit($id)
    {
        //
        return M_step_study::find($id);
    }


    public function change_status(Request $request)
    {
        if(!empty($request->step_study_id))
        {
            if($request->status == 'active')
            {   
                $data['step_study_status'] = 'deactive';
                M_step_study::where('unit_year_id',$request->id_year)
                ->update($data);   

                $data['step_study_status'] = $request->status;
                M_step_study::where('step_study_id',$request->step_study_id)
                ->where('unit_year_id',$request->id_year)
                ->update($data);           
            }
            else
            {
                 $data['step_study_status'] = $request->status;
                M_step_study::where('step_study_id',$request->step_study_id)
                ->where('unit_year_id',$request->id_year)
                ->update($data);           
            }
            
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
