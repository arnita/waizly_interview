<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\AnalysisTemaDaily;
use Auth;
use App\Exceptions\BaseException;



class AnalysisTematicController extends Controller
{
    
    public function analysis_tematic_daily_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = Excel::toArray(new AnalysisTemaDaily, $request->file('file_excel')); 
        $id_tema =   $dt[0][3][2];
        $tot_row_st =  count($dt[0]);
        $tot_question =  count($dt[0][8])-1;

        // dd($dt[0][3]);

         \DB::beginTransaction();
        try {    
                $total_value=0;
                for($i=3;$i<$tot_question;$i++)
                {
                    for($z=12;$z<$tot_row_st;$z++)
                    {
                        $question = $dt[0][11][$i];
                        $student_id =  $dt[0][$z][1];
                        $value =  $dt[0][$z][$i];
                        $kd_id =  $dt[0][5][$i];

                        
                        // $cek_exist = \App\Models\InputAnalysisTema::
                        // where('student_id', $student_id)
                        // ->where('number_question',$question)
                        // // ->where('value_quality',$value)
                        // ->where('structure_tematic_id',$id_tema)
                        // ->where('kd_id',$kd_id)
                        // ->where('input_analysis_tema_type','daily')
                        // ->where('step_study_id',stepStudyActive())
                        // ->first();


                        // if(empty($cek_exist))
                        // {
                            
                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'structure_tematic_id' => $id_tema,
                        //             'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                        //             'input_analysis_tema_type'=>'daily',
                        //             'step_study_id'=>stepStudyActive()
                        //         ];
                        //         \App\Models\InputAnalysisTema::create($data_a);

                        //         $db = \DB::table('input_analysis_tema as iat')
                        //         ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                        //         ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                        //         ->where('st.step_study_id',stepStudyActive())
                        //         ->where('iat.input_analysis_tema_type','daily')
                        //         ->where('student_id',$student_id)
                        //         ->groupBy('kd_id','st.structure_tematic_id')->get();


                        //         if(!empty($db))
                        //         {
                        //             foreach($db as $dd)
                        //             {
                        //                 $get_bobot = \DB::table('structure_tematic as st')
                        //                 ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                        //                 ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                        //                 ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                        //                 ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('std.kd_id',$dd->kd_id)
                        //                 ->where('type_question','daily')
                        //                 ->groupBy('kd_id')
                        //                 ->first();

                        //                 \App\Models\Summary_tematic::where('student_id',$student_id)
                        //                 ->where('kd_id',$dd->kd_id)
                        //                 ->where('structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('type','daily')
                        //                 ->where('step_study_id',stepStudyActive())
                        //                 ->delete();

                        //                 if(!empty($get_bobot))
                        //                 {
                        //                     $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                        //                     $data_in['kd_id'] = $dd->kd_id;
                        //                     $data_in['student_id'] = $student_id;
                        //                     $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                        //                     $data_in['type'] = 'daily';
                        //                     $data_in['total'] = $val_sum;
                        //                     $data_in['step_study_id'] = stepStudyActive();
                        //                     \App\Models\Summary_tematic::create($data_in);
                        //                 }
                                    
                        //             }
                        //         }
                              
                        // }
                        // else
                        // {
                            // \App\Models\InputAnalysisTema::
                            // where('input_analysis_tema_id', $cek_exist->input_analysis_tema_id)
                            // ->delete();



                            \App\Models\InputAnalysisTema::
                            where('student_id', $student_id)
                            ->where('number_question',$question)
                            // ->where('value_quality',$value)
                            ->where('structure_tematic_id',$id_tema)
                            ->where('kd_id',$kd_id)
                            ->where('input_analysis_tema_type','daily')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                    'kd_id' => $kd_id,
                                    'student_id' => $student_id,
                                    'number_question' => $question,
                                    'value_quality' => $value,
                                    'structure_tematic_id' => $id_tema,
                                    'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                                    'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                                    'input_analysis_tema_type'=>'daily',
                                    'step_study_id'=>stepStudyActive()

                                ];
                                
                                \App\Models\InputAnalysisTema::create($data_a);

                                $db = \DB::table('input_analysis_tema as iat')
                                ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                                ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                                ->where('st.step_study_id',stepStudyActive())
                                ->where('iat.input_analysis_tema_type','daily')
                                ->where('student_id',$student_id)
                                ->groupBy('kd_id','st.structure_tematic_id')->get();
                                // dd($db);

                                if(!empty($db))
                                {
                                    foreach($db as $dd)
                                    {
                                        $get_bobot = \DB::table('structure_tematic as st')
                                        ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                                        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                                        ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                                        ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('std.kd_id',$dd->kd_id)
                                        ->where('type_question','daily')
                                        ->groupBy('kd_id')
                                        ->first();

                                        \App\Models\Summary_tematic::where('student_id',$student_id)
                                        ->where('kd_id',$dd->kd_id)
                                        ->where('structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('type','daily')
                                        ->where('step_study_id',stepStudyActive())
                                        ->delete();
                                        // dd($get_bobot);
                                        if(!empty($get_bobot))
                                        {   
                                            // dd('tes');
                                            $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                                            $data_in['kd_id'] = $dd->kd_id;
                                            $data_in['student_id'] = $student_id;
                                            $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                                            $data_in['type'] = 'daily';
                                            $data_in['total'] = $val_sum;
                                            $data_in['step_study_id'] = stepStudyActive();
                                            \App\Models\Summary_tematic::create($data_in);
                                        }
                                    
                                    }
                                }
                        // }
                        
                    }
                }

            
           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }

