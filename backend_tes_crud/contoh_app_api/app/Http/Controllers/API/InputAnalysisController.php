<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\AnalysisDaily;
use App\Imports\AnalysisUTS;
use App\Imports\AnalysisUAS;
use Auth;
use App\Exceptions\BaseException;


class InputAnalysisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = Excel::toArray(new AnalysisDaily, $request->file('file_excel')); 

        $kd_id = $dt[0][4][2];
        $tot_row_st =  count($dt[0]);
        $tot_question =  count($dt[0][8]);

        \DB::beginTransaction();
        try {    
            $total_value=0;
            for($i=3;$i<$tot_question;$i++)
            {
                for($z=10;$z<$tot_row_st;$z++)
                {

                    $question = $dt[0][9][$i];
                    $student_id =  $dt[0][$z][1];
                    $value =  $dt[0][$z][$i];
                    $total_value = $dt[0][6][$tot_question-1];

                        // $cek_exist = \App\Models\Input_Analysis::
                        // where('student_id', $student_id)
                        // ->where('input_analysis_type','daily')
                        // ->where('kd_id',$kd_id)
                        // ->where('value_quality',$value)
                        // ->where('number_question',$question)
                        // ->first();
                        // if(empty($cek_exist))
                        // {

                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_insert_by' => \Auth::user()->id,
                        //             'input_analysis_type'=>'daily',
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];

                        //         \App\Models\Input_Analysis::create($data_a);


                        // }
                        // else
                        // {

                    $cek_exist = \App\Models\Input_Analysis::
                    where('student_id', $student_id)
                    ->where('input_analysis_type','daily')
                            // ->where('value_quality',$value)
                    ->where('kd_id',$kd_id)
                    ->where('number_question',$question)
                    ->delete();


                    $data_a =
                    [
                        'kd_id' => $kd_id,
                        'student_id' => $student_id,
                        'number_question' => $question,
                        'value_quality' => $value,
                        'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                        'input_analysis_insert_by' => \Auth::user()->id,
                        'input_analysis_type'=>'daily',
                        'step_study_id'=>stepStudyActive(),
                    ];

                    \App\Models\Input_Analysis::create($data_a);
                        // }


                    $db = \DB::table('input_analysis')
                    ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id"))
                    ->where('step_study_id',stepStudyActive())
                    ->where('input_analysis_type','daily')
                    ->where('student_id',$student_id)
                    ->where('kd_id',$kd_id)
                    ->groupBy('kd_id')
                    ->get();
                    
                    if(!empty($db))
                    {
                        foreach($db as $dd)
                        {
                            $get_bobot = \DB::table('quiz_per_kd as st')
                            ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                            ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                            ->where('type_question','daily')
                            ->where('kd_id',$kd_id)
                            ->first();

                            \App\Models\Summary_kd::where('student_id',$student_id)
                            ->where('kd_id',$dd->kd_id)
                            ->where('type','daily')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();



                            if(!empty($get_bobot))
                            {
                                // $val_sum = round( @($dd->tot*100)/$total_value);    

                                if(!empty($get_bobot->tot_kd) || !empty($dd->tot))
                                {
                                    $val_sum = round( @($dd->tot/$get_bobot->tot_kd)*100);
                                    // dd($val_sum);
                                }
                                else
                                {
                                    $val_sum = 0 ; 
                                }

                                if(!empty($kd_id))
                                {
                                    $data_in['kd_id'] = $kd_id;
                                    $data_in['student_id'] = $student_id;
                                    $data_in['type'] = 'daily';
                                    $data_in['total'] = $val_sum;
                                    $data_in['step_study_id'] = stepStudyActive();
                                    $data_in['summary_kd_insert_time'] = date('Y-m-d H:i:s');
                                    $data_in['summary_kd_insert_by'] = \Auth::user()->id;
                                    \App\Models\Summary_kd::create($data_in);
                                }

                            }

                        }
                    }

                }

            }

            
            \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }


    public function input_analysis_kd_uts(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);


        $dt = Excel::toArray(new AnalysisUTS, $request->file('file_excel')); 
        $id_tema =   $dt[0][3][2];
        $tot_row_st =  count($dt[0]);
        $tot_question =  count($dt[0][8]);

        // dd($tot_question);

        \DB::beginTransaction();
        try {    
            $total_value=0;
            for($i=3;$i<$tot_question;$i++)
            {
                for($z=10;$z<$tot_row_st;$z++)
                {

                    $question = $dt[0][9][$i];
                    $student_id =  $dt[0][$z][1];
                    $value =  $dt[0][$z][$i];
                    $total_value = $dt[0][7][$tot_question-1];
                        // dd($dt[0][7][$tot_question-1]);
                    $kd_id =  $dt[0][5][$i];

                        //  $cek_exist = \App\Models\Input_Analysis::
                        //  where('student_id', $student_id)
                        // ->where('input_analysis_type','uts')
                        // ->where('kd_id',$kd_id)
                        // ->where('number_question',$question)
                        // ->first();

                        // if(empty($cek_exist))
                        // {

                        //     if($value > 0 )
                        //     {
                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_insert_by' => \Auth::user()->id,
                        //             'input_analysis_type'=>'uts',
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];

                        //         \App\Models\Input_Analysis::create($data_a);

                        //     }       

                        // }
                        // else
                        // {
                    $cek_exist = \App\Models\Input_Analysis::
                    where('student_id', $student_id)
                    ->where('input_analysis_type','uts')
                    ->where('kd_id',$kd_id)
                    ->where('number_question',$question)
                    ->delete();      

                    $data_a =
                    [
                        'kd_id' => $kd_id,
                        'student_id' => $student_id,
                        'number_question' => $question,
                        'value_quality' => $value,
                        'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                        'input_analysis_insert_by' => \Auth::user()->id,
                        'input_analysis_type'=>'uts',
                        'step_study_id'=>stepStudyActive(),
                    ];

                    \App\Models\Input_Analysis::create($data_a);
                        // }

                    $db = \DB::table('input_analysis')
                    ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id"))
                    ->where('step_study_id',stepStudyActive())
                    ->where('input_analysis_type','uts')
                    ->where('student_id',$student_id)
                    ->where('kd_id',$kd_id)
                    ->groupBy('kd_id')
                    ->get();
                        // dd($db);

                    if(!empty($db))
                    {
                        foreach($db as $dd)
                        {
                            $get_bobot = \DB::table('quiz_per_kd as st')
                            ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                            ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                            ->where('type_question','uts')
                            ->where('kd_id',$kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                            // print_r($get_bobot->tot_kd);
                            // echo '<br>';
                            // print_r($dd->tot);
                           


                            // dump($dd->tot);

                            // dump($get_bobot);
                                                        // dd($asme);

                            \App\Models\Summary_kd::where('student_id',$student_id)
                            ->where('kd_id',$dd->kd_id)
                            ->where('type','uts')
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                            if(!empty($get_bobot))
                            {
                                    // dump($get_bobot->tot_kd);
                                    // dd($dd->tot);
                                // $val_sum = round( @($dd->tot/$get_bobot->tot_kd)*100);    

                                if(!empty($get_bobot->tot_kd) || !empty($dd->tot))
                                {
                                    $val_sum =  round( @($dd->tot/$get_bobot->tot_kd)*100);
                                    // dd($val_sum);
                                    // $val_sum = 1;
                                }
                                else
                                {
                                    $val_sum = 0 ; 
                                }
                                // $val_sum = 0;    
                                    // dd($val_sum);
                                // dd($kd_id);
                                if(!empty($kd_id))
                                {
                                    $data_in['kd_id'] = $kd_id;
                                    $data_in['student_id'] = $student_id;
                                    $data_in['type'] = 'uts';
                                    $data_in['total'] = $val_sum;
                                    $data_in['step_study_id'] = stepStudyActive();
                                    $data_in['summary_kd_insert_time'] = date('Y-m-d H:i:s');
                                    $data_in['summary_kd_insert_by'] = \Auth::user()->id;
                                    // dump($data_in);
                                    // \App\Models\Summary_kd::create($data_in);
                                    \DB::table('summary_kd')->insert($data_in);
                                }
                               

                            }

                        }
                    }



                }
            }



            
            \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }


    public function input_analysis_kd_uas(Request $request)
    {
     $validate = $request->validate([
        'file_excel'=>"required|mimes:xls,xlsx|max:500",
    ]);


     $dt = Excel::toArray(new AnalysisUAS, $request->file('file_excel')); 
     $id_tema =   $dt[0][3][2];
     $tot_row_st =  count($dt[0]);
     $tot_question =  count($dt[0][8])-1;

        // dump(count($dt[0][6]));
        // dd($dt[0][6][$tot_question]);

     \DB::beginTransaction();
     try {    
        $total_value=0;
        for($i=3;$i<$tot_question;$i++)
        {
            for($z=10;$z<$tot_row_st;$z++)
            {

                $question = $dt[0][9][$i];
                $student_id =  $dt[0][$z][1];
                $value =  $dt[0][$z][$i];
                $kd_id =  $dt[0][5][$i];
                $total_value = $dt[0][6][$tot_question-1];

                        //  $cek_exist = \App\Models\Input_Analysis::
                        //  where('student_id', $student_id)
                        // ->where('input_analysis_type','uas')
                        // ->where('kd_id',$kd_id)
                        // ->where('number_question',$question)
                        // ->first();

                        // if(empty($cek_exist))
                        // {

                        //         $data_a =
                        //         [
                        //             'kd_id' => $kd_id,
                        //             'student_id' => $student_id,
                        //             'number_question' => $question,
                        //             'value_quality' => $value,
                        //             'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                        //             'input_analysis_insert_by' => \Auth::user()->id,
                        //             'input_analysis_type'=>'uas',
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];

                        //         \App\Models\Input_Analysis::create($data_a);


                        // }
                        // else
                        // {
                $cek_exist = \App\Models\Input_Analysis::
                where('student_id', $student_id)
                ->where('input_analysis_type','uas')
                            // ->where('value_quality',$value)
                ->where('kd_id',$kd_id)
                ->where('number_question',$question)
                ->delete();

                $data_a =
                [
                    'kd_id' => $kd_id,
                    'student_id' => $student_id,
                    'number_question' => $question,
                    'value_quality' => $value,
                    'input_analysis_insert_time' => date('Y-m-d H:i:s'),
                    'input_analysis_insert_by' => \Auth::user()->id,
                    'input_analysis_type'=>'uas',
                    'step_study_id'=>stepStudyActive(),
                ];

                \App\Models\Input_Analysis::create($data_a);
                        // }

                $db = \DB::table('input_analysis')
                ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id"))
                ->where('step_study_id',stepStudyActive())
                ->where('input_analysis_type','uas')
                ->where('student_id',$student_id)
                ->where('kd_id',$kd_id)
                ->groupBy('kd_id')
                ->get();

                if(!empty($db))
                {
                    foreach($db as $dd)
                    {
                        $get_bobot = \DB::table('quiz_per_kd as st')
                        ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                        ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                        ->where('type_question','uas')
                        ->where('kd_id',$kd_id)
                        ->first();

                        \App\Models\Summary_kd::where('student_id',$student_id)
                        ->where('kd_id',$dd->kd_id)
                        ->where('type','uas')
                        ->where('step_study_id',stepStudyActive())
                        ->delete();

                        if(!empty($get_bobot))
                        {

                            if(!empty($get_bobot->tot_kd) || !empty($dd->tot))
                            {
                                $val_sum = round( @($dd->tot/$get_bobot->tot_kd)*100);
                            }
                            else
                            {
                                $val_sum = 0 ; 
                            }
                            $data_in['kd_id'] = $dd->kd_id;
                            $data_in['student_id'] = $student_id;
                            $data_in['type'] = 'uas';
                            $data_in['total'] = $val_sum;
                            $data_in['step_study_id'] = stepStudyActive();
                            $data_in['summary_kd_insert_time'] = date('Y-m-d H:i:s');
                            $data_in['summary_kd_insert_by'] = \Auth::user()->id;
                            \App\Models\Summary_kd::create($data_in);

                        }

                    }
                }


            }
        }


        \DB::commit();
        return BaseException::jsonSuccessResponse(['data'=>'sucess']);
    } catch (\Exception $e) {
        \DB::rollback();
        return BaseException::jsonErrorResponse('1',$e->getMessage());    
    }
}

