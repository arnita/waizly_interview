<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;

class StructureTematicDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        if($request->type_detail == 'daily')
        {
          
            $result = \DB::table('structure_tematic_detail as a')
            ->join('m_kd as b','b.kd_id','a.kd_id')
            ->join('course_setting as c','c.course_setting_id','b.course_setting_id')
            ->join('m_course as d','d.course_id','c.course_id')
            ->join('structure_tematic as e','e.structure_tematic_id','a.structure_tematic_id')
            ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
            ->where('e.structure_tematic_id',$request->structure_tematic_id)
            ->where('a.type_question','daily')
            ->where('e.step_study_id',stepStudyActive())
            ;
            $q = $request->q;
            if(!empty($request->q))
            {
                $result->where('c.course_name','ilike','%'.$q.'%');
            }
            return $result->orderBy('structure_tematic_detail_id','desc')
            ->paginate(10);    
        }
        else if($request->type_detail == 'uts')
        {
            $result = \DB::table('structure_tematic_detail as a')
            ->join('m_kd as b','b.kd_id','a.kd_id')
            ->join('course_setting as c','c.course_setting_id','b.course_setting_id')
            ->join('m_course as d','d.course_id','c.course_id')
            ->join('structure_tematic as e','e.structure_tematic_id','a.structure_tematic_id')
            ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
            ->where('e.structure_tematic_id',$request->structure_tematic_id)
            ->where('a.type_question','uts')
            ->where('e.step_study_id',stepStudyActive())
            ;

            $q = $request->q;
            if(!empty($request->q))
            {
                $result->where('c.course_name','ilike','%'.$q.'%');
            }
            return $result->orderBy('structure_tematic_detail_id','desc')
            ->paginate(10);   
        }
        else if($request->type_detail == 'uas')
        {
            
            $result = \DB::table('structure_tematic_detail as a')
            ->join('m_kd as b','b.kd_id','a.kd_id')
            ->join('course_setting as c','c.course_setting_id','b.course_setting_id')
            ->join('m_course as d','d.course_id','c.course_id')
            ->join('structure_tematic as e','e.structure_tematic_id','a.structure_tematic_id')
            ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
            ->where('e.structure_tematic_id',$request->structure_tematic_id)
            ->where('a.type_question','uas')
            ->where('e.step_study_id',stepStudyActive())
            ;

            $q = $request->q;
            if(!empty($request->q))
            {
                $result->where('c.course_name','ilike','%'.$q.'%');
            }
            return $result->orderBy('structure_tematic_detail_id','desc')
            ->paginate(10);   
        }
        
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
            'kd_id'=>'required',
            'question_all'=>'required|numeric',
        ]);   
       

        \DB::beginTransaction();
        try {
            if($request->type_question == 'daily')
            {
                $ex = \App\Models\Structure_tematic_detail::with('structure_tematic')
                 ->whereHas('structure_tematic',function($query){
                        $query->where('step_study_id',stepStudyActive());
                    })
                ->where('kd_id',$request->kd_id)->where('type_question','daily')
                ->first();

                 if(!empty($ex))
                 {
                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','daily')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$ex->structure_tematic_detail_id)->delete();

                    $exist['question_daily'] = $request->question_all;
                    \App\Models\Structure_tematic_detail::where('kd_id',$request->kd_id)->update($exist);

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        $list['structure_tematic_detail_id'] = $ex->structure_tematic_detail_id;
                        \App\Models\List_question_per_tema::create($list);    
                    }  
                 }
                 else
                 {
                    $save['question_daily'] = $request->question_all;
                    $save['type_question'] = $request->type_question;
                    $save['kd_id'] = $request->kd_id;
                    $save['step_study_id'] = stepStudyActive();
                    $save['structure_tematic_id'] = $request->structure_tematic_id;
                    $save['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                    $save['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                    $sv = \App\Models\Structure_tematic_detail::create($save);       


                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','daily')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$sv->structure_tematic_detail_id)->delete();

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        $list['structure_tematic_detail_id'] = $sv->structure_tematic_detail_id;
                         \App\Models\List_question_per_tema::create($list);    
                    }  

                 }
            }
            else if($request->type_question == 'uts')
            {
                $ex = \App\Models\Structure_tematic_detail::with('structure_tematic')
                ->where('kd_id',$request->kd_id)
                ->whereHas('structure_tematic',function($query){
                        $query->where('step_study_id',stepStudyActive());
                    })
                ->where('type_question','uts')->first();
                 if(!empty($ex))
                 {
                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','uts')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$ex->structure_tematic_detail_id)->delete();

                    $exist['question_uts'] = $request->question_all;
                    \App\Models\Structure_tematic_detail::where('kd_id',$request->kd_id)->update($exist);

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        // $list['kd_id'] = $request->kd_id;
                        $list['structure_tematic_detail_id'] = $ex->structure_tematic_detail_id;
                        \App\Models\List_question_per_tema::create($list);    
                    }  

                 }
                 else
                 {
                    // dd($request);
                    $save['question_uts'] = $request->question_all;
                    $save['type_question'] = $request->type_question;
                    $save['kd_id'] = $request->kd_id;
                    $save['step_study_id'] = stepStudyActive();
                    $save['structure_tematic_id'] = $request->structure_tematic_id;
                    $save['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                    $save['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                    $sv = \App\Models\Structure_tematic_detail::create($save);       


                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','uts')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$sv->structure_tematic_detail_id)->delete();

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        // $list['kd_id'] = $request->kd_id;
                        $list['structure_tematic_detail_id'] = $sv->structure_tematic_detail_id;
                         \App\Models\List_question_per_tema::create($list);    
                    }  

                 }
            }

            else if($request->type_question == 'uas')
            {
                $ex = \App\Models\Structure_tematic_detail::
                with('structure_tematic')
                ->whereHas('structure_tematic',function($query){
                        $query->where('step_study_id',stepStudyActive());
                    })
                ->where('kd_id',$request->kd_id)
                ->where('type_question','uas')
                ->first();
                 if(!empty($ex))
                 {
                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','uas')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$ex->structure_tematic_detail_id)->delete();

                    $exist['question_uas'] = $request->question_all;
                    \App\Models\Structure_tematic_detail::where('kd_id',$request->kd_id)->update($exist);

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        // $list['kd_id'] = $request->kd_id;
                        $list['structure_tematic_detail_id'] = $ex->structure_tematic_detail_id;
                        \App\Models\List_question_per_tema::create($list);    
                    }  

                 }
                 else
                 {
                    $save['question_uas'] = $request->question_all;
                    $save['type_question'] = $request->type_question;
                    $save['kd_id'] = $request->kd_id;
                    $save['step_study_id'] = stepStudyActive();
                    $save['structure_tematic_id'] = $request->structure_tematic_id;
                    $save['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                    $save['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                    $sv = \App\Models\Structure_tematic_detail::create($save);       



                    \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->where('input_analysis_tema_type','uas')->delete();
                    \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$sv->structure_tematic_detail_id)->delete();

                    for ($i = 1; $i <= $request->question_all;$i++) 
                    {
                        $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                        // $list['kd_id'] = $request->kd_id;
                        $list['structure_tematic_detail_id'] = $sv->structure_tematic_detail_id;
                         \App\Models\List_question_per_tema::create($list);    
                    }  

                 }
            }
                        
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

        $data =  \DB::table('structure_tematic_detail as a')
        ->join('m_kd as b','b.kd_id','a.kd_id')
        ->join('m_kd_detail as e','e.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','b.course_setting_id')
        ->join('m_course as d','d.course_id','c.course_id')
        ->orderBy('structure_tematic_detail_id','desc')
        ->where('structure_tematic_detail_id',$id)->first();
         return BaseException::jsonSuccessResponse(['data'=>$data]);
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

         $this->validate($request,[
            'question_all'=>'required|numeric',
        ]);   

        \DB::beginTransaction();
        try {
            if($request->type_question == 'daily')
            {
                \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->delete();
                \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->delete();
                for ($i = 1; $i <= $request->question_all;$i++) 
                {
                    $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                    $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                    // $list['kd_id'] = $request->kd_id;
                    $list['structure_tematic_detail_id'] = $request->structure_tematic_detail_id;
                    \App\Models\List_question_per_tema::create($list);    
                }  

                $update['question_daily'] = $request->question_all;
                $update['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                $update['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                \App\Models\Structure_tematic_detail::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->update($update);                       
            }
            else if($request->type_question == 'uts')
            {
                \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->delete();
                \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->delete();
                for ($i = 1; $i <= $request->question_all;$i++) 
                {
                    $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                    $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                    // $list['kd_id'] = $request->kd_id;
                    $list['structure_tematic_detail_id'] = $request->structure_tematic_detail_id;
                    \App\Models\List_question_per_tema::create($list);    
                }  

                $update['question_uts'] = $request->question_all;
                $update['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                $update['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                \App\Models\Structure_tematic_detail::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->update($update);                       
            }

            else if($request->type_question == 'uas')
            {
                \App\Models\InputAnalysisTema::where('kd_id',$request->kd_id)->delete();
                \App\Models\List_question_per_tema::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->delete();
                for ($i = 1; $i <= $request->question_all;$i++) 
                {
                    $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                    $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
                    // $list['kd_id'] = $request->kd_id;
                    $list['structure_tematic_detail_id'] = $request->structure_tematic_detail_id;
                    \App\Models\List_question_per_tema::create($list);    
                }  

                $update['question_uas'] = $request->question_all;
                $update['structure_tematic_detail_insert_time'] = date('Y-m-d H:i:s');
                $update['structure_tematic_detail_insert_by'] = \Auth::user()->id;
                \App\Models\Structure_tematic_detail::where('structure_tematic_detail_id',$request->structure_tematic_detail_id)->update($update);                       
            }

            \DB::commit();
            return BaseException::jsonSuccessResponse();
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1', $e->getMessage());
        }
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id,Request $request)
    {
        if(!empty($id))
        {
            $data = \App\Models\Structure_tematic_detail::find($id);
            if($request->type_question == 'daily')
            {
                \App\Models\InputAnalysisTema::where('kd_id',$data->kd_id)
                //->where('input_analysis_tema_type','daily')
                ->delete();    
            }
            
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    public function insert_number(Request $request)
    {
        //
        // $structure_tematic_id = $request->id;
        $structure_tematic_id = $request->structure_tematic_id;
        $cek_number = \App\Models\List_question_per_tema::
        with('structure_tematic_detail')
        ->whereHas('structure_tematic_detail',function($query) use ($structure_tematic_id){
            $query->where('type_question','daily')
            ->where('structure_tematic_id',$structure_tematic_id);
        })
        ->where('number_question',$request->number_question)
        ->first();


        $get_ =  \App\Models\List_question_per_tema::find($request->id);
        // ->update(['number_question'=>$request->number_question]);


        //  $data =  \DB::table('list_question_per_tema as a')
        // ->join('structure_tematic_detail as b','a.structure_tematic_detail_id','b.structure_tematic_detail_id')
        // ->join('structure_tematic as c','c.structure_tematic_id','b.structure_tematic_id')
        // ->where('type_question',$type)
        // ->where('structure_tematic_id',$request->structure_tematic_id)
        // ->orderBy('number_question','asc')
        // ->
        // // ->where('g.kd_id',$kd_id)
        // ->get();




         // $get_ = \App\Models\InputAnalysisTema::where('number_question',$request->number_question)
         // ->where('kd_id',$request->kd_id)
         // ->where('structure_tematic_id',$request->structure_tematic_id)
         // ->first()
         // ;
         $list['list_question_per_tema_insert_time'] = date('Y-m-d H:i:s');
                    $list['list_question_per_tema_insert_by'] = \Auth::user()->id;
         
             $update_ = \App\Models\InputAnalysisTema::
            where('number_question',$get_->number_question)
            ->where('step_study_id',stepStudyActive())
            ->update(['number_question'=>$request->number_question,
                'value_quality'=>0,
                'input_analysis_tema_update_by'=>\Auth::user()->id,
                'input_analysis_tema_update_time'=>date('Y-m-d H:i:s')
            ]);

            
            // dd($update_);


        // $data =  \DB::table('structure_tematic_detail as a')
        // ->join('structure_tematic as e','e.structure_tematic_id','a.structure_tematic_id')
        // ->join('list_question_per_tema as f','f.structure_tematic_detail_id','a.structure_tematic_detail_id')
        // ->where('e.structure_tematic_id',$structure_tematic_id)
        // ->where('number_question',$request->number_question)
        // ->where('type_question','daily')
        // // ->where('g.kd_id',$kd_id)
        // ->first();





        
        if(!empty($cek_number))
        {
            return BaseException::jsonErrorResponse('1','No soal ini sudah di pakai');
        }
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)
        ->update(['number_question'=>$request->number_question]);
        return BaseException::jsonSuccessResponse();
    } 

    public function cek_number(Request $request)
    {
        $kd_id = $request->id;
        $type = $request->type_question;
        // $data = \App\Models\List_question_per_tema::
        // with('structure_tematic_detail')
        // ->whereHas('structure_tematic_detail',function($query) use ($type,$kd_id){
        //     $query
        //     ->where('type_question',$type)
        //     ->where('kd_id',$kd_id);
        // })->get();

        $data =  \DB::table('structure_tematic_detail as a')
        ->join('structure_tematic as e','e.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as f','f.structure_tematic_detail_id','a.structure_tematic_detail_id')
        ->join('m_kd as b','b.kd_id','a.kd_id')
        // ->join('m_kd_detail as g','g.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','b.course_setting_id')
        ->where('e.structure_tematic_id',$request->structure_tematic_id)
        ->where('type_question',$type)
        ->orderBy('number_question','asc')
        // ->where('g.kd_id',$kd_id)
        ->get();
        $no_ex = [];
        foreach ($data as $key => $value) {
            if($value->number_question != null || $value->number_question != ""){
                $no_ex[]=$value->number_question;    
            }
            
        }

        // dd($no_ex);
        // $r_sort = rsort($no_ex);
        // print_r($no_ex);exit();
        $no_res = implode(',', $no_ex);
        return BaseException::jsonSuccessResponse($no_res);
    }



    public function insert_quality(Request $request)
    {
        //
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)->update(['quality_question'=>$request->quality_question]);
        return BaseException::jsonSuccessResponse();
    }

    public function insert_number_uts(Request $request)
    {
        //
        $structure_tematic_id = $request->structure_tematic_id;
        $cek_number = \App\Models\List_question_per_tema::
        with('structure_tematic_detail')
        ->whereHas('structure_tematic_detail',function($query) use ($structure_tematic_id){
            $query->where('type_question','uts')
            ->where('structure_tematic_id',$structure_tematic_id);
        })
        ->where('number_question',$request->number_question)
        ->first();
        if(!empty($cek_number))
        {
            return BaseException::jsonErrorResponse('1','No soal ini sudah di pakai');
        }
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)
        ->update(['number_question'=>$request->number_question]);
        return BaseException::jsonSuccessResponse();
    } 

    public function insert_quality_uts(Request $request)
    {
        //
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)->update(['quality_question'=>$request->quality_question]);
        return BaseException::jsonSuccessResponse();
    }

    public function insert_number_uas(Request $request)
    {
        //
        $structure_tematic_id = $request->structure_tematic_id;
        $q_kd_id = $request->kd_id;
         $cek_number = \App\Models\List_question_per_tema::
        with('structure_tematic_detail')
        ->whereHas('structure_tematic_detail',function($query) use ($structure_tematic_id) {
            $query->where('type_question','uas')
            ->where('structure_tematic_id',$structure_tematic_id);
        })
        ->where('number_question',$request->number_question)
        ->first();
        if(!empty($cek_number))
        {
            return BaseException::jsonErrorResponse('1','No soal ini sudah di pakai');
        }
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)
        ->update(['number_question'=>$request->number_question]);
        return BaseException::jsonSuccessResponse();
    } 

    public function insert_quality_uas(Request $request)
    {
        //
        \App\Models\List_question_per_tema::where('list_question_per_tema_id',$request->id)->update(['quality_question'=>$request->quality_question]);
        return BaseException::jsonSuccessResponse();
    }


}