    public function send_param_analysis_daily_tema(Request $request)
    {

        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  rowspan="4"  style="text-align:center" >No</th>
                <th  rowspan="4"  style="text-align:center"> Nama </th>
                <th colspan="'.count($request->params['list_question']).'"  style="text-align:center">Bobot</th>
                <td rowspan="2">'.$request->params['total_bobot'].'</td>
              </tr>
              <tr>';
                foreach ($request->params['list_question'] as $key => $ll):
                    $tb.='<td>'.$ll['quality_question'].'</td>';
                endforeach;

              $tb.='</tr>
              <tr>
                <th colspan="'.count($request->params['list_question']).'" style="text-align:center"> Soal </th>
                <td rowspan="2">Nilai Akhir</td>
              </tr>
              <tr>';
                foreach ($request->params['list_question'] as $key => $nn):
                    $tb.='<td>'.$nn['number_question'].'</td>';
                endforeach;
              '</tr>
            </thead>';

        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td>'.($key+1).'</td>
                    <td>'.$value['student_name'].'</td>';
                
            if($request->params['type_page'] == 'input_page')
            {

                 $db = \DB::table('input_analysis_tema as iat')
                ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                ->where('st.step_study_id',stepStudyActive())
                ->where('iat.input_analysis_tema_type','daily')
                ->where('student_id',$value['student_id'])
                ->groupBy('kd_id','st.structure_tematic_id')->get();

                if(!empty($db))
                {
                    foreach($db as $dd)
                    {
                        $get_bobot = \DB::table('structure_tematic as st')
                        ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                        ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                        ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                        ->where('std.kd_id',$dd->kd_id)
                        ->where('type_question','daily')
                        ->groupBy('kd_id')
                        ->first();

                        \App\Models\Summary_tematic::where('student_id',$value['student_id'])
                        ->where('kd_id',$dd->kd_id)
                        ->where('structure_tematic_id',$dd->structure_tematic_id)
                        ->where('type','daily')
                        ->where('step_study_id',stepStudyActive())
                        ->delete();

                        if(!empty($get_bobot))
                        {
                            $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                            $data_in['kd_id'] = $dd->kd_id;
                            $data_in['student_id'] = $value['student_id'];
                            $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                            $data_in['type'] = 'daily';
                            $data_in['total'] = $val_sum;
                            $data_in['step_study_id'] = stepStudyActive();
                            \App\Models\Summary_tematic::create($data_in);
                        }
                    
                    }
                }
            }

        
            foreach ($request->params['list_question'] as $key => $list) 
            {
                $dd =  \App\Models\InputAnalysisTema::where('student_id',$value['student_id'])
                ->where('number_question',$list['number_question'])
                ->where('kd_id',$list['kd_id'])
                ->where('input_analysis_tema_type','daily')->first();

                $val = (!empty($dd)) ?  $dd->value_quality : 0;
                $tb.='<td>'.$val.'</td>';
            }

            $q_vl = \DB::table('input_analysis_tema')
            ->select(\DB::raw("sum(value_quality::integer) as tot"))
            ->where('student_id',$value['student_id'])
            ->where('input_analysis_tema_type','daily')
            ->first();

            if(!empty($request->params['total_bobot']))
            {
                $v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0;
                $tb .= '<td>'.round($v_q*100/$request->params['total_bobot']).'</td>';    
            }
            else
            {
                $tb.= '<td></td>';
            }
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        return ['data_all'=>$tb];

    }