public function get_val_in_analysis(Request $request)
{
    $q = \App\Models\Input_Analysis::where('student_id',$request->student_id)->where('number_question',$request->number_question)->where('input_analysis_type','daily')->first();
    $result = (empty($q)) ? ""  : $q->value_quality;
    return ['res'=>$result];
}


public function get_total_input_analysis(Request $request)
{
    $q_vl = \DB::table('input_analysis')->select(\DB::raw("sum(value_quality::integer) as tot"))
    ->where('student_id',$request->student_id)->first();
    $vl = (!empty($q_vl)) ?  ($q_vl->tot/10)*100 : 0;

    return ['res'=>$vl];
}  

public function send_param_analysis_daily_kd(Request $request)
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
            $db = \DB::table('input_analysis')
            ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id"))
            ->where('step_study_id',stepStudyActive())
            ->where('input_analysis_type','daily')
            ->where('student_id',$value['student_id'])
            ->where('kd_id',$request->params['list_question'][0]['kd_id'])
            ->groupBy('kd_id')
            ->get();
                // dd($db);

            if(!empty($db))
            {
                foreach($db as $dd)
                {
                    $get_bobot = \DB::table('quiz_per_kd as st')
                    ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))

                    ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                    
                    ->where('type_question','daily')
                    ->first();

                    \App\Models\Summary_kd::where('student_id',$value['student_id'])
                    ->where('kd_id',$dd->kd_id)
                    ->where('type','daily')
                    ->where('step_study_id',stepStudyActive())
                    ->delete();

                    if(!empty($get_bobot))
                    {
                        $val_sum = round($dd->tot*100/$request->params['total_bobot']);    
                        $data_in['kd_id'] = $dd->kd_id;
                        $data_in['student_id'] = $value['student_id'];
                        $data_in['type'] = 'daily';
                        $data_in['total'] = $val_sum;
                        $data_in['step_study_id'] = stepStudyActive();
                        \App\Models\Summary_kd::create($data_in);
                    }

                }
            }

        }


        foreach ($request->params['list_question'] as $key => $list) 
        {
            $dd =  \App\Models\Input_Analysis::where('student_id',$value['student_id'])
            ->where('number_question',$list['number_question'])
            ->where('kd_id',$list['kd_id'])
            ->where('input_analysis_type','daily')->first();
            $val = (!empty($dd)) ?  $dd->value_quality : 0;
            $tb.='<td>'.$val.'</td>';
        }

        if(empty($request->params['list_question']))
        {
            $tb.= '<td>0</td>';
        }
        else
        {
            $q_vl = \DB::table('input_analysis')->select(\DB::raw("sum(value_quality::integer) as tot"))
            ->where('kd_id',$request->params['list_question'][0]['kd_id'])
            ->where('input_analysis_type','daily')
            ->where('student_id',$value['student_id'])->first();
            if(!empty($request->params['total_bobot']))
            {
                $v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0;
                $tb .= '<td>'.round($v_q*100/$request->params['total_bobot']).'</td>';    
            }
            else
            {
                $tb.= '<td></td>';
            }
        }


        $tb.='</tr>';
    }

    $tb.="</tbody></table>";


    return ['data_all'=>$tb];
}


