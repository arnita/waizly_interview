<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;


class QuizPerKd extends Controller
{
    //
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        

        $result =  
           \DB::table('m_kd as a')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as g','g.course_id','c.course_id')
        ->join('quiz_per_kd as d','d.kd_id','a.kd_id')
        ->join('m_class_grade as e','e.class_grade_id','c.class_grade_id')
        ->where('d.type_question',$request->type_question)
        ->where('d.step_study_id',stepStudyActive());


        if(!empty($request->q))
        {
            if( ( !empty($request->course_id) )  && ( !empty($request->class_grade_id) ) )
            {
                $result = 
                        $result->where('a.kd_name','ilike','%'.$request->q.'%')
                        ->where('e.class_grade_id',$request->class_grade_id)
                        ->where('g.course_id',$request->course_id)
                        ;
            }
            elseif (!empty($request->class_grade_id)) 
            {
                $result = $result->where('e.class_grade_id',$request->class_grade_id)->where('a.kd_name','ilike','%'.$request->q.'%');
            }  
            elseif (!empty($request->course_id)) 
            {
                $result = $result->where('g.course_id',$request->class_grade_id)->where('a.kd_name','ilike','%'.$request->q.'%');
            }
            else
            {
               $result = $result->where('a.kd_name','ilike','%'.$request->q.'%');
            }   
        }