    public function analysis_tematic_uts_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = Excel::toArray(new AnalysisTemaDaily, $request->file('file_excel')); 
        $id_tema =   $dt[0][3][2];
        $tot_row_st =  count($dt[0]);
        $tot_question =  count($dt[0][8])-1;


         \DB::beginTransaction();
        try {    
                $total_value=0;
                for($i=3;$i<$tot_question;$i++)
                {
                    for($z=12;$z<$tot_row_st;$z++)
                    {
                        $question = $dt[0][11][$i];
                        $student_id =  $dt[0][$z][1];
                        $value =  $dt[0][$z][$i];
                        $kd_id =  $dt[0][5][$i];

                        // $cek_exist = \App\Models\InputAnalysisTema::
                        // where('student_id', $student_id)
                        // ->where('kd_id',$kd_id)
                        // // ->where('value_quality',$value)
                        // ->where('structure_tematic_id',$id_tema)
                        // ->where('number_question',$question)
                        // ->where('input_analysis_tema_type','uts')
                        // ->where('step_study_id',stepStudyActive())
                        // ->first();


                        // if(empty($cek_exist))
                        // {

                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'structure_tematic_id' => $id_tema,
                        //             'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                        //             'input_analysis_tema_type'=>'uts',
                        //             'step_study_id'=>stepStudyActive()

                        //         ];
                                
                        //         \App\Models\InputAnalysisTema::create($data_a);


                        //         $db = \DB::table('input_analysis_tema as iat')
                        //         ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                        //         ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                        //         ->where('st.step_study_id',stepStudyActive())
                        //         ->where('iat.input_analysis_tema_type','uts')
                        //         ->where('student_id',$student_id)
                        //         ->groupBy('kd_id','st.structure_tematic_id')->get();


                        //         if(!empty($db))
                        //         {
                        //             foreach($db as $dd)
                        //             {
                        //                 $get_bobot = \DB::table('structure_tematic as st')
                        //                 ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                        //                 ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                        //                 ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                        //                 ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('std.kd_id',$dd->kd_id)
                        //                 ->where('type_question','uts')
                        //                 ->groupBy('kd_id')
                        //                 ->first();

                        //                 \App\Models\Summary_tematic::where('student_id',$student_id)
                        //                 ->where('kd_id',$dd->kd_id)
                        //                 ->where('structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('type','uts')
                        //                 ->where('step_study_id',stepStudyActive())
                        //                 ->delete();

                        //                 if(!empty($get_bobot))
                        //                 {
                        //                     $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                        //                     $data_in['kd_id'] = $dd->kd_id;
                        //                     $data_in['student_id'] = $student_id;
                        //                     $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                        //                     $data_in['type'] = 'uts';
                        //                     $data_in['total'] = $val_sum;
                        //                     $data_in['step_study_id'] = stepStudyActive();
                        //                     \App\Models\Summary_tematic::create($data_in);
                        //                 }
                                    
                        //             }
                        //         }
  

                        // }
                        // else
                        // {
                            // \App\Models\InputAnalysisTema::
                            // where('input_analysis_tema_id', $cek_exist->input_analysis_tema_id)
                            // // where('student_id', $student_id)
                            // // ->where('kd_id',$kd_id)
                            // // // ->where('value_quality',$value)
                            // // ->where('structure_tematic_id',$id_tema)
                            // // ->where('number_question',$question)
                            // // ->where('input_analysis_tema_type','uts')
                            // ->delete();


                            \App\Models\InputAnalysisTema::
                            where('student_id', $student_id)
                            ->where('kd_id',$kd_id)
                            // ->where('value_quality',$value)
                            ->where('structure_tematic_id',$id_tema)
                            ->where('number_question',$question)
                            ->where('input_analysis_tema_type','uts')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                    'kd_id' => $kd_id,
                                    'student_id' => $student_id,
                                    'number_question' => $question,
                                    'value_quality' => $value,
                                    'structure_tematic_id' => $id_tema,
                                    'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                                    'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                                    'input_analysis_tema_type'=>'uts',
                                    'step_study_id'=>stepStudyActive()
                                ];
                                
                                \App\Models\InputAnalysisTema::create($data_a);

                            $db = \DB::table('input_analysis_tema as iat')
                                ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                                ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                                ->where('st.step_study_id',stepStudyActive())
                                ->where('iat.input_analysis_tema_type','uts')
                                ->where('student_id',$student_id)
                                ->groupBy('kd_id','st.structure_tematic_id')->get();


                                if(!empty($db))
                                {
                                    foreach($db as $dd)
                                    {
                                        $get_bobot = \DB::table('structure_tematic as st')
                                        ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                                        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                                        ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                                        ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('std.kd_id',$dd->kd_id)
                                        ->where('type_question','uts')
                                        ->groupBy('kd_id')
                                        ->first();

                                        \App\Models\Summary_tematic::where('student_id',$student_id)
                                        ->where('kd_id',$dd->kd_id)
                                        ->where('structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('type','uts')
                                        ->where('step_study_id',stepStudyActive())
                                        ->delete();

                                        if(!empty($get_bobot))
                                        {
                                            $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                                            $data_in['kd_id'] = $dd->kd_id;
                                            $data_in['student_id'] = $student_id;
                                            $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                                            $data_in['type'] = 'uts';
                                            $data_in['total'] = $val_sum;
                                            $data_in['step_study_id'] = stepStudyActive();
                                            \App\Models\Summary_tematic::create($data_in);
                                        }
                                    
                                    }
                                }
                        // }
                        
                    }
                }

            
           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }

