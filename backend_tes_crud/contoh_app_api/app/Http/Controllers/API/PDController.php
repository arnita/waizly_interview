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
use App\Imports\PD;
use Auth;
use App\Exceptions\BaseException;


class PDController extends Controller
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
            $data_ex = \App\Models\PD::
            where('student_id',$request->student_id)
            ->where('pd_type',$request->pd_type)
            ->where('pd_category',$request->pd_category);
            $data_ex = $data_ex->first();



            if(!empty($data_ex))
            {

                $update = \App\Models\PD::find($data_ex->pd_id);
                $update->pd_value = $request->pd_value;
                $update->step_study_id = stepStudyActive();
                $update->pd_update_time = date('Y-m-d H:i:s');
                $update->pd_update_by  = \Auth::user()->id;
                $update->save();

                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                $data['pd_type'] = $request->pd_type;
                $data['pd_value'] = $request->pd_value;
                $data['pd_category'] = $request->pd_category;
                $data['student_id'] = $request->student_id;
        
                $data['pd_insert_time'] = date('Y-m-d H:i:s');
                $data['pd_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\PD::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

    public function get_value_pd(Request $request)
    {
        $data_ob = \App\Models\PD::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('pd_value',$request->pd_value)
        ->where('pd_type',$request->pd_type)
        ->where('pd_category',$request->pd_category)
        ->first();

        $pd_value  = (!empty($data_ob)) ? 1 : "";
        return response()->json(['status' => 'success','data'=>$pd_value]);         
    }





    public function pd_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new PD, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_pd = count($dt[0][8]);
        
         \DB::beginTransaction();
        try {    

            
                
              
            for($i=5;$i<$tot_pd;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z][1];
                  
                    $val_val=$dt[0][$z][$i-1];
                    
                    if(!empty($dt[0][3][$i-1]))
                    {
                        $pd_type = $dt[0][3][$i-1]; 
                        $ob  = \App\Models\Parlookup::where('name', $pd_type)->first();
                        $pd_category = (!empty($ob)) ? $ob->category :""; 
                    }
                    else
                    {
                        $pd_type = '';
                        $pd_category = '';
                    }
                


                $cek_exist = 
                \App\Models\PD::where('student_id',$student_id)
                ->where('pd_type',$pd_type)
                ->where('pd_category',$pd_category)
                 ->where('pd_value',$val_val)
                ->where('step_study_id',stepStudyActive())
                ->first();
                    
                if(empty($cek_exist))
                {          
                    
                    

                        if(!empty($val_val))
                        {

                           $kk = 
                            \App\Models\PD::where('student_id',$student_id)
                            ->where('pd_type',$pd_type)
                            ->where('pd_category',$pd_category)
                             // ->where('pd_value',$val_val)
                            ->where('step_study_id',stepStudyActive())
                            ->first();


                             if(!empty($kk->pd_id))
                            {
                                $update['pd_type'] =$pd_type;
                                $update['pd_category'] = $pd_category;
                                $update['pd_value'] = $val_val;
                                 $ex = 
                                \App\Models\PD::
                                where('pd_id', $kk->pd_id)
                                ->where('step_study_id',stepStudyActive())
                                ->update($update);
                            }
                            else
                            {
                                 $data_a =
                                    [
                                       'student_id' => $student_id,
                                        'pd_value' => $val_val,
                                        'pd_insert_time' => date('Y-m-d H:i:s'),
                                        'pd_insert_by' => \Auth::user()->user_id,
                                        'pd_category'=>$pd_category,
                                        'pd_type'=>$pd_type,
                                        'step_study_id'=>stepStudyActive(),
                                    ];
                                
                                    \App\Models\PD::create($data_a);
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


    public function send_param_pd(Request $request)
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
                        
                            $data_sp = \App\Models\PD::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('pd_category','spiritual')
                            ->where('pd_type',$sp['name'])
                            ->where('pd_value',$tp)
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['pd_value'] : "";
                            $tb.='<td>'.$sp_value. '</td>';
                        }
                    }

                    foreach($request->params['sosial'] as $so)
                    {
                        foreach($type as $tp)
                        {
                            $data_so = \App\Models\PD::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('pd_category','sosial')
                            ->where('pd_type',$so['name'])
                             ->where('pd_value',$tp)
                            ->first();
                             $so_value  = (!empty($data_so)) ? $data_so['pd_value'] : "";
                            $tb.='<td>'.$so_value.'</td>';
                        }
                    }

            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }

}
