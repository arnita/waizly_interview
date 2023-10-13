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
use App\Imports\TeacherNote;
use App\Exceptions\BaseException;


class TeacherNoteController extends Controller
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
            $data_ex = \App\Models\TeacherNote::
            where('student_id',$request->student_id)
            ->where('step_study_id',stepStudyActive());
            $data_ex = $data_ex->first();


            if(!empty($data_ex))
            {
                $update = \App\Models\TeacherNote::find($data_ex->teacher_note_id);
                if($request->teacher_note_type == 'raport_pts')
                {
                    $update->raport_pts = $request->value;
                }
                else
                {
                    $update->raport_pas = $request->value;
                }
                $update->step_study_id = stepStudyActive();
                $update->teacher_note_update_time = date('Y-m-d H:i:s');
                $update->teacher_note_update_by  = \Auth::user()->id;
                $update->save();

                return response()->json(['status' => 'success']);             
                
            }
            else
            {
                $data['step_study_id'] = stepStudyActive();
                if($request->teacher_note_type == 'raport_pts')
                {
                    $data['raport_pts'] = $request->value;
                }
                else
                {
                    $data['raport_pas'] = $request->value;
                }
                $data['student_id'] = $request->student_id;
        
                $data['teacher_note_insert_time'] = date('Y-m-d H:i:s');
                $data['teacher_note_insert_by']  = \Auth::user()->id;
                
                $save = \App\Models\TeacherNote::create($data);
                return response()->json(['status' => 'success']);             
            }
        }
        else
        {
            return response()->json(['status' => 'failed']);            
        }
    }

    public function get_value_teacher_note(Request $request)
    {
        $data_teacher_note = \App\Models\TeacherNote::
        where('student_id',$request->student_id)
        ->where('step_study_id',stepStudyActive());

        $data_teacher_note = $data_teacher_note->first();



        $teacher_note = '';
        if( !empty($data_teacher_note) &&   $request->teacher_note_type == 'raport_pts')
        {
            $teacher_note = $data_teacher_note->raport_pts;
        }
        else if(!empty($data_teacher_note) &&   $request->teacher_note_type == 'raport_pas')
        {
            $teacher_note = $data_teacher_note->raport_pas;
        }

        return response()->json(['status' => 'success','data'=>$teacher_note]);         
    }






    public function teacher_note_upload(Request $request)
    {
        $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new TeacherNote, $request->file('file_excel')); 
        $tot_row_st =  count($dt[0]);
        $tot_teacher_note = count($dt[0][2]);

         \DB::beginTransaction();
        try {    
              
            for($i=3;$i<$tot_teacher_note;$i++)
            {
                for($z=4;$z<$tot_row_st;$z++)
                {

                    $student_id =  $dt[0][$z][1];
                    $pts = $dt[0][$z][3];
                    $pas = $dt[0][$z][4];
              
                    // $cek_exist = \App\Models\TeacherNote::where('student_id', $student_id)
                    // // ->where('raport_pts',$pts)
                    // // ->where('raport_pas',$pas)
                    // ->where('step_study_id',stepStudyActive())
                    // ->first();


                        // if(empty($cek_exist))
                        // {
                        //     if(!empty($pts) || !empty($pas))
                        //     {
                        //         $data_a =
                        //         [
                        //             'student_id' => $student_id,
                        //             'teacher_note_insert_time' => date('Y-m-d H:i:s'),
                        //             'teacher_note_insert_by' => \Auth::user()->user_id,
                        //             'raport_pts'=>$pts,
                        //             'raport_pas'=>$pas,
                        //             'step_study_id'=>stepStudyActive(),
                        //         ];
                                
                        //         \App\Models\TeacherNote::create($data_a);

                        //     }       

                        // }
                        // else
                        // {
                            \App\Models\TeacherNote::where('student_id', $student_id)
                            //  ->where('raport_pts',$pts)
                            // ->where('raport_pas',$pas)
                            ->where('step_study_id',stepStudyActive())
                            ->delete();

                             $data_a =
                                [
                                    'student_id' => $student_id,
                                    'teacher_note_insert_time' => date('Y-m-d H:i:s'),
                                    'teacher_note_insert_by' => \Auth::user()->user_id,
                                    'raport_pts'=>$pts,
                                    'raport_pas'=>$pas,
                                    'step_study_id'=>stepStudyActive(),
                                ];
                                
                                \App\Models\TeacherNote::create($data_a);
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


    public function send_param_teacher_note(Request $request)
    {
        $tb = '<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
            <thead>
               <tr>
                <th  style="text-align:center" >No</th>
                <th  style="text-align:center"> Nama </th>
                <th  style="text-align:center"> Raport PTS </th>
                <th  style="text-align:center"> Raport PAS </th>';
                   
              '</tr>';
            '</thead>';

        $tb .= '<tbody>';
        $val = '';
        foreach ($request->params['data_show'] as $key => $value) 
        {
            $tb .= '<tr>';
              $tb.='<td>'.($key+1).'</td>';
                    $tb.='<td>'.$value['student_name'].'</td>';
                     $ab= \App\Models\TeacherNote::
                    where('student_id',$value['student_id'])
                    ->where('step_study_id',stepStudyActive())
                    ->first();
                        $raport_pts  = (!empty($ab)) ? $ab->raport_pts : "";
                        $raport_pas  = (!empty($ab)) ? $ab->raport_pas : "";
                    $tb.='<td  style="text-align: center;">'.$raport_pts.'</td>';
                    $tb.='<td  style="text-align: center;">'.$raport_pas.'</td>';
            $tb.='</tr>';
        }

        $tb.="</tbody></table>";
        

        return ['data_all'=>$tb];
    }


}