    public function send_param_analysis_uts_tema(Request $request)
    {
        
            $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
                <thead>
                   <tr>
                    <th  rowspan="4"  style="text-align:center" >No</th>
                    <th  rowspan="4"  style="text-align:center"> Nama </th>
                    <th colspan="'.count($request->params['list_question']).'"  style="text-align:center">Bobot</th>
                    <td rowspan="2">'.$request->params['total_bobot'].'</td>
                  </tr>
                  <tr>';
                    foreach ($request->params['list_question'] as $key => $ll):
                        $tb.='<td>'.$ll['quality_question'].'</td>';
                    endforeach;

                  $tb.='</tr>
                  <tr>
                    <th colspan="'.count($request->params['list_question']).'" style="text-align:center"> Soal </th>
                    <td rowspan="2">Nilai Akhir</td>
                  </tr>
                  <tr>';
                    foreach ($request->params['list_question'] as $key => $nn):
                        $tb.='<td>'.$nn['number_question'].'</td>';
                    endforeach;
                  '</tr>
                </thead>';

            $tb .= '<tbody>';
            $val = '';
            foreach ($request->params['data_show'] as $key => $value) 
            {
                $tb .= '<tr>';
                  $tb.='<td>'.($key+1).'</td>
                        <td>'.$value['student_name'].'</td>';




                if($request->params['type_page'] == 'input_page')
                {

                     $db = \DB::table('input_analysis_tema as iat')
                    ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                    ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                    ->where('st.step_study_id',stepStudyActive())
                    ->where('iat.input_analysis_tema_type','uts')
                    ->where('student_id',$value['student_id'])
                    ->groupBy('kd_id','st.structure_tematic_id')->get();




                    if(!empty($db))
                    {
                        foreach($db as $dd)
                        {
                            $get_bobot = \DB::table('structure_tematic as st')
                            ->select(\DB::raw("sum(quality_question::integer) as tot_kd,kd_id"))
                            ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                            ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                            ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                            ->where('std.kd_id',$dd->kd_id)
                            ->where('type_question','uts')
                            ->groupBy('kd_id')->first();

                            // echo '<pre>';
                            //     print_r($get_bobot);
                            // echo '</pre>';


                            \App\Models\Summary_tematic::where('student_id',$value['student_id'])
                            ->where('kd_id',$dd->kd_id)
                            ->where('structure_tematic_id',$dd->structure_tematic_id)
                            ->where('type','uts')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                            if(!empty($get_bobot))
                            {
                                $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                                $data_in['kd_id'] = $dd->kd_id;
                                $data_in['student_id'] = $value['student_id'];
                                $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                                $data_in['type'] = 'uts';
                                $data_in['total'] = $val_sum;
                                $data_in['step_study_id'] = stepStudyActive();
                                \App\Models\Summary_tematic::create($data_in);
                            }
                        
                        }
                    }
                }
              
                foreach ($request->params['list_question'] as $key => $list) 
                {
                    $dd =  \App\Models\InputAnalysisTema::where('student_id',$value['student_id'])
                    ->where('number_question',$list['number_question'])
                    ->where('kd_id',$list['kd_id'])
                    ->where('input_analysis_tema_type','uts')
                    ->first();

                    $val = (!empty($dd)) ?  $dd->value_quality : 0;
                    $tb.='<td>'.$val.'</td>';
                }

                $q_vl = \DB::table('input_analysis_tema')->select(\DB::raw("sum(value_quality::integer) as tot"))
                ->where('input_analysis_tema_type','uts')
                ->where('student_id',$value['student_id'])
                ->first();

                if(!empty($request->params['total_bobot']))
                {
                    $v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0;
                    $tb .= '<td>'.round($v_q*100/$request->params['total_bobot']).'</td>';    
                }
                else
                {
                    $tb.= '<td></td>';
                }

                $tb.='</tr>';
            }

            $tb.="</tbody></table>";
            

            return ['data_all'=>$tb];
              
    }




