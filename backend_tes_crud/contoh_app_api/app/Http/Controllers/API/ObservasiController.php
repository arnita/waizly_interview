<?php

/*

    CLASS FOR MANAGEMENT INPUT OBSERVASI ,
    CREATED BY ARIEF MANGGALA PUTRA 
    24 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com

*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\Observasi;
use Auth;
use App\Exceptions\BaseException;


class ObservasiController extends Controller
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
            $data_ex = \App\Models\Observasi::
            where('student_id',$request->student_id)
            ->where('observasi_type',$request->observasi_type)
            ->where('observasi_category',$request->observasi_category);
            $data_ex = $data_ex->first();



            if(!empty($data_ex))
            {

                $update = \App\Models\Observasi::find($data_ex->observasi_id);
                $update->observasi_value = $request->observasi_value;
                $update->step_study_id = stepStudyActive();
                $update->observasi_update_time = date('Y-m-d H:i:s');
                $update->observasi_update_by  = \Auth::user()->id;
                $update->save();

                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                $data['observasi_type'] = $request->observasi_type;
                $data['observasi_value'] = $request->observasi_value;
                $data['observasi_category'] = $request->observasi_category;
                $data['student_id'] = $request->student_id;
        
                $data['observasi_insert_time'] = date('Y-m-d H:i:s');
                $data['observasi_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Observasi::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }


    public function observasi_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Observasi, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_observasi = count($dt[0][8]);
        
         \DB::beginTransaction();
        try {    
              
            for($i=5;$i<$tot_observasi;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z][1];
                  
                        $val_val=$dt[0][$z][$i-1];
                    
                    if(!empty($dt[0][3][$i-1]))
                    {
                        $observasi_type = $dt[0][3][$i-1]; 
                        $ob  = \App\Models\Parlookup::where('name', $observasi_type)->first();
                        $observasi_category = (!empty($ob)) ? $ob->category :""; 
                    }
                    else
                    {
                        $observasi_type = '';
                        $observasi_category = '';
                    }

                
                $cek_exist = 
                \App\Models\Observasi::where('student_id',$student_id)
                ->where('observasi_type',$observasi_type)
                ->where('observasi_category',$observasi_category)
                 ->where('observasi_value',$val_val)
                ->where('step_study_id',stepStudyActive())
                ->first();
                    
                if(empty($cek_exist))
                {          
                    
                        if(!empty($val_val))
                        {

                           $kk = 
                            \App\Models\Observasi::where('student_id',$student_id)
                            ->where('observasi_type',$observasi_type)
                            ->where('observasi_category',$observasi_category)
                             // ->where('observasi_value',$val_val)
                            ->where('step_study_id',stepStudyActive())
                            ->first();


                             if(!empty($kk->observasi_id))
                            {
                                $update['observasi_type'] =$observasi_type;
                                $update['observasi_category'] = $observasi_category;
                                $update['observasi_value'] = $val_val;
                                 $ex = 
                                \App\Models\Observasi::
                                where('observasi_id', $kk->observasi_id)
                                ->where('step_study_id',stepStudyActive())
                                ->update($update);
                            }
                            else
                            {
                                 $data_a =
                                    [
                                       'student_id' => $student_id,
                                        'observasi_value' => $val_val,
                                        'observasi_insert_time' => date('Y-m-d H:i:s'),
                                        'observasi_insert_by' => \Auth::user()->user_id,
                                        'observasi_category'=>$observasi_category,
                                        'observasi_type'=>$observasi_type,
                                        'step_study_id'=>stepStudyActive(),
                                    ];
                                
                                    \App\Models\Observasi::create($data_a);
                            }   
                    }

                }
               


                    // $cek_exist = 
                    // \App\Models\Observasi::where('student_id', $student_id)
                    // // ->where('observasi_type',$observasi_type)
                    // // ->where('observasi_category',$observasi_category)
                    //  // ->where('observasi_value',$val_val)
                    // ->where('step_study_id',stepStudyActive())
                    // ->first();
                    

                    //     if(empty($cek_exist))
                    //     {
                    //         if(!empty($val_val ))
                    //         {
                                
                    //             $data_i =
                    //             [
                    //                 'student_id' => $student_id,
                    //                 'observasi_value' => $val_val,
                    //                 'observasi_insert_time' => date('Y-m-d H:i:s'),
                    //                 'observasi_insert_by' => \Auth::user()->user_id,
                    //                 'observasi_category'=>$observasi_category,
                    //                 'observasi_type'=>$observasi_type,
                    //                 'step_study_id'=>stepStudyActive(),
                    //             ];
                                
                    //             \App\Models\Observasi::create($data_i);

                    //         }       

                    //     }
                    //     else
                    //     {

                    //         if(!empty($val_val ))
                    //         {

                    //             \App\Models\Observasi::find($cek_exist->observasi_id)
                    //             // ->where('friendly_value_type',$friendly_value_type)
                    //             // ->where('friendly_value_category',$friendly_value_category)
                    //             // ->where('friendly_value_value',$val_val)
                    //             // ->where('step_study_id',stepStudyActive())
                    //             ->delete();

                    //         // \App\Models\Observasi::where('student_id', $student_id)
                    //         // ->where('observasi_type',$observasi_type)
                    //         // ->where('observasi_category',$observasi_category)
                    //         //  ->where('observasi_value',$val_val)
                    //         // ->where('step_study_id',stepStudyActive())
                    //         // ->delete();

                    //          $data_a =
                    //             [
                    //                'student_id' => $student_id,
                    //                 'observasi_value' => $val_val,
                    //                 'observasi_insert_time' => date('Y-m-d H:i:s'),
                    //                 'observasi_insert_by' => \Auth::user()->user_id,
                    //                 'observasi_category'=>$observasi_category,
                    //                 'observasi_type'=>$observasi_type,
                    //                 'step_study_id'=>stepStudyActive(),
                    //             ];
                                
                    //             \App\Models\Observasi::create($data_a);
                    //         }
                    //     }


                }
            }
           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }


    public function send_param_observasi(Request $request)
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
                        
                            $data_sp = \App\Models\Observasi::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('observasi_category','spiritual')
                            ->where('observasi_type',$sp['name'])
                            ->where('observasi_value',$tp)
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['observasi_value'] : "";
                            $tb.='<td>'.$sp_value. '</td>';
                        }
                    }

                    foreach($request->params['sosial'] as $so)
                    {
                        foreach($type as $tp)
                        {
                            $data_so = \App\Models\Observasi::
                            where('student_id',$value['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('observasi_category','sosial')
                            ->where('observasi_type',$so['name'])
                             ->where('observasi_value',$tp)
                            ->first();
                             $so_value  = (!empty($data_so)) ? $data_so['observasi_value'] : "";
                            $tb.='<td>'.$so_value.'</td>';
                        }
                    }

            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }




    public function get_value_observasi(Request $request)
    {
        $data_ob = \App\Models\Observasi::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('observasi_value',$request->observasi_value)
        ->where('observasi_type',$request->observasi_type)
        ->where('observasi_category',$request->observasi_category)
        ->first();

        // dd($data_ob);

        $observasi_value  = (!empty($data_ob)) ? 1 : "";
        return response()->json(['status' => 'success','data'=>$observasi_value]);         
    }
}
