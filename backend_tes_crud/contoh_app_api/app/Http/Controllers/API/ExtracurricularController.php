<?php

/*

    CLASS FOR MANAGEMENT INPUT EXTRACURRICULAR ,
    CREATED BY ARIEF MANGGALA PUTRA 
    24 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com

*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\Extracurricular;
use Auth;
use App\Exceptions\BaseException;


class ExtracurricularController extends Controller
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
        //

        if(!empty($request->student_id))
        {
            $data_ex = \App\Models\Extracurricular::
            where('student_id',$request->student_id)
            ->where('type',$request->type)
            ->where('step_study_id',stepStudyActive());
            $data_ex = $data_ex->first();


            if(!empty($data_ex))
            {

                $value_='';
                if($request->category == 'desc')
                {
                    $data_['desc'] = $request->value;
                }
                else
                {
                    $data_['value'] = $request->value;   
                }
                $data_['student_id'] = $request->student_id;
                $data_['type'] = $request->type;
                $data['step_study_id'] = stepStudyActive();
                $data_['extracurricular_update_time'] = date('Y-m-d H:i:s');
                $data_['extracurricular_update_by']  = \Auth::user()->id;
                \App\Models\Extracurricular::
                where('student_id',$request->student_id)
                ->where('type',$request->type)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                $data['type'] = $request->type;
                $data['student_id'] = $request->student_id;

                $get_val =  explode('-',$request->value);    
                $value = $get_val[0];
                $desc = $get_val[1];
                
                if($request->category == 'desc')
                {
                    $data['desc'] = $request->value;
                }
                else
                {
                    $data['value'] =$value;
                    $data['desc'] =$desc;
                }

                $data['extracurricular_insert_time'] = date('Y-m-d H:i:s');
                $data['extracurricular_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\Extracurricular::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }


    public function extracurricular_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new Extracurricular, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_extracurricular = count($dt[0][2]);

        $get_val =  explode('-', $dt[0][5][4]);    
         \DB::beginTransaction();
        try {    
              
            for($i=4;$i<$tot_extracurricular;$i++)
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    $type = $dt[0][3][$i];
                    $student_id =  $dt[0][$z][1];
                    if(!empty($dt[0][$z][$i]))
                    {
                        $get_val =  explode('-', $dt[0][$z][$i]);    
                        $value = $get_val[0];
                        $desc = $get_val[1];
                    }
                    else
                    {
                        $value = '';
                        $desc = '';
                    }
                    
               
                    $cek_exist = \App\Models\Extracurricular::where('student_id', $student_id)
                    ->where('type',$type)
                    ->where('step_study_id',stepStudyActive())
                    ->first();


                        if(empty($cek_exist))
                        {
                            if(!empty($value ))
                            {
                                $data_a =
                                [
                                    'student_id' => $student_id,
                                    'desc' => $desc,
                                    'extracurricular_insert_time' => date('Y-m-d H:i:s'),
                                    'extracurricular_insert_by' => \Auth::user()->user_id,
                                    'type'=>$type,
                                    'value'=>$value,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Extracurricular::create($data_a);

                            }       

                        }
                        else
                        {
                            \App\Models\Extracurricular::where('student_id', $student_id)
                             // ->where('value',$value)
                            // ->where('desc',$desc)
                            ->where('type',$type)
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                    'student_id' => $student_id,
                                    'desc' => $desc,
                                    'extracurricular_insert_time' => date('Y-m-d H:i:s'),
                                    'extracurricular_insert_by' => \Auth::user()->user_id,
                                    'type'=>$type,
                                    'value'=>$value,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\Extracurricular::create($data_a);
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


    public function send_param_extracurricular(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  rowspan="2"  style="text-align:center" >No</th>
                <th  rowspan="2"  style="text-align:center"> Nama </th>
                <th  rowspan ="2"> Jenis Kelamin</th>';
                    foreach($request->params['category']  as $m)
                    {
                        $tb.='<th colspan="2" style="text-align: center;"> '.$m['name'].' </th>';
                    }
              '</tr>';
              $tb.='<tr>';
                foreach($request->params['category']  as $m)
                {
                    $tb.='<td  style="text-align: center;"> Nilai</td>';
                    $tb.='<td  style="text-align: center;"> Keterangan</td>';
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
                foreach($request->params['category']  as $m)
                {
                    
                     $ab= \App\Models\Extracurricular::
                    where('student_id',$value['student_id'])
                    ->where('step_study_id',stepStudyActive())
                    ->where('type',$m['name'])
                    ->first();
                        $val  = (!empty($ab)) ? $ab->value : "";
                        $desc  = (!empty($ab)) ? $ab->desc : "";
                    $tb.='<td  style="text-align: center;">'.$val.'</td>';
                    $tb.='<td  style="text-align: center;">'.$desc.'</td>';
                }
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }

    public function load_extracurricular(Request $request)
    {
        $unit_year_id = yearActive();
        $result =  
        \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)
        ->orderBy('a.student_name','ASC')
        ->get();
        $stepStudyActive = stepStudyActive();

        $dd  = [];
         $data_eskul =  \App\Models\Parlookup::where('category','ekstrakurikuler')
        ->get();

        $es = \App\Models\Extracurricular::where('step_study_id',$stepStudyActive)->get();

        $data =  \App\Models\Parlookup::where('category','ekstrakurikuler')
        ->get();
        return response()->json(['eskul'=>$data,'result'=>$result,'val_eskul'=>$es]);
    }


     public function get_value_extracurricular(Request $request)
    {
        $data_ex = \App\Models\Extracurricular::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('type',$request->type)
        ->first();

        $extracurricular  = (!empty($data_ex)) ? $data_ex->value.'-'.$data_ex->desc : "";
        return response()->json(['status' => 'success','data'=>$extracurricular]);             
    }





}