    public function analysis_tematic_uas_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = Excel::toArray(new AnalysisTemaDaily, $request->file('file_excel')); 
        $id_tema =   $dt[0][3][2];
        $tot_row_st =  count($dt[0]);
        $tot_question =  count($dt[0][8])-1;


         \DB::beginTransaction();
        try {    
                $total_value=0;
                for($i=3;$i<$tot_question;$i++)
                {
                    for($z=12;$z<$tot_row_st;$z++)
                    {
                        $question = $dt[0][11][$i];
                        $student_id =  $dt[0][$z][1];
                        $value =  $dt[0][$z][$i];
                        $kd_id =  $dt[0][5][$i];

                        // $cek_exist = \App\Models\InputAnalysisTema::
                        // where('student_id', $student_id)
                        // ->where('kd_id',$kd_id)
                        // // ->where('value_quality',$value)
                        // ->where('structure_tematic_id',$id_tema)
                        // ->where('number_question',$question)
                        // ->where('input_analysis_tema_type','uas')
                        // ->where('step_study_id',stepStudyActive())
                        // ->first();

                        // dd($cek_exist);

                        // if(empty($cek_exist))
                        // {
                            

                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'structure_tematic_id' => $id_tema,
                        //             'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                        //             'input_analysis_tema_type'=>'uas',
                        //             'step_study_id'=>stepStudyActive()
                        //         ];
                                
                        //         \App\Models\InputAnalysisTema::create($data_a);

                        //         $db = \DB::table('input_analysis_tema as iat')
                        //         ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                        //         ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                        //         ->where('st.step_study_id',stepStudyActive())
                        //         ->where('iat.input_analysis_tema_type','uas')
                        //         ->where('student_id',$student_id)
                        //         ->groupBy('kd_id','st.structure_tematic_id')->get();


                        //         if(!empty($db))
                        //         {
                        //             foreach($db as $dd)
                        //             {
                        //                 $get_bobot = \DB::table('structure_tematic as st')
                        //                 ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                        //                 ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                        //                 ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                        //                 ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('std.kd_id',$dd->kd_id)
                        //                 ->where('type_question','uas')
                        //                 ->groupBy('kd_id')
                        //                 ->first();

                        //                 \App\Models\Summary_tematic::where('student_id',$student_id)
                        //                 ->where('kd_id',$dd->kd_id)
                        //                 ->where('structure_tematic_id',$dd->structure_tematic_id)
                        //                 ->where('type','uas')
                        //                 ->where('step_study_id',stepStudyActive())
                        //                 ->delete();

                        //                 if(!empty($get_bobot))
                        //                 {
                        //                     $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                        //                     $data_in['kd_id'] = $dd->kd_id;
                        //                     $data_in['student_id'] = $student_id;
                        //                     $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                        //                     $data_in['type'] = 'uas';
                        //                     $data_in['total'] = $val_sum;
                        //                     $data_in['step_study_id'] = stepStudyActive();
                        //                     \App\Models\Summary_tematic::create($data_in);
                        //                 }
                                    
                        //             }
                        //         }
 

                        // }
                        // else
                        // {
                            // \App\Models\InputAnalysisTema::
                            // where('input_analysis_tema_id', $cek_exist->input_analysis_tema_id)
                            // ->delete();


                            \App\Models\InputAnalysisTema::
                            where('student_id', $student_id)
                            ->where('kd_id',$kd_id)
                            // ->where('value_quality',$value)
                            ->where('structure_tematic_id',$id_tema)
                            ->where('number_question',$question)
                            ->where('input_analysis_tema_type','uas')
                            ->where('step_study_id',stepStudyActive())
                            ->first();

                             $data_a =
                                [
                                    'kd_id' => $kd_id,
                                    'student_id' => $student_id,
                                    'number_question' => $question,
                                    'value_quality' => $value,
                                    'structure_tematic_id' => $id_tema,
                                    'input_analysis_tema_insert_time' => date('Y-m-d H:i:s'),
                                    'input_analysis_tema_insert_by' => \Auth::user()->user_id,
                                    'input_analysis_tema_type'=>'uas',
                                    'step_study_id'=>stepStudyActive()
                                ];
                                
                                \App\Models\InputAnalysisTema::create($data_a);

                                $db = \DB::table('input_analysis_tema as iat')
                                ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                                ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                                ->where('st.step_study_id',stepStudyActive())
                                ->where('iat.input_analysis_tema_type','uas')
                                ->where('student_id',$student_id)
                                ->groupBy('kd_id','st.structure_tematic_id')->get();


                                if(!empty($db))
                                {
                                    foreach($db as $dd)
                                    {
                                        $get_bobot = \DB::table('structure_tematic as st')
                                        ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                                        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                                        ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                                        ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('std.kd_id',$dd->kd_id)
                                        ->where('type_question','uas')
                                        ->groupBy('kd_id')
                                        ->first();

                                        \App\Models\Summary_tematic::where('student_id',$student_id)
                                        ->where('kd_id',$dd->kd_id)
                                        ->where('structure_tematic_id',$dd->structure_tematic_id)
                                        ->where('type','uas')
                                        ->where('step_study_id',stepStudyActive())
                                        ->delete();

                                        if(!empty($get_bobot))
                                        {
                                            $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                                            $data_in['kd_id'] = $dd->kd_id;
                                            $data_in['student_id'] = $student_id;
                                            $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                                            $data_in['type'] = 'uas';
                                            $data_in['total'] = $val_sum;
                                            $data_in['step_study_id'] = stepStudyActive();
                                            \App\Models\Summary_tematic::create($data_in);
                                        }
                                    
                                    }
                                }
                        // }
                        
                    }
                }

            
           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }

