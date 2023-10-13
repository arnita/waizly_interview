<?php
/*

    CLASS FOR MANAGEMENT ABSEN ,
    CREATED BY ARIEF MANGGALA PUTRA 
    24 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\API;
use Excel; 
use App\Imports\Absensi;
use Auth;
use App\Exceptions\BaseException;

class AbsensiController extends Controller
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
            $data_ex = \App\Models\Absensi::
            where('student_id',$request->student_id)
            ->where('absensi_type',$request->absensi_type)
            ->where('month',$request->month)
            ->first();
            if(!empty($data_ex))
            {
                $data_['absensi_total'] = $request->absensi_total;
                $data_['student_id'] = $request->student_id;
                $data_['absensi_type'] = $request->absensi_type;
                $data_['month'] = $request->month;
                $data['step_study_id'] = stepStudyActive();
                $data_['absensi_update_time'] = date('Y-m-d H:i:s');
                $data_['absensi_update_by']  = \Auth::user()->id;
                \App\Models\Absensi::
                where('student_id',$request->student_id)
                ->where('absensi_type',$request->absensi_type)
                ->where('month',$request->month)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['absensi_total'] = $request->absensi_total;
                $data['step_study_id'] = stepStudyActive();
                $data['student_id'] = $request->student_id;
                $data['absensi_type'] = $request->absensi_type;
                $data['month'] = $request->month;
                $data['absensi_insert_time'] = date('Y-m-d H:i:s');
                $data['absensi_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Absensi::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

 

    public function absensi_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Absensi, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_absen =  count($dt[0][3]);

        \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_absen;$i++)
            {
                for($z=6;$z<$tot_row_st;$z++)
                {
                    $ab = explode('-', $dt[0][4][$i]);
                    $student_id =  $dt[0][$z][1];
                    $val =  $dt[0][$z][$i];
                    $type = $dt[0][5][$i];
                    $month = $dt[0][4][$i];



                    $cek_exist = \App\Models\Absensi::where('student_id', $student_id)
                    ->where('month',$month)
                    ->where('absensi_type',$type)
                    ->where('step_study_id',stepStudyActive())
                    ->first();


                        if(empty($cek_exist))
                        {
                            if($val > 0 )
                            {
                                $data_a =
                                [
                                    'student_id' => $student_id,
                                    'month' => $month,
                                    'absensi_insert_time' => date('Y-m-d H:i:s'),
                                    'absensi_insert_by' => \Auth::user()->user_id,
                                    'absensi_type'=>$type,
                                    'absensi_total'=>$val,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Absensi::create($data_a);

                            }       

                        }
                        else
                        {

                             $data_a =
                                [
                                    'student_id' => $student_id,
                                    'month' => $month,
                                    'absensi_update_time' => date('Y-m-d H:i:s'),
                                    'absensi_update_by' => \Auth::user()->user_id,
                                    'absensi_type'=>$type,
                                    'absensi_total'=>$val,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Absensi::where('absensi_id',$cek_exist->absensi_id)->update($data_a);
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


    public function send_param_absensi(Request $request)
    {
        $loop_month = ['S','I','A'];
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  rowspan="2"  style="text-align:center" >No</th>
                <th  rowspan="2"  style="text-align:center"> Nama </th>
                <th  rowspan ="2"> Jenis Kelamin</th>';
                    foreach($request->params['month']  as $m)
                    {
                        $tb.='<th colspan="3" style="text-align: center;"> '.gen_month($m).' </th>';
                    }
              '</tr>';
              $tb.='<tr>';
                foreach($request->params['month']  as $m)
                {
                    foreach($loop_month as $lm)
                    {
                        $tb.='<td  style="text-align: center;"> '.$lm.' </td>';
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
                foreach($request->params['month']  as $m)
                {
                    foreach($loop_month as $lm)
                    {
                         $ab= \App\Models\Absensi::
                        where('student_id',$value['student_id'])
                        ->where('step_study_id',stepStudyActive())
                        ->where('month',$m)
                        ->where('absensi_type',$lm)
                        ->first();
                            $dd  = (!empty($ab)) ? $ab->absensi_total : "";
                        $tb.='<td  style="text-align: center;">'.$dd.'</td>';
                    }
                }
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


}