        else if( ( !empty($request->course_id) )  &&  ( !empty($request->class_grade_id) ) )
        {
            
            $result = 
                        $result
                        ->where('e.class_grade_id',$request->class_grade_id)
                        ->where('g.course_id',$request->course_id)
                        ;
        }
        else if( !empty($request->class_grade_id)) 
        {
           $result = $result->where('e.class_grade_id',$request->class_grade_id);
        }
        else if( !empty($request->course_id)) 
        {
           $result = $result->where('g.course_id',$request->course_id);
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
            'course_id'=>'required',
            'kd_id'=>'required',
            'description'=>'required',
            'total_question'=>'required',
        ]);
            \DB::beginTransaction();
            try {   
                // cek kd ada apa tidak 
                $cek  = \App\Models\Quiz_per_kd::where('kd_id',$request->kd_id)->where('type_question',$request->type_question)->first();
                if(empty($cek))
                {  
                    $data['kd_id'] = $request->kd_id;
                    $data['description'] = $request->description;
                    $data['total_question'] = $request->total_question;
                    $data['type_question'] = $request->type_question;
                    $data['quiz_per_kd_insert_time'] = date('Y-m-d H:i:s');
                    $data['quiz_per_kd_insert_by']  = \Auth::user()->id;     
                    $data['step_study_id'] = stepStudyActive();   
                    $save = \App\Models\Quiz_per_kd::create($data);

                    if($request->type_question == 'daily')
                    {
                        \App\Models\List_question_per_kd::where('quiz_per_kd_id',$request->quiz_per_kd_id)->delete();
                        for ($i = 1; $i <= $request->total_question;$i++) 
                        {
                            $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                            $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                            $list['quality_question'] = 1;
                            $list['quiz_per_kd_id'] = $save->quiz_per_kd_id;
                            $save = \App\Models\List_question_per_kd::create($list);    
                        }       
                    }
                    else if($request->type_question == 'uas' || $request->type_question == 'uts')
                    {
                        \App\Models\List_question_per_kd::where('quiz_per_kd_id',$request->quiz_per_kd_id)->delete();
                        for ($i = 1; $i <= $request->total_question;$i++) 
                        {
                            $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                            $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                            $list['quiz_per_kd_id'] = $save->quiz_per_kd_id;
                            $save = \App\Models\List_question_per_kd::create($list);    
                        }       
                    }
                     
                }
                else
                {
                    $data['kd_id'] = $request->kd_id;
                    $data['total_question'] = $request->total_question;
                    $data['type_question'] = $request->type_question;
                    $data['quiz_per_kd_update_time'] = date('Y-m-d H:i:s');
                    $data['quiz_per_kd_update_by']  = \Auth::user()->id;        
                    $update = \App\Models\Quiz_per_kd::where('kd_id',$request->kd_id)->update($data);

                    if($request->type_question == 'daily')
                    {
                        \App\Models\List_question_per_kd::where('quiz_per_kd_id',$cek->quiz_per_kd_id)->delete();
                        for ($i = 1; $i <= $request->total_question;$i++) 
                        {
                            $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                            $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                            $list['number_question'] = $i;
                            $list['quality_question'] = 1;
                            $list['quiz_per_kd_id'] = $cek->quiz_per_kd_id;
                             \App\Models\List_question_per_kd::create($list);    
                        }      
                    }
                    else if($request->type_question == 'uts' || $request->type_question == 'uas')
                    {
                        \App\Models\List_question_per_kd::where('quiz_per_kd_id',$cek->quiz_per_kd_id)->delete();
                        for ($i = 1; $i <= $request->total_question;$i++) 
                        {
                            $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                            $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                            $list['quiz_per_kd_id'] = $cek->quiz_per_kd_id;
                             \App\Models\List_question_per_kd::create($list);    
                        }   
                    }
                    
                }

                
                \DB::commit();
                return response()->json(['status' => 'success']);  
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
  

        $data =  
        \DB::table('m_kd as a')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as g','g.course_id','c.course_id')
        ->join('m_class_grade as m','m.class_grade_id','c.class_grade_id')
        ->join('m_study_group as b','b.class_grade_id','m.class_grade_id')
        ->join('quiz_per_kd as d','d.kd_id','a.kd_id')
        ->where('quiz_per_kd_id',$id)
        ->first();
        return BaseException::jsonSuccessResponse($data);
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
            'course_id'=>'required',
            'kd_id'=>'required',
            'description'=>'required',
            'total_question'=>'required',
        ]);

         \DB::beginTransaction();
            try {

                $data = $request->all();
                $data['quiz_per_kd_update_time'] = date('Y-m-d H:i:s');
                $data['quiz_per_kd_update_by'] = \Auth::user()->id;
                unset($data['quiz_per_kd_id']);
                unset($data['class_grade_id']);
                unset($data['study_group_id']);
                unset($data['course_id']);
                $update = \App\Models\Quiz_per_kd::find($id);
                $update->update($data);

                $kd_id = $request->kd_id;
                \App\Models\Input_Analysis::where('kd_id',$kd_id)->delete();


                if($request->type_question == 'daily')
                {
                    \App\Models\List_question_per_kd::where('quiz_per_kd_id',$request->quiz_per_kd_id)->delete();

                    for ($i = 1; $i <= $request->total_question;$i++) 
                    {
                        $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                        $list['quality_question'] = 1;
                        $list['quiz_per_kd_id'] = $request->quiz_per_kd_id;
                        \App\Models\List_question_per_kd::create($list);    
                    }      
                }
                else if($request->type_question == 'uts' || $request->type_question == 'uas')
                {
                    \App\Models\List_question_per_kd::where('quiz_per_kd_id',$request->quiz_per_kd_id)->delete();

                    for ($i = 1; $i <= $request->total_question;$i++) 
                    {
                        $list['list_question_per_kd_insert_time'] = date('Y-m-d H:i:s');
                        $list['list_question_per_kd_insert_by'] = \Auth::user()->id;
                        $list['quiz_per_kd_id'] = $request->quiz_per_kd_id;
                        \App\Models\List_question_per_kd::create($list);    
                    }         
                }

                
                \DB::commit();
                return response()->json(['status' => 'success']);  
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
    public function destroy($id)
    {
        //
        if(!empty($id))
        {
            $data = \App\Models\Quiz_per_kd::find($id);
            $kd_id = $data->kd_id;
            \App\Models\Input_Analysis::where('kd_id',$kd_id)->delete();
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


    public function delete_quiz($id)
    {
        if(!empty($id))
        {

            \DB::beginTransaction();
            try {

                $get=\DB::table('list_question_per_kd as a')
                ->select('b.kd_id','number_question')
                ->join('quiz_per_kd as b','a.quiz_per_kd_id','b.quiz_per_kd_id')
                ->where('list_question_per_kd_id',$id)
                ->first();

                $data = \App\Models\List_question_per_kd::find($id);
                \App\Models\Input_Analysis::where('kd_id',$get->kd_id)->where('number_question',$get->number_question)->delete();
                $data->delete();

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
    public function get_list_quiz_per_kd(Request $request)
    {
        return \App\Models\List_question_per_kd::where('quiz_per_kd_id',$request->quiz_per_kd_id)->get();
    }


    public function insert_quality(Request $request)
    {
        $update = \App\Models\List_question_per_kd::find($request->list_question_per_kd_id);
        $update->quality_question = $request->quality_question;
        $update->save();
        return response()->json(['status' => 'success']);  
    }


    public function insert_number(Request $request)
    {
        $type = $request->type_question;
        $course_id = $request->course_id;
        \DB::beginTransaction();
        try {
            
            $get_ = \App\Models\List_question_per_kd::find($request->list_question_per_kd_id);
             $val_input_analysis = \App\Models\Input_Analysis::
            where('number_question',$get_->number_question)
            ->where('step_study_id',stepStudyActive())
            ->update([
                'number_question'=>$request->number_question,
                'input_analysis_update_by'=>\Auth::user()->id,
                'input_analysis_update_time'=>date('Y-m-d H:i:s')

            ]);

        
            if(!empty($course_id))
            {
                $number_check = 
                \DB::table('course_setting as cs')
                ->join('m_kd as mk','mk.course_setting_id','cs.course_setting_id')
                ->join('quiz_per_kd as qpk','qpk.kd_id','mk.kd_id')
                ->join('list_question_per_kd as lqpk','lqpk.quiz_per_kd_id','qpk.quiz_per_kd_id')
                ->where('qpk.step_study_id',stepStudyActive())
                ->where('number_question',$request->number_question)
                ->where('type_question',$type)
                ->where('cs.course_id',$course_id);

                
                $number_check = $number_check->where('mk.kd_id',$request->kd_id); 
                
                if(!empty($number_check->first()))
                {
                    return BaseException::jsonErrorResponse('1','No soal ini sudah di pakai');
                }
            }
          
            $update = \App\Models\List_question_per_kd::find($request->list_question_per_kd_id);
            $update->number_question = $request->number_question;
            $update->save();
                
            \DB::commit();
            return response()->json(['status' => 'success']);  
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1', $e->getMessage());
        } 
    }

    public function cek_number_kd(Request $request)
    {
        $type = $request->type_question;
        $course_id = $request->course_id;
      
        $data = 
        \DB::table('course_setting as cs')
        ->join('m_kd as mk','mk.course_setting_id','cs.course_setting_id')
        ->join('quiz_per_kd as qpk','qpk.kd_id','mk.kd_id')
        ->join('list_question_per_kd as lqpk','lqpk.quiz_per_kd_id','qpk.quiz_per_kd_id')
        ->where('qpk.step_study_id',stepStudyActive())
        ->where('type_question',$type)
        ->where('cs.course_id',$course_id)
        ->where('mk.kd_id',$request->kd_id)
        ->orderBy('number_question','asc')
        ->get();


        $no_ex = [];
        foreach ($data as $key => $value) {
            if($value->number_question != null || $value->number_question != ""){
                $no_ex[]=$value->number_question;    
            }
            
        }


        $no_res = implode(',', $no_ex);
        return BaseException::jsonSuccessResponse($no_res);
    }

}