public function send_param_analysis_uts_kd(Request $request)
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
        <td>'.$value['student_name'].'<button @click="tambah()"></button></td>';




        if($request->params['type_page'] == 'input_page')
        {
            $db = \DB::table('input_analysis')
            ->select(\DB::raw('sum(value_quality::integer) as tot,kd_id,student_id'))
            ->where('step_study_id',stepStudyActive())
            ->where('input_analysis_type','uts')
            ->where('student_id',$value['student_id'])
            ->groupBy('kd_id','student_id')->get();

            if(!empty($db))
            {
                foreach($db as $dd)
                {
                    $get_bobot = \DB::table('quiz_per_kd as st')
                    ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                    ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                    ->where('st.kd_id',$dd->kd_id)
                    ->where('type_question','uts')
                    ->first();

                    \App\Models\Summary_kd::where('student_id',$value['student_id'])
                    ->where('kd_id',$dd->kd_id)
                    ->where('type','uts')
                    ->where('step_study_id',stepStudyActive())
                    ->delete();




                    if(!empty($get_bobot))
                    {

                        $val_sum = round( $dd->tot / $get_bobot->tot_kd * 100 );    

                        $data_in['kd_id'] = $dd->kd_id;
                        $data_in['student_id'] = $value['student_id'];
                        $data_in['type'] = 'uts';
                        $data_in['total'] = $val_sum;
                        $data_in['step_study_id'] = stepStudyActive();
                        $data_in['summary_kd_insert_time'] = date('Y-m-d H:i:s');
                        $data_in['summary_kd_insert_by'] = \Auth::user()->id;
                        \App\Models\Summary_kd::create($data_in);
                    }

                }
            }

        }



        foreach ($request->params['list_question'] as $key => $list) 
        {
            $dd =  \App\Models\Input_Analysis::where('student_id',$value['student_id'])->where('number_question',$list['number_question'])->where('input_analysis_type','uts')->first();
            $val = (!empty($dd)) ?  $dd->value_quality : 0;
            $tb.='<td>'.$val.'</td>';
        }

        $q_vl = \DB::table('input_analysis')->select(\DB::raw("sum(value_quality::integer) as tot"))->where('input_analysis_type','uts')->where('student_id',$value['student_id'])->first();
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


