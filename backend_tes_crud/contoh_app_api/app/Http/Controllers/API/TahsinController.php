<?php

/*
    CREATED BY ARIEF MANGGALA PUTRA 
    26 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\Tahsin;
use App\Exceptions\BaseException;


class TahsinController extends Controller
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
            $data_ex = \App\Models\Tahsin::
            where('student_id',$request->student_id)
            ->where('tahsin_type',$request->tahsin_type)
            ->first();
            if(!empty($data_ex))
            {
                $data_['tahsin_value'] = $request->tahsin_value;
                $data_['student_id'] = $request->student_id;
                $data_['tahsin_type'] = $request->tahsin_type;
                $data['step_study_id'] = stepStudyActive();
                $data_['tahsin_update_time'] = date('Y-m-d H:i:s');
                $data_['tahsin_update_by']  = \Auth::user()->id;
                \App\Models\Tahsin::
                where('student_id',$request->student_id)
                ->where('tahsin_type',$request->tahsin_type)
                ->where('month',$request->month)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['tahsin_value'] = $request->tahsin_value;
                $data['step_study_id'] = stepStudyActive();
                $data['student_id'] = $request->student_id;
                $data['tahsin_type'] = $request->tahsin_type;
                $data['tahsin_insert_time'] = date('Y-m-d H:i:s');
                $data['tahsin_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Tahsin::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }



    public function tahsin_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Tahsin, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_tahsin = count($dt[0][4]);


         \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_tahsin;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z-1][1];
                    $tahsin_type =  $dt[0][3][$i];
                  
                    $tahsin_value= $dt[0][$z-1][$i];

                    // $cek_exist = 
                    // \App\Models\Tahsin::where('student_id', $student_id)
                    // ->where('tahsin_type',$tahsin_type)
                    // ->where('step_study_id',stepStudyActive())
                    // ->first();
                    

                        // if(empty($cek_exist))
                        // {
                        //     if(!empty($tahsin_value ))
                        //     {
                        //         \App\Models\Tahsin::where('student_id', $student_id)
                        //         ->where('tahsin_type',$tahsin_type)
                        //     ->where('step_study_id',stepStudyActive())
                        //     ->delete();
                        //         $data_i =
                        //         [
                        //             'student_id' => $student_id,
                        //             'tahsin_value' => $tahsin_value,
                        //             'tahsin_insert_time' => date('Y-m-d H:i:s'),
                        //             'tahsin_insert_by' => \Auth::user()->user_id,
                        //             'tahsin_type'=>$tahsin_type,
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];
                                
                        //         \App\Models\Tahsin::create($data_i);

                        //     }       

                        // }
                        // else
                        // {
                            \App\Models\Tahsin::where('student_id', $student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->where('tahsin_type',$tahsin_type)
                            ->delete();

                             $data_a =
                                [
                                   'student_id' => $student_id,
                                    'tahsin_value' => $tahsin_value,
                                    'tahsin_insert_time' => date('Y-m-d H:i:s'),
                                    'tahsin_insert_by' => \Auth::user()->user_id,
                                    'tahsin_type'=>$tahsin_type,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Tahsin::create($data_a);
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


    public function send_param_tahsin(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                    <th  style="text-align:center" >No</th>
                    <th  style="text-align:center"> Nama </th>
                    <th> Jenis Kelamin</th>';
                    foreach($request->params['tahsin_type'] as $tp)
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
                    $tb.='<td>'.$value['student']['student_name'].'</td>';
                    $tb.='<td>'.$value['student']['student_gender'].'</td>';
                    foreach($request->params['tahsin_type'] as $dt)
                    {
                        // foreach($request->params['tahsin_type']  as $tt)
                        // {
                        
                            $data_sp = \App\Models\Tahsin::
                            where('student_id',$value['student']['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('tahsin_type',$dt['name'])
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['tahsin_value'] : "";
                        //}
                             $tb.='<td>'.$sp_value.'</td>';

                    }

            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


    

    public function get_value_tahsin(Request $request)
    {

        $data_tahsin = \App\Models\Tahsin::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('tahsin_type',$request->tahsin_type)
        ->first();

        $tahsin_value  = (!empty($data_tahsin)) ? $data_tahsin->tahsin_value : "";
        return response()->json(['status' => 'success','data'=>$tahsin_value]);             
    }

}
