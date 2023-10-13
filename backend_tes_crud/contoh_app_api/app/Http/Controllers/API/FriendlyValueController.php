<?php

/*
    CREATED BY ARIEF MANGGALA PUTRA 
    25 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\FriendlyValue;
use Auth;
use App\Exceptions\BaseException;

class FriendlyValueController extends Controller
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
            $data_ex = \App\Models\FriendlyValue::
            where('student_id',$request->student_id)
            ->where('friendly_value_type',$request->friendly_value_type)
            ->where('friendly_value_category',$request->friendly_value_category);
            $data_ex = $data_ex->first();



            if(!empty($data_ex))
            {

                $update = \App\Models\FriendlyValue::find($data_ex->friendly_value_id);
                $update->friendly_value_value = $request->friendly_value_value;
                $update->step_study_id = stepStudyActive();
                $update->friendly_value_update_time = date('Y-m-d H:i:s');
                $update->friendly_value_update_by  = \Auth::user()->id;
                $update->save();

                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                $data['friendly_value_type'] = $request->friendly_value_type;
                $data['friendly_value_value'] = $request->friendly_value_value;
                $data['friendly_value_category'] = $request->friendly_value_category;
                $data['student_id'] = $request->student_id;
        
                $data['friendly_value_insert_time'] = date('Y-m-d H:i:s');
                $data['friendly_value_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\FriendlyValue::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

    public function get_value_friendly_value(Request $request)
    {
        $data_ob = \App\Models\FriendlyValue::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('friendly_value_value',$request->friendly_value_value)
        ->where('friendly_value_type',$request->friendly_value_type)
        ->where('friendly_value_category',$request->friendly_value_category)
        ->first();

        $friendly_value_value  = (!empty($data_ob)) ? 1 : "";
        return response()->json(['status' => 'success','data'=>$friendly_value_value]);         
    }



    public function friendly_value_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new FriendlyValue, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_friendly_value = count($dt[0][8]);
        
         \DB::beginTransaction();
        try {    
              
            for($i=5;$i<$tot_friendly_value;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z][1];
                  
                    $val_val=$dt[0][$z][$i-1];
                    
                    if(!empty($dt[0][3][$i-1]))
                    {
                        $friendly_value_type = $dt[0][3][$i-1]; 
                        $ob  = \App\Models\Parlookup::where('name', $friendly_value_type)->first();
                        $friendly_value_category = (!empty($ob)) ? $ob->category :""; 
                    }
                    else
                    {
                        $friendly_value_type = '';
                        $friendly_value_category = '';
                    }

          

                    $cek_exist = 
                    \App\Models\FriendlyValue::where('student_id', $student_id)
                    ->where('friendly_value_type',$friendly_value_type)
                    ->where('friendly_value_category',$friendly_value_category)
                     // ->where('friendly_value_value',$val_val)
                    ->where('step_study_id',stepStudyActive())
                    ->first();
                    

                        if(empty($cek_exist))
                        {
                            if(!empty($val_val ))
                            {
                               
                                $data_i =
                                [
                                    'student_id' => $student_id,
                                    'friendly_value_value' => $val_val,
                                    'friendly_value_insert_time' => date('Y-m-d H:i:s'),
                                    'friendly_value_insert_by' => \Auth::user()->user_id,
                                    'friendly_value_category'=>$friendly_value_category,
                                    'friendly_value_type'=>$friendly_value_type,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\FriendlyValue::create($data_i);

                            }       

                        }
                        else
                        {
                            if(!empty($val_val ))
                            {

                                \App\Models\FriendlyValue::
                                // find($cek_exist->friendly_value_id)
                                where('friendly_value_type',$friendly_value_type)
                                ->where('friendly_value_category',$friendly_value_category)
                                // ->where('friendly_value_value',$val_val)
                                ->where('step_study_id',stepStudyActive())
                                ->delete();

                                 $data_a =
                                    [
                                       'student_id' => $student_id,
                                        'friendly_value_value' => $val_val,
                                        'friendly_value_insert_time' => date('Y-m-d H:i:s'),
                                        'friendly_value_insert_by' => \Auth::user()->user_id,
                                        'friendly_value_category'=>$friendly_value_category,
                                        'friendly_value_type'=>$friendly_value_type,
                                        'step_study_id'=>stepStudyActive(),
                                    ];
                                    
                                    \App\Models\FriendlyValue::create($data_a);
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


    public function send_param_friendly_value(Request $request)
    {
        $type = ['SB','PB'];
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                    <th  rowspan="2"  style="text-align:center" >No</th>
                    <th  rowspan="2"  style="text-align:center"> Nama </th>
                    <th  rowspan ="2"> Jenis Kelamin</th>';
                    foreach($request->params['spiritual'] as $sp)
                    {
                        $tb.='<th colspan="2">'.$sp['name'].'</th>';
                    }
                    
                    foreach($request->params['sosial'] as $so)
                    {
                        $tb.='<th colspan="2">'.$so['name'].'</th>';
                    }

               $tb.='</tr>';
               $tb .='<tr>';
                    foreach($request->params['spiritual'] as $sp)
                    {
                        foreach($type as $tp)
                        {
                            $tb.='<th>'.$tp.'</th>';
                        }
                    }
                    
                    foreach($request->params['sosial'] as $so)
                    {
                        foreach($type as $tp)
                        {
                             $tb.='<th>'.$tp.'</th>';
                        }
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
                    foreach($request->params['spiritual'] as $sp)
                    {
                        foreach($type as $tp)
                        {
                        
                            $data_sp = \App\Models\FriendlyValue::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('friendly_value_category','spiritual')
                            ->where('friendly_value_type',$sp['name'])
                            ->where('friendly_value_value',$tp)
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['friendly_value_value'] : "";
                            $tb.='<td>'.$sp_value. '</td>';
                        }
                    }

                    foreach($request->params['sosial'] as $so)
                    {
                        foreach($type as $tp)
                        {
                            $data_so = \App\Models\FriendlyValue::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('friendly_value_category','sosial')
                            ->where('friendly_value_type',$so['name'])
                             ->where('friendly_value_value',$tp)
                            ->first();
                             $so_value  = (!empty($data_so)) ? $data_so['friendly_value_value'] : "";
                            $tb.='<td>'.$so_value.'</td>';
                        }
                    }

            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }




}
