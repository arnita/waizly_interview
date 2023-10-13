<?php

/*
    
    CLASS FOR MANAGEMENT INPUT FISIK SISWA ,
    CREATED BY ARIEF MANGGALA PUTRA 
    24 NOV 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com

*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Excel;
use App\Imports\PhysicalStudent;
use Auth;
use App\Exceptions\BaseException;

class PhysicalStudentController extends Controller
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
            $data_ex = \App\Models\PhysicalStudent::where('student_id',$request->student_id)
            ->where('physical_type',$request->physical_type)
            ->where('physical_category',$request->physical_category)
            ->first();
            if(!empty($data_ex))
            {
                $data_['physical_value'] = $request->physical_value;
                $data_['physical_type'] = $request->physical_type;
                $data_['physical_category'] = $request->physical_category;
                $data_['physical_student_update_time'] = date('Y-m-d H:i:s');
                $data_['physical_student_update_by']  = \Auth::user()->id;
                $data_['step_study_id'] = stepStudyActive();
                \App\Models\PhysicalStudent::
                where('student_id',$request->student_id)
                ->where('physical_type',$request->physical_type)
                ->where('physical_category',$request->physical_category)
                ->update($data_);  
                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                $data['student_id'] = $request->student_id;
                $data['physical_value'] = $request->physical_value;
                $data['physical_type'] = $request->physical_type;
                $data['physical_category'] = $request->physical_category;
                $data['physical_student_insert_time'] = date('Y-m-d H:i:s');
                $data['physical_student_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\PhysicalStudent::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }

    }

    public function physical_student_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = Excel::toArray(new PhysicalStudent, $request->file('file_excel')); 
         $fisik =  \App\Models\Parlookup::where('category','Fisik')
        ->get();
        $kesehatan =  \App\Models\Parlookup::where('category','Kesehatan')
        ->get();
        $tot_row_st =  count($dt[0]);



         \DB::beginTransaction();
        try {    
            $total_value=0;
            foreach ($fisik as $key => $value) 
            {
                for($z=5;$z<$tot_row_st;$z++)
                {
                    $cek_exist = \App\Models\PhysicalStudent::
                    where('student_id',  $dt[0][$z][1])
                    ->where('physical_type',$value->name)
                    ->first();

                    if(empty($cek_exist))
                    {
                        if($dt[0][$z][$key+3] != '')
                        {
                            $data_f['student_id'] =  $dt[0][$z][1];
                            $data_f['physical_type'] =$value->name;
                            $data_f['physical_category'] = $value->category;
                            $data_f['physical_value'] = $dt[0][$z][$key+3];
                            $data_f['step_study_id'] = stepStudyActive();
                            $data_f['physical_student_insert_by']  = \Auth::user()->id;
                            $data['physical_student_insert_time'] = date('Y-m-d H:i:s');
                            \App\Models\PhysicalStudent::create($data_f);    
                        }    
                    }
                    else
                    {
                         \App\Models\PhysicalStudent::where('student_id',  $dt[0][$z][1])
                         ->where('physical_type',$value->name)
                        ->delete();

                        $data_f['student_id'] =  $dt[0][$z][1];
                        $data_f['physical_type'] =$value->name;
                        $data_f['physical_category'] = $value->category;
                        $data_f['physical_value'] = $dt[0][$z][$key+3];
                        $data_f['step_study_id'] = stepStudyActive();
                        $data_f['physical_student_update_by']  = \Auth::user()->id;
                        $data['physical_student_update_time'] = date('Y-m-d H:i:s');
                        \App\Models\PhysicalStudent::create($data_f);    
                    }
                    
                }
            }   

            foreach ($kesehatan as $k => $kes) 
            {
                for($r=5;$r<$tot_row_st;$r++)
                {
                    $cek_exist = \App\Models\PhysicalStudent::where('student_id',  $dt[0][$r][1])
                    ->where('physical_type',$kes->name)
                    ->first();

                    if(empty($cek_exist))
                    {
                        if($dt[0][$r][$k+5] != '')
                        {
                            $data_k['student_id'] =  $dt[0][$r][1];
                            $data_k['physical_type'] =$kes->name;
                            $data_k['physical_category'] = $kes->category;
                            $data_k['physical_value'] = $dt[0][$r][$k+5];
                            $data_k['step_study_id'] = stepStudyActive();
                            $data_k['physical_student_update_by']  = \Auth::user()->id;
                            \App\Models\PhysicalStudent::create($data_k);    
                        }    
                    }
                    else
                    {
                         \App\Models\PhysicalStudent::where('student_id',  $dt[0][$r][1])
                         ->where('physical_type',$kes->name)
                        ->delete();

                        $data_k['student_id'] =  $dt[0][$r][1];
                        $data_k['physical_type'] =$kes->name;
                        $data_k['physical_category'] = $kes->category;
                        $data_k['physical_value'] = $dt[0][$r][$k+5];
                        $data_k['step_study_id'] = stepStudyActive();
                        $data_k['physical_student_update_by']  = \Auth::user()->id;
                        \App\Models\PhysicalStudent::create($data_k);    
                    }
                    
                }
            }

           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1','asem');    
        }
    }


    public function send_param_physical_student(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  rowspan="2"  style="text-align:center" >No</th>
                <th  rowspan="2"  style="text-align:center"> Nama </th>
                <th style="text-align:center" colspan="'.count($request->params['fisik']).'" > Fisik </th>
                <th  style="text-align:center" colspan="'.count($request->params['kesehatan']).'"> Kesehatan </th>
                </tr>';

                $tb.='<tr>'; 
                    foreach($request->params['fisik'] as $fi)
                    {
                        $tb.='<td>'.$fi['name'].'</td>';
                    }

                    foreach($request->params['kesehatan'] as $ke)
                    {
                        $tb.='<td>' .$ke['name']. '</td>';
                    }
                $tb.='</tr>';


        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td>'.($key+1).'</td>
                    <td>'.$value['student_name'].'</td>';

                 foreach($request->params['fisik'] as $fs)
                 {
                    
                        $data_phy = \App\Models\PhysicalStudent::
                        where('student_id',$value['student_id'])
                        ->where('step_study_id',stepStudyActive())
                        ->where('physical_category','Fisik')
                        ->where('physical_type',$fs['name'])
                        ->first();
                         $physical_value  = (!empty($data_phy)) ? $data_phy->physical_value : "";
                    
                    $tb.='<td>'.$physical_value .'</td>';
                }

                foreach($request->params['kesehatan'] as $kes)
                {
                    
                    $data_kes = \App\Models\PhysicalStudent::
                    where('student_id',$value['student_id'])
                    ->where('step_study_id',stepStudyActive())
                    ->where('physical_category','Kesehatan')
                    ->where('physical_type',$kes['name'])
                    ->first();
                     $kes_value  = (!empty($data_kes)) ? $data_kes->physical_value : "";

                    $tb .='<td>'.$kes_value.'</td>';
                }
                    
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }

    
    public function get_value_physical_fisik(Request $request)
    {
        $data_phy = \App\Models\PhysicalStudent::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('physical_category',$request->physical_category)
        ->where('physical_type',$request->physical_type)
        ->first();


        $physical_value  = (!empty($data_phy)) ? $data_phy->physical_value : "";
        return response()->json(['status' => 'success','data'=>$physical_value]);     
    }

    public function get_value_physical_kes(Request $request)
    {
        $data_phy = \App\Models\PhysicalStudent::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive())
        ->where('physical_category',$request->physical_category)
        ->where('physical_type',$request->physical_type)
        ->first();


        $physical_value  = (!empty($data_phy)) ? $data_phy->physical_value : "";
        return response()->json(['status' => 'success','data'=>$physical_value]);     
    }

}
