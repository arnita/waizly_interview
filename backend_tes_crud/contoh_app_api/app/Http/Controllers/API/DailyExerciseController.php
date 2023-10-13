<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\DailyExercise;
use Auth;
use App\Exceptions\BaseException;


/*
    CREATED BY ARIEF MANGGALA PUTRA 
    10 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

 
class DailyExerciseController extends Controller
{
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //        
        
        if(!empty($request->student_id))
        {
            $data_ex = \App\Models\Daily_exercise::where('student_id',$request->student_id)
            ->where('kd_detail_id',$request->kd_detail_id)
            ->where('daily_exercise_type',$request->uh)
            ->where('structure_tematic_id',$request->structure_tematic_id)
            ->where('kd_type',$request->kd_type)
            ->first();
            if(!empty($data_ex))
            {
                $data_['score'] = $request->score;
                $data_['student_id'] = $request->student_id;
                $data_['kd_detail_id'] = $request->kd_detail_id;
                $data_['daily_exercise_type'] = $request->uh;
                $data_['structure_tematic_id'] = $request->structure_tematic_id;
                $data_['kd_type'] = $request->kd_type;
                $data_['daily_exercise_update_time'] = date('Y-m-d H:i:s');
                $data_['daily_exercise_update_by']  = \Auth::user()->id;
                \App\Models\Daily_exercise::
                where('kd_detail_id',$request->kd_detail_id)
                ->where('daily_exercise_type',$request->uh)
                ->where('structure_tematic_id',$request->structure_tematic_id)
                ->where('kd_type',$request->kd_type)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['score'] = $request->score;
                $data['student_id'] = $request->student_id;
                $data['kd_detail_id'] = $request->kd_detail_id;
                $data['daily_exercise_type'] = $request->uh;
                $data['structure_tematic_id'] = $request->structure_tematic_id;
                $data['kd_type'] = $request->kd_type;
                $data['daily_exercise_insert_time'] = date('Y-m-d H:i:s');
                $data['daily_exercise_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Daily_exercise::create($data);
                return response()->json(['status' => 'success']);             
            }

                    
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }




    public function daily_exercise_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new DailyExercise, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_absen =  count($dt[0][2]);
        
        // dump($dt[0]);
        // dd($dt[0][6][0]);


        $uh='';
 
         \DB::beginTransaction();
        try {    
              
            for($i=6;$i<$tot_absen;$i++)
            {
                for($z=6;$z<$tot_row_st;$z++)
                {

                    $kd_type  = 'Pengetahuan';                   
                    $student_id = $dt[0][$z][3];
                    $kd_detail_id = $dt[0][$z][4];
               
                    $structure_tematic_id = $dt[0][3][$i];
           
                    $uh_ = explode('-', $dt[0][5][$i]);
                    $uh =$uh_[1];

                    $score = $dt[0][$z][$i];
                    

                    $cek_exist = \App\Models\Daily_exercise::
                    where('student_id', $student_id)
                    ->where('kd_detail_id',$kd_detail_id)
                    ->where('daily_exercise_type',$uh)
                    ->where('structure_tematic_id',$structure_tematic_id)
                    ->where('kd_type',$kd_type)
                    // ->where('score',$score)
                    ->where('step_study_id',stepStudyActive())
                    ->first();


                        if(empty($cek_exist))
                        {
                            if(!empty($score) )
                            {

                                $data['score'] = $score;
                                $data['student_id'] = $student_id;
                                $data['kd_detail_id'] = $kd_detail_id;
                                $data['daily_exercise_type'] = $uh;
                                $data['structure_tematic_id'] = $structure_tematic_id;
                                $data['kd_type'] = $kd_type;
                                $data['step_study_id'] = stepStudyActive();
                                $data['daily_exercise_insert_time'] = date('Y-m-d H:i:s');
                                $data['daily_exercise_insert_by']  = \Auth::user()->id;
                                
                                \App\Models\Daily_exercise::create($data);    
                            }
                        }
                        else
                        {
                            // \App\Models\Daily_exercise::
                            // where('daily_exercise_id', $cek_exist->daily_exercise_id)
                            // ->delete();

                            $data['score'] = $score;
                            $data['student_id'] = $student_id;
                            $data['kd_detail_id'] = $kd_detail_id;
                            $data['daily_exercise_type'] = $uh;
                            $data['structure_tematic_id'] = $structure_tematic_id;
                            $data['kd_type'] = $kd_type;
                            $data['step_study_id'] = stepStudyActive();
                            $data['daily_exercise_update_time'] = date('Y-m-d H:i:s');
                            $data['daily_exercise_update_by']  = \Auth::user()->id;
                            
                            \App\Models\Daily_exercise::where('daily_exercise_id',$cek_exist->daily_exercise_id)->update($data);                                    
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


    public function send_param_daily_exercise(Request $request)
    {
        $loop_uh = ['1','2','3','4'];
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  rowspan="2"  style="text-align:center" >No</th>
                <th  rowspan="2"  style="text-align:center"> Nama </th>
                <th  rowspan="2"  style="text-align:center"> Jenis Kelamin </th>
                <th  rowspan ="2"> KD </th>';

                foreach($request->params['structure_tematic'] as $dt)
                {
                    
                    $tb.='<th colspan="'.count($loop_uh).'" style="text-align:center;vertical-align: top" >'.$dt['structure_tematic_name'].'</th>';
                }
                    
              $tb.='</tr>';
                $tb.='<tr>';
                   foreach($request->params['structure_tematic'] as $dt)
                   {
                        foreach($loop_uh as $lu)
                        {
                            $tb.='<th style="text-align:center;vertical-align: top" >'.'PH-'.$lu.'</th>';
                        }
                   }
               $tb.='</tr></thead>';

        $tb .= '<tbody>';
        $val = '';
        // dd($request->params['data_kd2'][0]);
        $rowsp = (empty($request->params['tot_d'])) ? "" : $request->params['tot_d'] ;
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td  rowspan="'.$rowsp.'" >'.($key+1).'</td>';
                    $tb.='<td  rowspan="'.$rowsp.'" >'.$value['student_name'].'</td>';
                    $tb.='<td  rowspan="'.$rowsp.'" >'.$value['student_gender'].'</td>';

                    if(!empty($request->params['data_kd2']))
                    {
                        for($i= 0;$i<1;$i++)
                        {
                            $tb.='<td >'.$request->params['data_kd2'][$i]['kd_code'].'</td>';   
                        }


                        for($a= 0;$a<1;$a++)
                        {
                            foreach($request->params['structure_tematic'] as $dt)
                            {
                                foreach($loop_uh as $lu)
                                {
                                    $data_ex = \App\Models\Daily_exercise::where('student_id',$value['student_id'])
                                    ->where('kd_detail_id',$request->params['data_kd2'][$a]['kd_detail_id'])
                                    ->where('daily_exercise_type',$lu)
                                    ->where('structure_tematic_id',$dt['structure_tematic_id'])
                                    ->where('kd_type','Pengetahuan')
                                    ->first();
                                    $val_val = !empty($data_ex) ? $data_ex->score :'';
                                    $tb.='<td style="text-align:center;vertical-align: top" >'.$val_val.'</td>';
                                }
                            }
                        }
                    }
                    
                    
            $tb.='</tr>';
            $dh = [];

            if(!empty($request->params['data_kd2']))
            {

                for($b= 1;$b < count($request->params['data_kd2']);$b++)
                // foreach($request->params['data_kd2'] as $row2)
                {
                	$dh[] = $request->params['data_kd2'][$b]['kd_code'];
                	
                    $tb.='<tr>';
                        $tb.='<td>'.$request->params['data_kd2'][$b]['kd_code'].'</td>';
                         foreach($request->params['structure_tematic'] as $ddt)
                         {
                            foreach($loop_uh as $ll)
                            {
                                $data_ex = \App\Models\Daily_exercise::where('student_id',$value['student_id'])
                                ->where('kd_detail_id',$request->params['data_kd2'][$b]['kd_detail_id'])
                                ->where('daily_exercise_type',$ll)
                                ->where('structure_tematic_id',$ddt['structure_tematic_id'])
                                ->where('kd_type','Pengetahuan')
                                ->first();
                                $val_val = !empty($data_ex) ? $data_ex->score :'';
                                $tb.='<td style="text-align:center;vertical-align: top" >'.$val_val.'</td>';
                            }
                        }
                    $tb.='</tr>';
                }
            }
             
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


    public function daily_exercise_skill_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new DailyExercise, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_absen =  count($dt[0][8]);

         \DB::beginTransaction();
        try {    

            $kd_del = [];

                
            for($i=4;$i<$tot_absen;$i++)
            {
                $kd_del[] = $dt[0][8][$i];

            }


            $cek_ex_setting = \DB::table('setting_daily_exercise')
            ->whereIn('kd_id',$kd_del)
            // ->where('skill_type',$dt[0][10][$i])
            ->where('step_study_id',stepStudyActive())
            ->delete();
              
            for($i=4;$i<$tot_absen;$i++)
            {
               

                // if(empty($cek_ex_setting))
                // {
                    $data_insert['kd_id'] = $dt[0][8][$i];
                    $data_insert['skill_type'] = $dt[0][10][$i];
                    $data_insert['step_study_id'] = stepStudyActive();
                    $data_insert['created_at'] = date('Y-m-d H:i:s');
                    
                    \DB::table('setting_daily_exercise')->insert(
                            $data_insert
                        );
                // }
             
                for($z=11;$z<$tot_row_st;$z++)
                {
                    $skill_value = $dt[0][$z][$i];
                    $student_id = $dt[0][$z][1];
                    $skill_type = $dt[0][10][$i];
                    //$detail = $dt[0][8][$i];
                  
                    $kd_id = $dt[0][8][$i];

                    #cek apakah datanya ada 
                    $cek_exist = \App\Models\Daily_exercise_skill::
                    where('student_id', $student_id)
                    ->where('kd_id',$kd_id)
                    ->where('skill_type',$skill_type)
                    // ->where('skill_value',$skill_value)
                    ->where('step_study_id',stepStudyActive())
                    ->first();

                        #jika kosong dia insert baru
                        if(empty($cek_exist))
                        {
                            if(!empty($skill_value) )
                            {

                                $data['skill_value'] = $skill_value;
                                $data['student_id'] = $student_id;
                                $data['kd_id'] = $kd_id;
                                $data['skill_type'] = $skill_type;
                                $data['step_study_id'] = stepStudyActive();
                                $data['daily_exercise_skill_insert_time'] = date('Y-m-d H:i:s');
                                $data['daily_exercise_skill_insert_by']  = \Auth::user()->id;
                                
                                \App\Models\Daily_exercise_skill::create($data);    
                            }
                            else
                            {
                                #jika ada dia akan hapus dlu baru insert lagi
                                \App\Models\Daily_exercise_skill::where('student_id', $student_id)
                                ->where('kd_id',$kd_id)
                                ->where('skill_type',$skill_type)
                                // ->where('skill_value',$skill_value)
                                ->where('step_study_id',stepStudyActive())
                                ->delete();
                            }
                        }
                        else
                        {
                            $data_a['skill_value'] = $skill_value;
                            $data_a['student_id'] = $student_id;
                            $data_a['kd_id'] = $kd_id;
                            $data_a['skill_type'] = $skill_type;
                            $data_a['step_study_id'] = stepStudyActive();
                            $data_a['daily_exercise_skill_update_time'] = date('Y-m-d H:i:s');
                            $data_a['daily_exercise_skill_update_by']  = \Auth::user()->id;
                            
                            \App\Models\Daily_exercise_skill::where('daily_exercise_skill_id',$cek_exist->daily_exercise_skill_id)->update($data_a);
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


    public function send_param_daily_exercise_skill(Request $request)
    {
        $loop_uh = ['1','2','3','4'];
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
                <tr>
                    <th  rowspan="2"  style="text-align:center" >No</th>
                    <th  rowspan="2"  style="text-align:center"> Nama </th>
                    <th  rowspan ="2"> Jenis Kelamin </th>';

                    foreach($request->params['dt_k'] as $dd)
                    {
                        $tb.='<td style="text-align: center;" colspan="4">'.$dd['kd_code'].'</td>';    
                    }    
                '</tr>';
                $tb.='<tr>';
                foreach($request->params['dt_k'] as $dd)
                {
                    $val_ex =\DB::table('setting_daily_exercise')
                    ->where('kd_id',$dd['kd_id'])
                    ->where('step_study_id',stepStudyActive())
                    ->get();
                    foreach($val_ex as $ve)
                    {
                        $tb.='<td style="text-align: center;">'.$ve->skill_type.'</td>';        
                    }
                }    
                $tb.='</tr>';
            
            $tb.='</thead>';

        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr  rowspan="2">';
              $tb.='<td   >'.($key+1).'</td>';
                    $tb.='<td   >'.$value['student_name'].'</td>';
                    $tb.='<td   >'.$value['student_gender'].'</td>';


                
                    foreach($request->params['dt_k'] as $dd)
                    {
                        try {    
                            if($request->params['type_page'] == 'input_page')
                            {
                                $total_skill = \DB::select("
                                    select round(sum(total) / count(total) )  as t from (
                                        select max(skill_value ) as total from daily_exercise_skill des
                                        where skill_type ilike '%U%'
                                        and student_id = '".$value['student_id']."' and kd_id = '".$dd['kd_id']."'
                                        union all
                                        select max(skill_value ) as total from daily_exercise_skill des
                                        where skill_type ilike '%P2%'
                                        and student_id = '".$value['student_id']."' and kd_id = '".$dd['kd_id']."'
                                        union all
                                        select max(skill_value ) as total from daily_exercise_skill des
                                        where skill_type ilike '%P1%'
                                        and student_id = '".$value['student_id']."' and kd_id = '".$dd['kd_id']."'
                                    ) as t
                                "); 


                                \App\Models\Summary_skill::where('student_id',$value['student_id'])
                                ->where('kd_id',$dd['kd_id'])
                                ->where('step_study_id',stepStudyActive())
                                ->delete();


                                $dt['kd_id'] = $dd['kd_id'];
                                $dt['student_id'] = $value['student_id'];
                                $dt['step_study_id'] = stepStudyActive();
                                $dt['total_skill'] = $total_skill[0]->t;
                                \App\Models\Summary_skill::create($dt);

                            }
                         } 
                         catch (\Exception $e) 
                         {
                            return BaseException::jsonErrorResponse('1',$e->getMessage());    
                         }
                        



                        $val_ex =\DB::table('setting_daily_exercise')
                        ->where('kd_id',$dd['kd_id'])
                        ->where('step_study_id',stepStudyActive())
                        ->get();
                        foreach($val_ex as $ve)
                        {
                            $ori_val =\DB::table('daily_exercise_skill')
                            ->where('kd_id',$dd['kd_id'])
                            ->where('student_id',$value['student_id'])
                            ->where('skill_type',$ve->skill_type)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                            $val_ori = (!empty($ori_val)) ? $ori_val->skill_value :"";
                            $tb.='<td style="text-align: center;">'.$val_ori .'</td>';        
                        }
                    }    
                
            $tb.='</tr>';


        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }




    public function get_value(Request $request)
    {
        
        $data_ex = \App\Models\Daily_exercise::where('student_id',$request->student_id)
        ->where('kd_detail_id',$request->kd_detail_id)
        ->where('daily_exercise_type',$request->uh)
        ->where('structure_tematic_id',$request->structure_tematic_id)
        ->where('kd_type',$request->kd_type)
        ->first();

        $score  = (!empty($data_ex)) ? $data_ex->score : "";
        return response()->json(['status' => 'success','data'=>$score]);             

    }
}