    public function send_param_analysis_uas_tema(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
                <thead>
                   <tr>
                    <th  rowspan="4"  style="text-align:center" >No</th>
                    <th  rowspan="4"  style="text-align:center"> Nama </th>
                    <th colspan="'.count($request->params['list_question']).'"  style="text-align:center">Bobot</th>
                    <td rowspan="2">'.$request->params['total_bobot'].'</td>
                  </tr>
                  <tr>';
                    foreach ($request->params['list_question'] as $key => $ll):
                        $tb.='<td>'.$ll['quality_question'].'</td>';
                    endforeach;

                  $tb.='</tr>
                  <tr>
                    <th colspan="'.count($request->params['list_question']).'" style="text-align:center"> Soal </th>
                    <td rowspan="2">Nilai Akhir</td>
                  </tr>
                  <tr>';
                    foreach ($request->params['list_question'] as $key => $nn):
                        $tb.='<td>'.$nn['number_question'].'</td>';
                    endforeach;
                  '</tr>
                </thead>';

            $tb .= '<tbody>';
            $val = '';
            foreach ($request->params['data_show'] as $key => $value) 
            {
                $tb .= '<tr>';
                  $tb.='<td>'.($key+1).'</td>
                        <td>'.$value['student_name'].'</td>';




                if($request->params['type_page'] == 'input_page')
                {

                     $db = \DB::table('input_analysis_tema as iat')
                    ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id,st.structure_tematic_id"))
                    ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
                    ->where('st.step_study_id',stepStudyActive())
                    ->where('iat.input_analysis_tema_type','uas')
                    ->where('student_id',$value['student_id'])
                    ->groupBy('kd_id','st.structure_tematic_id')->get();

                    if(!empty($db))
                    {
                        foreach($db as $dd)
                        {
                            $get_bobot = \DB::table('structure_tematic as st')
                            ->select(\DB::raw("sum(quality_question::integer) as tot_kd,kd_id"))
                            ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
                            ->join('list_question_per_tema as lq','lq.structure_tematic_detail_id','std.structure_tematic_detail_id')
                            ->where('st.structure_tematic_id',$dd->structure_tematic_id)
                            ->where('std.kd_id',$dd->kd_id)
                            ->where('type_question','uas')
                            ->groupBy('kd_id')->first();

                            \App\Models\Summary_tematic::where('student_id',$value['student_id'])
                            ->where('kd_id',$dd->kd_id)
                            ->where('structure_tematic_id',$dd->structure_tematic_id)
                            ->where('type','uas')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                            if(!empty($get_bobot))
                            {
                                $val_sum = round( ($dd->tot / $get_bobot->tot_kd) * 100 );    
                                $data_in['kd_id'] = $dd->kd_id;
                                $data_in['student_id'] = $value['student_id'];
                                $data_in['structure_tematic_id'] = $dd->structure_tematic_id;
                                $data_in['type'] = 'uas';
                                $data_in['total'] = $val_sum;
                                $data_in['step_study_id'] = stepStudyActive();
                                \App\Models\Summary_tematic::create($data_in);
                            }
                        
                        }
                    }
                }
              
                foreach ($request->params['list_question'] as $key => $list) 
                {
                    $dd =  \App\Models\InputAnalysisTema::where('student_id',$value['student_id'])
                    ->where('number_question',$list['number_question'])
                    ->where('kd_id',$list['kd_id'])
                    ->where('input_analysis_tema_type','uas')
                    ->first();

                    $val = (!empty($dd)) ?  $dd->value_quality : 0;
                    $tb.='<td>'.$val.'</td>';
                }

                $q_vl = \DB::table('input_analysis_tema')->select(\DB::raw("sum(value_quality::integer) as tot"))
                ->where('input_analysis_tema_type','uas')
                ->where('student_id',$value['student_id'])
                ->first();

                if(!empty($request->params['total_bobot']))
                {
                    $v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0;
                    $tb .= '<td>'.round($v_q*100/$request->params['total_bobot']).'</td>';    
                }
                else
                {
                    $tb.= '<td></td>';
                }

                $tb.='</tr>';
            }

            $tb.="</tbody></table>";
            

            return ['data_all'=>$tb];
    }