public function send_param_analysis_uas_kd(Request $request)
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
            $db = \DB::table('input_analysis')
            ->select(\DB::raw('sum(value_quality::float) as tot,kd_id,student_id'))
            ->where('step_study_id',stepStudyActive())
            ->where('input_analysis_type','uas')
            ->where('student_id',$value['student_id'])
            ->groupBy('kd_id','student_id')->get();

            if(!empty($db))
            {
                foreach($db as $dd)
                {
                    $get_bobot = \DB::table('quiz_per_kd as st')
                    ->select(\DB::raw("sum(quality_question::float) as tot_kd"))
                    ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                    ->where('st.kd_id',$dd->kd_id)
                    ->where('type_question','uas')
                    ->first();

                    \App\Models\Summary_kd::where('student_id',$value['student_id'])
                    ->where('kd_id',$dd->kd_id)
                    ->where('type','uas')
                    ->where('step_study_id',stepStudyActive())
                    ->delete();


                    

                    if(!empty($get_bobot))
                    {
                        $val_sum = round( $dd->tot / $get_bobot->tot_kd * 100 );    
                        $data_in['kd_id'] = $dd->kd_id;
                        $data_in['student_id'] = $value['student_id'];
                        $data_in['type'] = 'uas';
                        $data_in['total'] = $val_sum;
                        $data_in['step_study_id'] = stepStudyActive();
                        $data_in['summary_kd_insert_time'] = date('Y-m-d H:i:s');
                        $data_in['summary_kd_insert_by'] = \Auth::user()->id;
                        \App\Models\Summary_kd::create($data_in);
                    }

                }
            }

        }



        foreach ($request->params['list_question'] as $key => $list) 
        {
            $dd =  \App\Models\Input_Analysis::where('student_id',$value['student_id'])->where('number_question',$list['number_question'])->where('input_analysis_type','uas')->first();
            $val = (!empty($dd)) ?  $dd->value_quality : 0;
            $tb.='<td>'.$val.'</td>';
        }

        $q_vl = \DB::table('input_analysis')->select(\DB::raw("sum(value_quality::float) as tot"))->where('input_analysis_type','uas')->where('student_id',$value['student_id'])->first();
        if(!empty($request->params['total_bobot']))
        {
            $v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0;
            $tb .= '<td>'.round(@($v_q*100/$request->params['total_bobot'])).'</td>';    
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

public function get_value_analisis(Request $request)
{

    $analisis =[];

    $list_question =  
    \DB::table('m_kd as a')
    ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
    ->join('m_kd_detail as d','d.kd_id','a.kd_id')
    ->join('quiz_per_kd as b','b.kd_id','d.kd_id')
    ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
    ->where('b.type_question',$request->type)   
    ->where('z.course_id',$request->course_id)
    ->where('z.class_grade_id',$request->class_grade_id)
    ->where('d.step_study_id',stepStudyActive());

    if(!empty($request->kd_id))
    {
        $list_question = $list_question->where('d.kd_id',$request->kd_id);
    }
    $list_question = $list_question->orderBy('c.number_question','asc')
    ->get();


    foreach($list_question as $dd)
    {
        $data_ex = \App\Models\Input_Analysis::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('kd_id',$dd->kd_id)
        ->where('number_question',$dd->number_question)
        ->where('input_analysis_type',$request->type)
        ->first();

        if(!empty($data_ex))
        {
            $analisis[$dd->number_question]= ['input_analysis_id'=>$data_ex->input_analysis_id,'value'=>$data_ex->value_quality,'kd'=>$dd->kd_id,'bobot'=>$dd->quality_question];    
        }
        else
        {
            $analisis[$dd->number_question]=['value'=>"",'kd'=>$dd->kd_id,'bobot'=>$dd->quality_question];    
        }
    }

    return response()->json(['status' => 'success','data'=>$analisis]);             
}

public function load_data(Request $request)
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
    \DB::table('m_kd as a')
    ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
    ->join('quiz_per_kd as b','b.kd_id','a.kd_id')
    ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
    ->where('b.type_question',$request->type)   
    ->where('z.course_id',$request->course_id)
    ->where('z.class_grade_id',$request->class_grade_id)
    ->where('b.step_study_id',$stepStudyActive);

    if(!empty($request->kd_id))
    {
        $list_question = $list_question->where('a.kd_id',$request->kd_id);
    }
        $list_question = 
        $list_question->orderBy('c.number_question','asc')
        ->get();

    $kd_val = [];
    foreach ($list_question as $key => $value) {
            # code...
        $kd_val[] = $value->kd_id;
    }




    $total = 0;
    foreach ($list_question as $list) 
    {
        $total += $list->quality_question;
    }


    $student_id=[];
    $var_stu = [];
    $var_kd = [];
    $res= 0;
    foreach ($result as $key => $value) {
            # code...
        $student_id[] = $value->student_id;
        if($request->type == 'daily')
        {

            $count_analisis = \App\Models\Input_Analysis::
            select(\DB::raw('sum(value_quality::float) as tot,student_id,kd_id'))
            ->where('input_analysis_type',$request->type)
            ->where('step_study_id',stepStudyActive())
            ->where('student_id',$value->student_id)
            ->where('kd_id',$request->kd_id)
            ->whereNotNull('number_question')
            ->groupBy('student_id','kd_id')
            ->first();
        }
        else
        {
            $count_analisis = \App\Models\Input_Analysis::
            select(\DB::raw('sum(value_quality::float) as tot,student_id'))
            ->where('input_analysis_type',$request->type)
            ->where('step_study_id',stepStudyActive())
            ->where('student_id',$value->student_id)
            ->whereIn('kd_id',array_unique($kd_val))
            ->groupBy('student_id')
            ->first();
        }


        if(!empty($count_analisis))
        {
            if($total !=0)
            {
                $var_stu[$count_analisis->student_id]=  round ( $count_analisis->tot * 100   / $total)  ;
            }
        }

    }


    if($request->type == "daily")
    {
        $val_input_analysis = \App\Models\Input_Analysis::
        where('input_analysis_type',$request->type)
        ->where('step_study_id',stepStudyActive())
        ->whereIn('student_id',$student_id)
        ->where('kd_id',$request->kd_id)
        ->get();  
    }
    else
    {    
        $val_input_analysis = \App\Models\Input_Analysis::
        where('input_analysis_type',$request->type)
        ->where('step_study_id',stepStudyActive())
        ->whereIn('student_id',$student_id)
        ->whereIn('kd_id',array_unique($kd_val))
        ->get();
    }



    $data =['list_question'=>$list_question,'result'=>$result,'total'=>$total,'val_input_analysis'=>$val_input_analysis,'var_stu'=>$var_stu];     
    // dd($var_stu);


    return response()->json($data);
}




