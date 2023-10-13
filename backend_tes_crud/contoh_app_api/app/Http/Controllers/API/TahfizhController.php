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
use App\Imports\Tahfizh;
use App\Exceptions\BaseException;


class TahfizhController extends Controller
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
            $data_ex = \App\Models\Tahfizh::
            where('student_id',$request->student_id)
            ->where('tahfizh_type',$request->tahfizh_type)
            ->first();
            if(!empty($data_ex))
            {
                $data_['tahfizh_value'] = $request->tahfizh_value;
                $data_['student_id'] = $request->student_id;
                $data_['tahfizh_type'] = $request->tahfizh_type;
                $data['step_study_id'] = stepStudyActive();
                $data_['tahfizh_update_time'] = date('Y-m-d H:i:s');
                $data_['tahfizh_update_by']  = \Auth::user()->id;
                \App\Models\Tahfizh::
                where('student_id',$request->student_id)
                ->where('tahfizh_type',$request->tahfizh_type)
                ->where('month',$request->month)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['tahfizh_value'] = $request->tahfizh_value;
                $data['step_study_id'] = stepStudyActive();
                $data['student_id'] = $request->student_id;
                $data['tahfizh_type'] = $request->tahfizh_type;
                $data['tahfizh_insert_time'] = date('Y-m-d H:i:s');
                $data['tahfizh_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Tahfizh::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

      public function tahfizh_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Tahfizh, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_tahfizh = count($dt[0][4]);


         \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_tahfizh;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    
                    $student_id =  $dt[0][$z-1][1];
                    $tahfizh_type =  $dt[0][3][$i];
                  
                    $tahfizh_value= $dt[0][$z-1][$i];

                    // $cek_exist = 
                    // \App\Models\Tahfizh::where('student_id', $student_id)
                    // ->where('tahfizh_type',$tahfizh_type)
                    // ->where('step_study_id',stepStudyActive())
                    // ->first();
                    

                        // if(empty($cek_exist))
                        // {
                        //     if(!empty($tahfizh_value ))
                        //     {
                        //         \App\Models\Tahfizh::where('student_id', $student_id)
                        //         ->where('tahfizh_type',$tahfizh_type)
                        //     ->where('step_study_id',stepStudyActive())
                        //     ->delete();
                        //         $data_i =
                        //         [
                        //             'student_id' => $student_id,
                        //             'tahfizh_value' => $tahfizh_value,
                        //             'tahfizh_insert_time' => date('Y-m-d H:i:s'),
                        //             'tahfizh_insert_by' => \Auth::user()->user_id,
                        //             'tahfizh_type'=>$tahfizh_type,
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];
                                
                        //         \App\Models\Tahfizh::create($data_i);

                        //     }       

                        // }
                        // else
                        // {
                            \App\Models\Tahfizh::where('student_id', $student_id)
                            ->where('tahfizh_type',$tahfizh_type)
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                   'student_id' => $student_id,
                                    'tahfizh_value' => $tahfizh_value,
                                    'tahfizh_insert_time' => date('Y-m-d H:i:s'),
                                    'tahfizh_insert_by' => \Auth::user()->user_id,
                                    'tahfizh_type'=>$tahfizh_type,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Tahfizh::create($data_a);
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


    public function send_param_tahfizh(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                    <th  style="text-align:center" >No</th>
                    <th  style="text-align:center"> Nama </th>
                    <th> Jenis Kelamin</th>';
                    foreach($request->params['tahfizh_type'] as $tp)
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
                    foreach($request->params['tahfizh_type'] as $dt)
                    {
                        // foreach($request->params['tahfizh_type']  as $tt)
                        // {
                        
                            $data_sp = \App\Models\Tahfizh::
                            where('student_id',$value['student']['student_id'])
                            ->where('step_study_id',stepStudyActive())
                            ->where('tahfizh_type',$dt['name'])
                            ->first();
                             $sp_value  = (!empty($data_sp)) ? $data_sp['tahfizh_value'] : "";
                        //}
                             $tb.='<td>'.$sp_value.'</td>';

                    }

            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


    public function get_value_tahfizh(Request $request)
    {

        $data_tahfizh = \App\Models\Tahfizh::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('tahfizh_type','ilike','%'.$request->tahfizh_type.'%')
        ->first();

        $tahfizh_value  = (!empty($data_tahfizh)) ? $data_tahfizh->tahfizh_value : "";
        return response()->json(['status' => 'success','data'=>$tahfizh_value]);             
    }
}
