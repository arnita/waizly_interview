<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\Prestation;
use Auth;
use App\Exceptions\BaseException;


class PrestationController extends Controller
{
    //



    public function prestation_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Prestation, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_prestation = count($dt[0][2]); //column
 	
        $get_val =  explode('-', $dt[0][5][4]);    

        
         \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_prestation;$i++)
            {
                for($z=4;$z<$tot_row_st;$z++)
                {

                    $student_id =  $dt[0][$z][1];

                    if(!empty($dt[0][4][$i]))
                    {
                        
                        // dd($vl[1]);
                            $vl_type  = explode('-', $dt[0][3][$i]);                    
                            $vl = explode('-', $dt[0][$z][$i]);
                            $type =$vl_type[1];
                            $value =$vl[0];
                            $desc = $vl[1];    
                        
                        
                    }
                   
                   
                   // }
               
                    $cek_exist = \App\Models\Prestation::where('student_id', $student_id)
                    ->where('desc',$desc)
                    ->where('value',$value)
                    ->where('type',$type)
                    ->where('step_study_id',stepStudyActive())
                    ->first();


                        if(empty($cek_exist))
                        {
                            if(!empty($dt[0][$z][$i]))
                            {
                                 $data_a =
                                [
                                    'student_id' => $student_id,
                                    'desc' => $desc,
                                    'value' => $value,
                                    'type' => $type,
                                    'prestation_insert_time' => date('Y-m-d H:i:s'),
                                    'prestation_insert_by' => \Auth::user()->user_id,
                                    
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Prestation::create($data_a);
 
                            }
                               
                            

                        }
                        else
                        {
                            if(!empty($dt[0][$z][$i]))
                            {
                                \App\Models\Prestation::where('student_id', $student_id)
                                ->where('desc',$desc)
                                ->where('value',$value)
                                ->where('type',$type)
                                ->where('step_study_id',stepStudyActive())
                                ->delete();

                                 $data_a =
                                    [
                                        'student_id' => $student_id,
                                        'desc' => $desc,
                                        'value' => $value,
                                        'type' => $type,
                                        'prestation_update_time' => date('Y-m-d H:i:s'),
                                        'prestation_update_by' => \Auth::user()->user_id,
                                        'step_study_id'=>stepStudyActive(),
                                    ];
                                    
                                    \App\Models\Prestation::create($data_a);
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


    public function send_param_prestation(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th    style="text-align:center" >No</th>
                <th    style="text-align:center"> Nama </th>
                <th > Jenis Kelamin</th>';
                for($i=1;$i<3;$i++)
                {
                	$tb.='<th  style="text-align: center;">Prestasi-'.$i.'</th>';
                }
              '</tr>';
            '</thead>';

        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td>'.($key+1).'</td>';
                    $tb.='<td>'.$value['student_name'].'</td>';
                    $tb.='<td>'.$value['student_gender'].'</td>';
                for($i=1;$i<3;$i++)
                {
                    
                     $ab= \App\Models\Prestation::
                    where('student_id',$value['student_id'])
                    ->where('step_study_id',stepStudyActive())
                    ->where('type',$i)
                    ->first();
                    if(!empty($ab))
                    {
                        $tb.='<td  style="text-align: center;">'.$ab->value.' - '.$ab->desc. '</td>';
                        
                    }
                        
                }
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


}
