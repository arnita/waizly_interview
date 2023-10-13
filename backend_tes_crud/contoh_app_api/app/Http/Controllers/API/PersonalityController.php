<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\Personality;
use App\Exceptions\BaseException;

class PersonalityController extends Controller
{
    //


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
            $data_ex = \App\Models\Personality::
            where('student_id',$request->student_id)
            ->where('personality_type',$request->personality_type)
            ->first();
            if(!empty($data_ex))
            {
                $data_['personality_value'] = $request->personality_value;
                $data_['student_id'] = $request->student_id;
                $data_['personality_type'] = $request->personality_type;
                $data_['personality_update_time'] = date('Y-m-d H:i:s');
                $data_['personality_update_by']  = \Auth::user()->id;
                \App\Models\Personality::
                where('student_id',$request->student_id)
                ->where('personality_type',$request->personality_type)
                ->where('month',$request->month)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['personality_value'] = $request->personality_value;
                $data['student_id'] = $request->student_id;
                $data['personality_type'] = $request->personality_type;
                $data['personality_insert_time'] = date('Y-m-d H:i:s');
                $data['personality_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Personality::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }




    public function personality_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Personality, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_personality = count($dt[0][2]);
    
        \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_personality;$i++)
            {
                for($z=4;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z][1];
                    $personality_type =  $dt[0][3][$i];
                  
                    $personality_value= $dt[0][$z][$i];


                    $cek_exist = 
                    \App\Models\Personality::where('student_id', $student_id)
                    ->where('personality_type',$personality_type)
                    ->where('step_study_id',stepStudyActive())
                    ->first();
                    

                        if(empty($cek_exist))
                        {
                            if(!empty($personality_value ))
                            {
                                \App\Models\Personality::where('student_id', $student_id)
                                ->where('personality_type',$personality_type)
                            ->where('step_study_id',stepStudyActive())
                            ->delete();
                                $data_i =
                                [
                                    'student_id' => $student_id,
                                    'personality_value' => $personality_value,
                                    'personality_insert_time' => date('Y-m-d H:i:s'),
                                    'personality_insert_by' => \Auth::user()->user_id,
                                    'personality_type'=>$personality_type,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Personality::create($data_i);

                            }       

                        }
                        else
                        {
                            \App\Models\Personality::where('student_id', $student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                   'student_id' => $student_id,
                                    'personality_value' => $personality_value,
                                    'personality_insert_time' => date('Y-m-d H:i:s'),
                                    'personality_insert_by' => \Auth::user()->user_id,
                                    'personality_type'=>$personality_type,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Personality::create($data_a);
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


    public function send_param_personality(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                    <th  style="text-align:center" >No</th>
                    <th  style="text-align:center"> Nama </th>
                    <th> Jenis Kelamin</th>';
                    foreach($request->params['personality_type'] as $tp)
                    {
                        
                        $tb.='<th>'.$tp['name'].'</th>';
                    }
                    
               $tb.='</tr>';
            '</thead>';

        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td>'.($key+1).'</td>';
                    $tb.='<td>'.$value['student_name'].'</td>';
                    $tb.='<td>'.$value['student_gender'].'</td>';
                    foreach($request->params['personality_type'] as $dt)
                    {
                        // foreach($request->params['personality_type']  as $tt)
                        // {
                            $data_sp = \App\Models\Personality::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('personality_type',$dt['name'])
                            // ->where('personality_value',$dt['personality_value'])
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['personality_value'] : "";
                        //}
                             // $tb.='<td>'.$sp_value.'</td>';
                            $tb.='<td>'.$sp_value.'</td>';
                    }


            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }

    

    public function get_value_personality(Request $request)
    {

        $data_personality = \App\Models\Personality::
        where('student_id',$request->student_id)
        ->where('personality_type','ilike','%'.$request->personality_type.'%')
        ->first();

        $personality_value  = (!empty($data_personality)) ? $data_personality->personality_value : "";
        return response()->json(['status' => 'success','data'=>$personality_value]);             
    }
}
