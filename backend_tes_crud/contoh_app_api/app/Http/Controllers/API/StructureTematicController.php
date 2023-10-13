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
    use App\Models\Structure_tematic;



    class StructureTematicController extends Controller
    {
 	/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $step_study_id = stepStudyActive();
        $class_grade_id = $request->class_grade_id;
        $result =  Structure_tematic::with('class_grade')
        ->where('step_study_id',$step_study_id)
        ->orderBy('structure_tematic_id','desc');
        $q = $request->q;
        if(!empty($request->q))
        {
            if(!empty($class_grade_id))
            {
                $result->where('class_grade_id',$class_grade_id);
            }
            $result->where('structure_tematic_name','ilike','%'.$q.'%');
        }
        else if(!empty($class_grade_id))
        {
            $result->where('class_grade_id',$class_grade_id);
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
            'unit_id'=>'required',
            'class_grade_id'=>'required',
            'structure_tematic_name'=>'required',
            'class_grade_id'=>'required',
        ]);

        \DB::beginTransaction();
        try {

            $data['structure_tematic_insert_time'] = date('Y-m-d H:i:s');
            $data['structure_tematic_insert_by'] = \Auth::user()->id;
            $data['step_study_id'] = stepStudyActive(); 
            $data['structure_tematic_name'] = $request->structure_tematic_name;
            $data['structure_tematic_desc'] = $request->structure_tematic_desc;
            $data['structure_tematic_question'] = $request->structure_tematic_question;
            $data['class_grade_id'] = $request->class_grade_id;
            $save = Structure_tematic::create($data);    
            
            \DB::commit();
            return BaseException::jsonSuccessResponse();
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1', $e->getMessage());
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
        return Structure_tematic::find($id);
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

        $data['structure_tematic_update_time'] = date('Y-m-d H:i:s');
        
        
        $update = Structure_tematic::find($id);
        $update->update($request->all());

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
        // dd($id);
        if(!empty($id))
        {

            \DB::beginTransaction();
            try {

                $detail = \App\Models\Structure_tematic_detail::where('structure_tematic_id',$id)->get();
                foreach($detail as $dt)
                {
                    \App\Models\InputAnalysisTema::where('kd_id',$dt->kd_id)->delete();     
                }
                \App\Models\Structure_tematic_detail::where('structure_tematic_id',$id)->delete();
                $data = Structure_tematic::find($id)->delete();
                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1', $e->getMessage());
            }
          
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }   

}