public function input_form_analisis(Request $request)
{
    \DB::beginTransaction();
    try {    
        if(!empty($request->student_id))
        {
            $data_ex = null;
            if(!empty($request->input_analysis_id))
            {
                $data_ex = \App\Models\Input_Analysis::find($request->input_analysis_id)
                ->first();    
            }



            $db = \DB::table('input_analysis')
            ->select(\DB::raw("sum(value_quality::integer) as tot,kd_id"))
            ->where('step_study_id',stepStudyActive())
            ->where('input_analysis_type','daily')
            ->where('student_id',$request->student_id)
            ->where('kd_id',$request->kd_id)
            ->groupBy('kd_id')
            ->get();

            if(!empty($db))
            {
                foreach($db as $dd)
                {
                    $get_bobot = \DB::table('quiz_per_kd as st')
                    ->select(\DB::raw("sum(quality_question::integer) as tot_kd"))
                    ->join('list_question_per_kd as lq','lq.quiz_per_kd_id','st.quiz_per_kd_id')
                    ->where('type_question','daily')
                    ->first();

                    \App\Models\Summary_kd::where('student_id',$request->student_id)
                    ->where('kd_id',$dd->kd_id)
                    ->where('type','daily')
                    ->where('step_study_id',stepStudyActive())
                    ->delete();

                    if(!empty($get_bobot))
                    {
                        $val_sum = round( ( $dd->tot*100) / $request->total_bobot );    
                        $data_in['kd_id'] = $dd->kd_id;
                        $data_in['student_id'] = $request->student_id;
                        $data_in['type'] = 'daily';
                        $data_in['total'] = $val_sum;
                        $data_in['step_study_id'] = stepStudyActive();
                        \App\Models\Summary_kd::create($data_in);

                    }

                }
            }




            if(!empty($data_ex))
            {


                $data_['student_id'] = $request->student_id;
                $data_['kd_id'] = $request->kd_id;
                $data_['input_analysis_type'] = $request->type;
                $data_['number_question'] = $request->number_question;
                $data_['value_quality'] = $request->value_quality;
                $data_['step_study_id'] = stepStudyActive();
                $data_['input_analysis_update_time'] = date('Y-m-d H:i:s');
                $data_['input_analysis_update_by']  = \Auth::user()->id;
                \App\Models\Input_Analysis::
                where('input_analysis_id',$request->input_analysis_id)
                ->update($data_);  

            }
            else
            {
                \App\Models\Input_Analysis::
                where('student_id',$request->student_id)
                ->where('input_analysis_type',$request->type)
                ->where('number_question',$request->number_question)
                ->where('kd_id',$request->kd_id)
                ->delete();  
                $data['student_id'] = $request->student_id;
                $data['kd_id'] = $request->kd_id;
                $data['input_analysis_type'] = $request->type;
                $data['number_question'] = $request->number_question;
                $data['value_quality'] = $request->value_quality;
                $data['step_study_id'] = stepStudyActive();
                $data['input_analysis_insert_time'] = date('Y-m-d H:i:s');
                $data['input_analysis_insert_by']  = \Auth::user()->id;

                $save = \App\Models\Input_Analysis::create($data);
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }


        \DB::commit();
        return BaseException::jsonSuccessResponse(['data'=>'sucess']);
    } catch (\Exception $e) {
        \DB::rollback();
        return BaseException::jsonErrorResponse('1',$e->getMessage());    
    }

}



}