    public function get_value_analisis_tema(Request $request)
    {

        $analisis =[];

        
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('b.type_question',$request->type)
        ->where('b.step_study_id',stepStudyActive())
        ->orderBy('c.number_question','asc')
        ->get();

        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }

        $kd_val = [];
        foreach ($list_question as $key => $value) {
            # code...
            $kd_val[] = $value->kd_id;
        }


        // dd($list_question);
        

        foreach($list_question as $dd)
        {
            $data_ex = \App\Models\InputAnalysisTema::
            where('student_id',$request->student_id)
            ->where('step_study_id',stepStudyActive())
            ->whereIn('kd_id',$kd_val)
            ->where('number_question',$dd->number_question)
            ->where('input_analysis_tema_type',$request->type)
            ->first();
            // dd($data_ex);

            if(!empty($data_ex))
            {
                $analisis[$dd->number_question]= ['input_analysis_tema_id'=>$data_ex->input_analysis_tema_id,'value'=>$data_ex->value_quality,'kd'=>$dd->kd_id,'bobot'=>$dd->quality_question];    
            }
            else
            {
                $analisis[$dd->number_question]=['value'=>"",'kd'=>$dd->kd_id,'bobot'=>$dd->quality_question];    
            }
        }

        return response()->json(['status' => 'success','data'=>$analisis]);             
    }

    public function load_data_tema(Request $request)
    {
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();


        $result =  
        \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)
        ->orderBy('a.student_name','ASC')
        ->get();

         
        $list_question =  
        \DB::table('structure_tematic as a')
        ->join('structure_tematic_detail as b','b.structure_tematic_id','a.structure_tematic_id')
        ->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->where('b.structure_tematic_id',$request->structure_tematic_id)
        ->where('b.type_question',$request->type)
        ->where('b.step_study_id',stepStudyActive())
        ->orderBy('c.number_question','asc')
        ->get();


        $kd_val = [];
        foreach ($list_question as $key => $value) {
            # code...
            $kd_val[] = $value->kd_id;
        }

        // dd($kd_val);


        $total = 0;
        foreach ($list_question as $list) 
        {
            $total += $list->quality_question;
        }

        $var_stu = [];
        $student_id=[];


        foreach ($result as $key => $value) {
            # code...
            $student_id[] = $value->student_id;
            $count_tema = \DB::table('input_analysis_tema as iat')
            ->select(\DB::raw("sum(value_quality::float) as tot,st.structure_tematic_id,student_id"))
            ->join('structure_tematic as st','st.structure_tematic_id','iat.structure_tematic_id')
            ->where('iat.step_study_id',stepStudyActive())
            ->where('iat.input_analysis_tema_type',$request->type)
            ->where('student_id',$value->student_id)
            ->where('iat.structure_tematic_id',$request->structure_tematic_id)
            ->whereIn('kd_id',array_unique($kd_val))
            ->groupBy('st.structure_tematic_id','student_id')->first();

            if(!empty($count_tema))
            {
                if($total !=0)
                {
                    $var_stu[$count_tema->student_id]=  round ( $count_tema->tot * 100   / $total)  ;
                }
            }
        }

        
        $val_input_analysis = \App\Models\InputAnalysisTema::
        where('input_analysis_tema_type',$request->type)
        ->where('step_study_id',stepStudyActive())
        ->whereIn('kd_id',array_unique($kd_val))
        ->whereIn('student_id',$student_id)->get();


        $data = ['list_question'=>$list_question,'result'=>$result,'total'=>$total,'val_input_analysis'=>$val_input_analysis,'var_stu'=>$var_stu];

        // dd($var_stu);


     
        return response()->json($data);
    }


    

    public function input_form_analisis_tema(Request $request)
    {

        if(!empty($request->student_id))
        {
        
            $data_ex = null;
            if(!empty($request->input_analysis_tema_id))
            {
                $data_ex = \App\Models\InputAnalysisTema::find($request->input_analysis_tema_id)
                ->first();     
            }



            if(!empty($data_ex))
            {

                $data_['student_id'] = $request->student_id;
                $data_['kd_id'] = $request->kd_id;
                $data_['input_analysis_tema_type'] = $request->type;
                $data_['number_question'] = $request->number_question;
                $data_['value_quality'] = $request->value_quality;
                $data_['step_study_id'] = stepStudyActive();
                $data_['input_analysis_tema_update_time'] = date('Y-m-d H:i:s');
                $data_['input_analysis_tema_update_by']  = \Auth::user()->id;
                \App\Models\InputAnalysisTema::
                where('input_analysis_tema_id',$request->input_analysis_tema_id)
                ->update($data_);  
                return response()->json(['status' => 'updated']);             
                
            }
            else
            {
                \App\Models\InputAnalysisTema::
                where('student_id',$request->student_id)
                ->where('input_analysis_tema_type',$request->type)
                ->where('number_question',$request->number_question)
                ->where('kd_id',$request->kd_id)
                ->where('structure_tematic_id',$request->structure_tematic_id)
                
                ->delete();  

                
                $data['student_id'] = $request->student_id;
                $data['kd_id'] = $request->kd_id;
                $data['input_analysis_tema_type'] = $request->type;
                $data['number_question'] = $request->number_question;
                $data['value_quality'] = $request->value_quality;
                $data['structure_tematic_id'] = $request->structure_tematic_id;
                $data['step_study_id'] = stepStudyActive();
                $data['input_analysis_tema_insert_time'] = date('Y-m-d H:i:s');
                $data['input_analysis_tema_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\InputAnalysisTema::create($data);
                return response()->json(['status' => 'inserted']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

}
