<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade as PDF;
use App\Exceptions\BaseException;


class RaportController extends Controller
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

    public function print_raport(Request $request)
    {
        //
        $q=$request->id;
        $unit_year_id = yearActive();
        $data['student'] = 
        \App\Models\Study_group_setting::with(['student','study_group'])
        ->whereHas('student',function($query) use ($q){
            $query->where('student_id',$q);
        })
        ->where('unit_year_id',$unit_year_id)->first();

        $data['unit'] = \App\Models\M_unit::where('unit_id',$data['student']->student->unit_id)->first();


        $data['class'] = \App\Models\M_class_grade::find($request->class_grade_id);
        $data['course_biasa'] = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','biasa')
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();


        $data['course_mulok'] = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','muatan_lokal')
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();

        $data['kelakuan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kelakuan')
        ->where('student_id',$q)->first();

        $data['kerajinan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerajinan')
        ->where('student_id',$q)->first();

        $data['kerapihan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerapihan')
        ->where('student_id',$q)->first();
    



        $data['prestation'] = \App\Models\Prestation::where('student_id',$request->id)->where('step_study_id',stepStudyActive())->get();
        $data['walas'] =   $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$data['student']->study_group_id)
        ->first();
        $data['semester'] =  \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',yearActive())->first();
        $data['year'] =  \App\Models\M_unit_year::where('unit_year_status','active')->first();

        $data['spiritual'] =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','spiritual')->get();
        $data['sosial'] =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','sosial')->get();

     
        $data['tahsin'] = \App\Models\Tahsin::where('student_id',$request->id)->get();
        $data['tahfizh'] = \App\Models\Tahfizh::where('student_id',$request->id)->get();
        $data['eskul'] = \App\Models\Extracurricular::where('student_id',$request->id)->get();
        $data['teacher_note'] = \App\Models\TeacherNote::where('student_id',$request->id)->first();
        $data['tinggi'] = 
          \DB::table('physical_student as a')
        ->where('step_study_id',stepStudyActive())
        ->where('student_id',$request->id)
        ->where('physical_type','Tinggi')
        ->where('physical_category','Fisik')
        ->get();    
        $data['berat'] = 
          \DB::table('physical_student as a')
        ->where('step_study_id',stepStudyActive())
        ->where('student_id',$request->id)
        ->where('physical_type','Berat')
        ->where('physical_category','Fisik')
        ->get();

        $data['absensi'] = 
            $q_vl = \DB::table('absensi')
            ->select(\DB::raw("count(absensi_total) as tot,absensi_type"))
            ->where('student_id',$request->id)
            ->groupBy('absensi_type')
            ->get();



        

        $data['kesehatan'] = \App\Models\PhysicalStudent::where('student_id',$request->id)->where('physical_category','Kesehatan')->where('step_study_id',stepStudyActive())->get();

        $data['study_group_id'] = $request->study_group_id;

        $path = public_path() . '/raport/raport_'.$data['student']->student->student_name.'_'.date('Ymd').'.pdf';


        $pdf = PDF::
        setOptions([
            'logOutputFile' => storage_path('tmp')."log.htm",
            'tempDir' => storage_path('tmp'),
            'isRemoteEnabled'=> TRUE,
            'isHtml5ParserEnabled'=> TRUE
        ])->
        loadView('pdf.print_raport', $data);
        $pdf->getDomPDF()->setHttpContext(
            stream_context_create([
                'ssl' => [
                    'allow_self_signed'=> TRUE,
                    'verify_peer' => FALSE,
                    'verify_peer_name' => FALSE,
                ]
            ])
        );
        $pdf->save($path);
    
        return $pdf->download('RAPORT_'.$data['student']->student->student_name.'.pdf');
        
    }


    public function print_raport_pts(Request $request)
    {
        //
        $q=$request->id;
        $unit_year_id = yearActive();
        $data['student'] = 
        \App\Models\Study_group_setting::with(['student','study_group'])
        ->whereHas('student',function($query) use ($q){
            $query->where('student_id',$q);
        })
        ->where('unit_year_id',$unit_year_id)->first();

        $data['unit'] = \App\Models\M_unit::where('unit_id',$data['student']->student->unit_id)->first();



        $data['course_biasa'] = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','biasa')
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();


        $data['course_mulok'] = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','muatan_lokal')
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->whereNotIn('c.course_name',['Tahsin'])
        ->get();


        $data['kelakuan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kelakuan')
        ->where('student_id',$q)->first();

        $data['kerajinan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerajinan')
        ->where('student_id',$q)->first();

        $data['kerapihan']= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerapihan')
        ->where('student_id',$q)->first();
    




        $data['walas'] =   $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$data['student']->study_group_id)
        ->first();
        $data['semester'] =  \App\Models\M_step_study::where('step_study_status','active')->first();
        $data['year'] =  \App\Models\M_unit_year::where('unit_year_status','active')->first();

        $data['spiritual'] =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','spiritual')->get();
        $data['sosial'] =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','sosial')->get();

     

        $data['tahsin'] = \App\Models\Tahsin::where('student_id',$request->id)->get();
        $data['tahfizh'] = \App\Models\Tahfizh::where('student_id',$request->id)->get();
        $data['eskul'] = \App\Models\Extracurricular::where('student_id',$request->id)->get();
        $data['teacher_note'] = \App\Models\TeacherNote::where('student_id',$request->id)->first();
        $data['tinggi'] = 
          \DB::table('physical_student as a')
        ->join('m_step_study as b','b.step_study_id','a.step_study_id')
        ->join('m_unit_year as c','c.unit_year_id','b.unit_year_id')
        ->where('unit_year_status','active')
        ->where('student_id',$request->id)
        ->where('physical_type','Tinggi')
        ->where('physical_category','Fisik')
        ->get();    
        $data['berat'] = 
          \DB::table('physical_student as a')
        ->join('m_step_study as b','b.step_study_id','a.step_study_id')
        ->join('m_unit_year as c','c.unit_year_id','b.unit_year_id')
        ->where('unit_year_status','active')
        ->where('student_id',$request->id)
        ->where('physical_type','Berat')
        ->where('physical_category','Fisik')
        ->get();

        $data['absensi'] = 
            $q_vl = \DB::table('absensi')
            ->select(\DB::raw("count(absensi_total) as tot,absensi_type"))
            ->where('student_id',$request->id)
            ->groupBy('absensi_type')
            ->get();



        $data['kesehatan'] = \App\Models\PhysicalStudent::where('student_id',$request->id)->where('physical_category','Kesehatan')->get();
        $data['study_group_id'] = $request->study_group_id;

        $path = public_path() . '/raport/raport_'.$data['student']->student->student_name.'_'.date('Ymd').'.pdf';

        $pdf = PDF::
        setOptions([
            'logOutputFile' => storage_path('tmp')."log.htm",
            'tempDir' => storage_path('tmp'),
            'isRemoteEnabled'=> TRUE,
            'isHtml5ParserEnabled'=> TRUE
        ])->
        loadView('pdf.print_raport_pts', $data);
        $pdf->getDomPDF()->setHttpContext(
            stream_context_create([
                'ssl' => [
                    'allow_self_signed'=> TRUE,
                    'verify_peer' => FALSE,
                    'verify_peer_name' => FALSE,
                ]
            ])
        );
        $pdf->save($path);
        return $pdf->download($path);
    }



   /* API get data list question n total kd uts */
    public function insert_raport(Request $request)
    {
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();


        $course_master = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('kkm.step_study_id',$stepStudyActive)
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();





        $data_siswa =  \App\Models\Study_group_setting::with(['student','study_group'])
        ->where('study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)->get();
       

        // this first  looping raport uas
        foreach ($course_master as $key => $val_mst) 
        {
            # code...
            $cek_tematic = 
            \DB::table('structure_tematic as st')
            ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
            ->join('m_kd as k','std.kd_id','k.kd_id')
            ->join('course_setting as cd','cd.course_setting_id','k.course_setting_id')
            ->join('m_course as c','cd.course_id','c.course_id')
            ->where('cd.course_id',$val_mst->course_id)
            ->where('cd.unit_year_id',$unit_year_id)
            ->first();

                

            // CEK apakah dia tematik apa bukan


            /* dapetin keterangan untuk input analisis  */
            $nilai_peng_max = 'CUKUP BAIK';
            $nilai_peng_min = 'CUKUP BAIK';

            /* dapetin keterangan untuk input analisis  */
            $nilai_ket_max = 'CUKUP BAIK';
            $nilai_ket_min = 'CUKUP BAIK';

            $desc_min_ket = 0;
            $desc_max_ket = 0;


        if(!empty($cek_tematic))
        {        
            // ini tematik
             $summary =[] ;
            $summary_skill=[];
            $skill=[];
            $nilai_peng_max = '';
            $desc_max_peng = '';
            $nilai_peng_min = '';
            $desc_min_peng = '';
            
            

            $course_setting = 
            \DB::table('m_kd as mk')
            ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
            ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
             ->join('m_course as c','c.course_id','cd.course_id')
            ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
            ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
            ->where('ms.study_group_id',$request->study_group_id)
            ->where('c.course_id',$val_mst->course_id)
            ->where('cd.unit_year_id',$unit_year_id)
            ->get();


            foreach($data_siswa as $row)
            {

                foreach($course_setting as $ct)
                {
                    if($ct->kd_type == 'Pengetahuan')
                    {
                        $val_h = 
                        \DB::table('daily_exercise as de')
                        ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id,kd.kd_detail_id"))
                        ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                        ->join('m_kd as k','k.kd_id','kd.kd_id')
                        ->groupBy('student_id','k.kd_id','kd.kd_detail_id')
                        ->where('student_id',$row->student->student_id)
                        ->where('k.kd_id',$ct->kd_id)
                        ->where('k.kd_type','Pengetahuan')
                        ->where('de.step_study_id',stepStudyActive())
                        ->first();

                        $tot_h = (!empty($val_h)) ? $val_h->tot : 0 ;


                        $uts = \App\Models\Summary_tematic::where('type','uts')
                        ->where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_uts = (!empty($uts)) ? $uts->total : 0 ;

                        $uas = \App\Models\Summary_tematic::where('type','uas')
                        ->where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_uas = (!empty($uas)) ? $uas->total : 0 ;
                        

                        $daily = \App\Models\Summary_tematic::
                        where('type','daily')
                        ->where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_daily = (!empty($daily)) ? $daily->total : 0 ;
                        
                        if($ct->class_grade_name == "GRADE 6")
                         {
                            if($val_uas > 0)
                            {
                                if($tot_h > 0)   
                                {
                                    $tot_p = ($val_daily + $val_uas)/2 ;   
                                }
                                else
                                { 
                                    $tot_p = $val_daily  ;   
                                }
                            }
                            else
                            {
                                if($tot_h > 0)   
                                {
                                    $tot_p = ($val_uas + $val_daily + $tot_h)/3 ;
                                    
                                }
                                else
                                {
                                    $tot_p = ($val_uas + $val_daily)/2 ;

                                }
                            }       
                         }
                         
                         else
                         {
                            if(empty($val_uas)){
                                $tot_p = ($val_uts + $val_daily + $tot_h)/3 ;   
                            }else{
                                $tot_p = ($val_uts + $val_uas + $val_daily + $tot_h)/4 ;
                            }
                         }
                        

                        $summary[$ct->kd_code] = $tot_p;
                        $kd_summary[round($tot_p)] = $ct->kd_name;
                        $sum_max = round(max($summary));    
                        $type_k = $ct->kd_type;


                        $sum_v1 = round(max($summary));
                        $desc_max_peng = '';
                        foreach ($kd_summary as $key => $value) 
                        {
                            if($sum_v1 == $key)
                            {
                                $desc_max_peng = $value;    
                            }
                        }

                        /* dapetin nilai min */
                        $sum_v2 = round(min($summary));
                        $desc_min_peng = '';
                        foreach ($kd_summary as $key => $value) 
                        {
                            if($sum_v2 == $key)
                            {
                                $desc_min_peng = $value;    
                            }
                        }

                        /* dapetin nilai kkm max dan min  */
                        $max_peng = get_kkm ( $val_mst->course_id,round(max($summary)),$request->class_grade_id );
                        $min_peng = get_kkm (  $val_mst->course_id,round(min($summary)),$request->class_grade_id );


                        /* dapetin keterangan untuk input analisis  */
                        $nilai_peng_max = 'CUKUP BAIK';
                        $nilai_peng_min = 'CUKUP BAIK';
                        if($max_peng  == 'A')
                        {
                            $nilai_peng_max = 'SANGAT BAIK';
                        }
                        else if($max_peng == 'B')
                        {
                            $nilai_peng_max = 'BAIK';
                        }
                        else if($max_peng == 'C' )
                        {
                            $nilai_peng_max = 'CUKUP BAIK';
                        }

                        if($min_peng  == 'A')
                        {
                            $nilai_peng_min = 'SANGAT BAIK';
                        }
                        else if($min_peng == 'B')
                        {
                            $nilai_peng_min = 'BAIK';
                        }
                        else if($min_peng == 'C' )
                        {
                            $nilai_peng_min = 'CUKUP BAIK';
                        }

                    }
                    else
                    {
                        $skill = \App\Models\Summary_skill::
                        where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 

                        $count = \App\Models\Summary_skill::
                        where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->get(); 
                        $c_count = (!empty($count)) ? count($count) : 1;
                        $val_skill = (!empty($skill)) ? $skill->total_skill : 0 ;
                        
                     
                        $val_daily = (!empty($skill)) ? $skill->total_skill : 0 ;
                        $tot_p = ($val_skill) ;
                        $summary_skill[$ct->kd_code] = $tot_p;
                        $kd_summary_skill[round($tot_p)] = $ct->kd_name;
                        $type_k = $ct->kd_type;
                        /* Unuk yang tipe Keterampilan */
                        /* dapetin nilai max  */
                        $sum_v3 = round(max($summary_skill));
                        $desc_max_ket = 0;
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_v3 == $key)
                            {
                                $desc_max_ket = $value;    
                            }
                        }

                        /* dapetin nilai min */
                        $sum_v4 = round(min($summary_skill));
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_v4 == $key)
                            {
                                $desc_min_ket = $value;    
                            }
                        }

                        // dump($summary_skill);
                        /* dapetin nilai kkm max dan min  */
                        $max_ket = get_kkm ( $val_mst->course_id,round(max($summary_skill)),$request->class_grade_id );
                        $min_ket = get_kkm (  $val_mst->course_id,round(min($summary_skill)),$request->class_grade_id );


                        /* dapetin keterangan untuk input analisis  */
                        $nilai_ket_max = 'CUKUP BAIK';
                        $nilai_ket_min = 'CUKUP BAIK';
                        if($max_ket  == 'A')
                        {
                            $nilai_ket_max = 'SANGAT BAIK';
                        }
                        else if($max_ket == 'B')
                        {
                            $nilai_ket_max = 'BAIK';
                        }
                        else if($max_ket == 'C' )
                        {
                            $nilai_ket_max = 'CUKUP BAIK';
                        }

                        if($min_ket  == 'A')
                        {
                            $nilai_ket_min = 'SANGAT BAIK';
                        }
                        else if($min_ket == 'B')
                        {
                            $nilai_ket_min = 'BAIK';
                        }
                        else if($min_ket == 'C' )
                        {
                            $nilai_ket_min = 'CUKUP BAIK';
                        }
                    }   

                }
                    /**/    

                    /*cek first in the table raport*/
                     $exist_tema = 
                     \App\Models\Raport::where('course_id',$val_mst->course_id)
                     ->where('student_id',$row->student->student_id)
                     ->where('step_study_id',stepStudyActive())
                     ->first();
                     $tot_sum_skill = 0;
                     $tot_pembagi_skill = 0;
                     foreach ($summary_skill as $key => $sm) {
                         # code..
                        if( !empty($sm != 0))
                        {
                            $tot_sum_skill +=$sm;
                            $tot_pembagi_skill++;
                        }
                     }

                     $tot_sum = 0;
                     $tot_pembagi = 0;
                     foreach ($summary as $key => $s) {
                         # code..
                        if(!empty($s))
                        {
                            $tot_sum +=$s;
                            $tot_pembagi++;
                        }
                     }
                     
                     if(empty($exist_tema))
                     {
                                /* insert TO Raport */
                            $insert_tema['course_id'] = $val_mst->course_id;
                            $insert_tema['student_id'] = $row->student->student_id;
                            $insert_tema['step_study_id'] =  stepStudyActive();

                            if(array_sum($summary) == 0 )
                            {
                                $insert_tema['total_pengetahuan'] = 0;  
                            }
                            else
                            {
                                $insert_tema['total_pengetahuan'] = round(@( $tot_sum / $tot_pembagi ));
                            }
                            if(array_sum($summary_skill) == 0 )
                            {
                                $insert_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                // $insert_tema['total_keterampilan'] = round (round(array_sum($summary_skill)) / count($summary_skill) );
                                $insert_tema['total_keterampilan'] =  round(@( $tot_sum_skill / $tot_pembagi_skill ));
                            }   
                            
                            $insert_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$insert_tema['total_pengetahuan'],$request->class_grade_id);
                            $insert_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$insert_tema['total_keterampilan'],$request->class_grade_id);

                            $insert_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max.' dalam '.$desc_max_peng. '.' . $nilai_peng_min. ' dalam '.$desc_min_peng ;

                            $insert_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max.' dalam '.$desc_max_ket. '.' . $nilai_ket_min. ' dalam '.$desc_min_ket ;

                            $insert_tema['raport_insert_time'] = date('Y-m-d H:i:s');
                            $insert_tema['raport_insert_by'] = \Auth::user()->id;
                            
                            \App\Models\Raport::create($insert_tema);    
                     }
                     else
                     {
                                /* UPDATE TO Raport */
                            $update_['course_id'] = $val_mst->course_id;
                            $update_['student_id'] = $row->student->student_id;
                            $update_['step_study_id'] =  stepStudyActive();

                            if(array_sum($summary) == 0 )
                            {
                                $update_['total_pengetahuan'] = 0;  
                            }
                            else
                            {
                                $update_['total_pengetahuan'] = round(@( $tot_sum / $tot_pembagi ));
                            }
                            if(array_sum($summary_skill) == 0 )
                            {
                                $update_['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $update_['total_keterampilan'] =  round(@( $tot_sum_skill / $tot_pembagi_skill ));
                            }   
                            $update_['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$update_['total_pengetahuan'],$request->class_grade_id);
                            $update_['predikat_keterampilan'] = get_kkm($val_mst->course_id,$update_['total_keterampilan'],$request->class_grade_id);

                            $update_['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max.' dalam '.$desc_max_peng. '.' . $nilai_peng_min. ' dalam '.$desc_min_peng ;

                            $update_['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max.' dalam '.$desc_max_ket. '.' . $nilai_ket_min. ' dalam '.$desc_min_ket ;

                            $update_['raport_insert_time'] = date('Y-m-d H:i:s');
                            $update_['raport_insert_by'] = \Auth::user()->id;
                            // dump($update_);
                    
                            \App\Models\Raport::where('course_id',$val_mst->course_id)
                            ->where('student_id',$row->student->student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->update($update_);    
                     }
            }
        }
        else
        {
            $summary_non_tema =[] ;
            $summary_skill_non_tema=[];
            $skill_non_tema=[];
            $nilai_peng_max_non_tema = '';
            $desc_max_peng_non_tema = '';
            $nilai_peng_min_non_tema = '';
            $desc_min_peng_non_tema = '';
              /* dapetin keterangan untuk input analisis  */
            $nilai_peng_max_non_tema = 'CUKUP BAIK';
            $nilai_peng_min_non_tema = 'CUKUP BAIK';

            /* dapetin keterangan untuk input analisis  */
            $nilai_ket_max_non_tema = 'CUKUP BAIK';
            $nilai_ket_min_non_tema = 'CUKUP BAIK';

            $desc_min_ket_non_tema = 0;
            $desc_max_ket_non_tema = 0;
            
            // ini bukan tematik
                $course_setting = 
                \DB::table('m_kd as mk')
                ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
                ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
                 ->join('m_course as c','c.course_id','cd.course_id')
                ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
                ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
                ->where('ms.study_group_id',$request->study_group_id)
                ->where('c.course_id',$val_mst->course_id)
                ->where('cd.unit_year_id',$unit_year_id)
                ->get();


                foreach($data_siswa as $row)
                {

                    foreach($course_setting as $ct)
                    {
                        if($ct->kd_type == 'Pengetahuan')
                        {
                            $val_non_tema = 
                            \DB::table('daily_exercise as de')
                            ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id"))
                            ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                            ->join('m_kd as k','k.kd_id','kd.kd_id')
                            ->groupBy('student_id','k.kd_id')
                            ->where('student_id',$row->student->student_id)
                            ->where('k.kd_id',$ct->kd_id)
                            ->where('k.kd_type','Pengetahuan')
                            ->where('de.step_study_id',stepStudyActive())
                            ->first();



                            $uas_non_tema = \App\Models\Summary_kd::where('type','uas')
                            ->where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 
                            $val_uas_non_tema = (!empty($uas_non_tema)) ? $uas_non_tema->total : 0 ;
                            
                            
                            $daily_non_tema = \App\Models\Summary_kd::
                            where('type','daily')
                            ->where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 

                            $val_daily_non_tema = (!empty($daily_non_tema)) ? $daily_non_tema->total : 0 ;


                            $get_h_non_tema = (!empty($val_non_tema->tot)) ? $val_non_tema->tot : 0 ;
                            $tot_p_non_tema = ($val_uas_non_tema + $val_daily_non_tema + $get_h_non_tema)/3 ;




                            $summary_non_tema[$ct->kd_code] = $tot_p_non_tema;
                            $kd_summary[round($tot_p_non_tema)] = $ct->kd_name;
                            $sum_max = round(max($summary_non_tema));    
                            $type_k_non_tema = $ct->kd_type;

                                 /* Unuk yang tipe Pengetahuan */
                            /* dapetin nilai max  */
                            $sum_v1_non_tema = round(max($summary_non_tema));
                            $desc_max_peng_non_tema = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v1_non_tema == $key)
                                {
                                    $desc_max_peng_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai min */
                            $sum_v2_non_tema = round(min($summary_non_tema));
                            $desc_min_peng_non_tema = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v2_non_tema == $key)
                                {
                                    $desc_min_peng_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai kkm max dan min  */
                            $max_peng_non_tema = get_kkm ( $val_mst->course_id,round(max($summary_non_tema)),$request->class_grade_id );
                            $min_peng_non_tema = get_kkm (  $val_mst->course_id,round(min($summary_non_tema)),$request->class_grade_id );


                            /* dapetin keterangan untuk input analisis  */
                            $nilai_peng_max_non_tema = 'CUKUP BAIK';
                            $nilai_peng_min_non_tema = 'CUKUP BAIK';
                            if($max_peng_non_tema  == 'A')
                            {
                                $nilai_peng_max_non_tema = 'SANGAT BAIK';
                            }
                            else if($max_peng_non_tema == 'B')
                            {
                                $nilai_peng_max_non_tema = 'BAIK';
                            }
                            else if($max_peng_non_tema == 'C' )
                            {
                                $nilai_peng_max_non_tema = 'CUKUP BAIK';
                            }

                            if($min_peng_non_tema  == 'A')
                            {
                                $nilai_peng_min_non_tema = 'SANGAT BAIK';
                            }
                            else if($min_peng_non_tema == 'B')
                            {
                                $nilai_peng_min_non_tema = 'BAIK';
                            }
                            else if($min_peng_non_tema == 'C' )
                            {
                                $nilai_peng_min_non_tema = 'CUKUP BAIK';
                            }

                        }
                        else
                        {
                            $skill_non_tema = \App\Models\Summary_skill::
                            where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 

                            $count_non_tema = \App\Models\Summary_skill::
                            where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->get(); 


                            $c_count = (!empty($count_non_tema)) ? count($count_non_tema) : 1;
                            $val_skill_non_tema = (!empty($skill_non_tema)) ? $skill_non_tema->total_skill : 0 ;
                        
                            $val_daily_non_tema = (!empty($skill_non_tema)) ? $skill_non_tema->total_skill : 0 ;
                            $tot_p_non_tema = ($val_skill_non_tema) ;

                            $summary_skill_non_tema[$ct->kd_code] = $tot_p_non_tema;
                            $kd_summary_skill_non_tema[round($tot_p_non_tema)] = $ct->kd_name;
                            $type_k_non_tema = $ct->kd_type;
                                  /* Unuk yang tipe Keterampilan */
                            /* dapetin nilai max  */
                            $sum_v3_non_tema = round(max($summary_skill_non_tema));
                            $desc_max_ket_non_tema = 0;
                            foreach ($kd_summary_skill_non_tema as $key => $value) 
                            {
                                if($sum_v3_non_tema == $key)
                                {
                                    $desc_max_ket_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai min */
                            $sum_v4_non_tema = round(min($summary_skill_non_tema));
                            $desc_min_ket_non_tema = '';
                            foreach ($kd_summary_skill_non_tema as $key => $value) 
                            {
                                if($sum_v4_non_tema == $key)
                                {
                                    $desc_min_ket_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai kkm max dan min  */
                            $max_ket_non_tema = get_kkm ( $val_mst->course_id,round(max($summary_skill_non_tema)),$request->class_grade_id );
                            $min_ket_non_tema = get_kkm (  $val_mst->course_id,round(min($summary_skill_non_tema)),$request->class_grade_id );



                            /* dapetin keterangan untuk input analisis  */
                            $nilai_ket_max_non_tema = 'CUKUP BAIK';
                            $nilai_ket_min_non_tema = 'CUKUP BAIK';
                            if($max_ket_non_tema  == 'A')
                            {
                                $nilai_ket_max_non_tema = 'SANGAT BAIK';
                            }
                            else if($max_ket_non_tema == 'B')
                            {
                                $nilai_ket_max_non_tema = 'BAIK';
                            }
                            else if($max_ket_non_tema == 'C' )
                            {
                                $nilai_ket_max_non_tema = 'CUKUP BAIK';
                            }

                            if($min_ket_non_tema  == 'A')
                            {
                                $nilai_ket_min_non_tema = 'SANGAT BAIK';
                            }
                            else if($min_ket_non_tema == 'B')
                            {
                                $nilai_ket_min_non_tema = 'BAIK';
                            }
                            else if($min_ket_non_tema == 'C' )
                            {
                                $nilai_ket_min_non_tema = 'CUKUP BAIK';
                            }

                            /**/     
                        }   

                    }


                    /*cek first in the table raport*/
                     $cek_non_tema = \App\Models\Raport::where('course_id',$val_mst->course_id)
                     ->where('student_id',$row->student->student_id)
                     ->where('step_study_id',stepStudyActive())
                     ->first();

                     $tot_sum_skill_non_tema = 0;
                     $tot_pembagi_skill_non_tema = 0;
                     foreach ($summary_skill_non_tema as $key => $sm_non_tema) {
                         # code..
                        if( !empty($sm_non_tema != 0))
                        {
                            $tot_sum_skill_non_tema +=$sm_non_tema;
                            $tot_pembagi_skill_non_tema++;
                        }
                     }

                     $tot_sum_non_tema = 0;
                     $tot_pembagi_non_tema = 0;
                     foreach ($summary_non_tema as $key => $s_non_tema) {
                         # code..
                        if(!empty($s_non_tema))
                        {
                            $tot_sum_non_tema +=$s_non_tema;
                            $tot_pembagi_non_tema++;
                        }
                     }

                     if(empty($cek_non_tema))
                     {
                             /* insert tematik TO Raport */
                            $insert_non_tema['course_id'] = $val_mst->course_id;
                            $insert_non_tema['student_id'] = $row->student->student_id;
                            $insert_non_tema['step_study_id'] =  stepStudyActive();
                            // if(!empty($summary))
                            if(array_sum($summary_non_tema) == 0 )
                            {
                                $insert_non_tema['total_pengetahuan'] = 0;
                            }
                            else
                            {
                                $insert_non_tema['total_pengetahuan'] = round(@($tot_sum_non_tema/$tot_pembagi_non_tema));
                            }
                            
                            if(array_sum($summary_skill_non_tema) == 0 )
                            {
                                $insert_non_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $insert_non_tema['total_keterampilan'] = round (@($tot_sum_skill_non_tema/$tot_pembagi_skill_non_tema));
                            }

                            
                            $insert_non_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$insert_non_tema['total_keterampilan'],$request->class_grade_id);
                            $insert_non_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max_non_tema.' dalam '.$desc_max_peng_non_tema. '.' . $nilai_peng_min_non_tema. ' dalam '.$desc_min_peng_non_tema ;
                            $insert_non_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$insert_non_tema['total_pengetahuan'],$request->class_grade_id);
                            $insert_non_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max_non_tema.' dalam '.$desc_max_ket_non_tema. '.' . $nilai_ket_min_non_tema. ' dalam '.$desc_min_ket_non_tema ;

                            $insert_non_tema['raport_insert_time'] = date('Y-m-d H:i:s');
                            $insert_non_tema['raport_insert_by'] = \Auth::user()->id;

                            \App\Models\Raport::create($insert_non_tema);    
                     }
                     else
                     {
                        /* update non tematik TO Raport */
                            $update_non_tema['course_id'] = $val_mst->course_id;
                            $update_non_tema['student_id'] = $row->student->student_id;
                            $update_non_tema['step_study_id'] =  stepStudyActive();
                            // if(!empty($summary))
                            if(array_sum($summary_non_tema) == 0 )
                            {
                                $update_non_tema['total_pengetahuan'] = 0;
                            }
                            else
                            {
                                $update_non_tema['total_pengetahuan'] = round(@($tot_sum_non_tema/$tot_pembagi_non_tema));
                            }
                            
                            if(array_sum($summary_skill_non_tema) == 0 )
                            {
                                $update_non_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $update_non_tema['total_keterampilan'] = round (@($tot_sum_skill_non_tema/$tot_pembagi_skill_non_tema));
                            }

                            
                            $update_non_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$update_non_tema['total_keterampilan'],$request->class_grade_id);
                            $update_non_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max_non_tema.' dalam '.$desc_max_peng_non_tema. '.' . $nilai_peng_min_non_tema. ' dalam '.$desc_min_peng_non_tema ;
                            $update_non_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$update_non_tema['total_pengetahuan'],$request->class_grade_id);
                            $update_non_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max_non_tema.' dalam '.$desc_max_ket_non_tema. '.' . $nilai_ket_min_non_tema. ' dalam '.$desc_min_ket_non_tema ;

                            $update_non_tema['raport_insert_time'] = date('Y-m-d H:i:s');
                            $update_non_tema['raport_insert_by'] = \Auth::user()->id;

                            \App\Models\Raport::where('course_id',$val_mst->course_id)
                            ->where('student_id',$row->student->student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->update($update_non_tema);    
                     }

                   
                }
            } // this ended if else tematik
        }  
        // this ended for looping raport uas
        //ended for first loopting course 
    }

    public function insert_raport_pts(Request $request)
    {

        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();




        \DB::beginTransaction();
        try {    

            $course_master = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        // ->where('kkm.step_study_id',$stepStudyActive)
        ->where('kkm.class_grade_id',$request->class_grade_id)        
        ->get();






        $data_siswa =  \App\Models\Study_group_setting::with(['student','study_group'])
        ->where('study_group_id',$request->study_group_id)
        ->where('unit_year_id',$unit_year_id)->get();
       

        // this first  looping raport uts
        foreach ($course_master as $key => $val_mst) 
        {
            # code...
            $cek_tematic = 
            \DB::table('structure_tematic as st')
            ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
            ->join('m_kd as k','std.kd_id','k.kd_id')
            ->join('course_setting as cd','cd.course_setting_id','k.course_setting_id')
            ->join('m_course as c','cd.course_id','c.course_id')
            // ->where('cd.study_group_id',$request->study_group_id)
            ->where('cd.course_id',$val_mst->course_id)
            ->where('cd.unit_year_id',$unit_year_id)
            ->first();

                

            // CEK apakah dia tematik apa bukan


            /* dapetin keterangan untuk input analisis  */
            $nilai_peng_max = 'CUKUP BAIK';
            $nilai_peng_min = 'CUKUP BAIK';

            /* dapetin keterangan untuk input analisis  */
            $nilai_ket_max = 'CUKUP BAIK';
            $nilai_ket_min = 'CUKUP BAIK';

            $desc_min_ket = 0;
            $desc_max_ket = 0;


        if(!empty($cek_tematic))
        {        

            $summary =[] ;
            $summary_skill=[];
            $skill=[];
            $nilai_peng_max = '';
            $desc_max_peng = '';
            $nilai_peng_min = '';
            $desc_min_peng = '';
            

            $course_setting = 
            \DB::table('m_kd as mk')
            ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
            ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
             ->join('m_course as c','c.course_id','cd.course_id')
            ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
            ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
    
            ->where('ms.study_group_id',$request->study_group_id)
            ->where('c.course_id',$val_mst->course_id)
            ->where('cd.unit_year_id',$unit_year_id)
            // ->where('md.step_study_id',$stepStudyActive)
            ->get();


            foreach($data_siswa as $row)
            {

                foreach($course_setting as $ct)
                {
                    if($ct->kd_type == 'Pengetahuan')
                    {
                
                        $val_h = 
                        \DB::table('daily_exercise as de')
                        ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id,kd.kd_detail_id"))
                        ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                        ->join('m_kd as k','k.kd_id','kd.kd_id')
                        ->groupBy('student_id','k.kd_id','kd.kd_detail_id')
                        ->where('student_id',$row->student->student_id)
                        ->where('k.kd_id',$ct->kd_id)
                        ->where('k.kd_type','Pengetahuan')
                
                        ->where('de.step_study_id',stepStudyActive())
                        ->first();



                        $tot_h = (!empty($val_h)) ? $val_h->tot : 0 ;

                        $uts = \App\Models\Summary_tematic::where('type','uts')
                        ->where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_uts = (!empty($uts)) ? $uts->total : 0 ;
                        

                        $daily = \App\Models\Summary_tematic::
                        where('type','daily')
                        ->where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_daily = (!empty($daily)) ? $daily->total : 0 ;
                      
                        $tot_p = ($val_uts + $val_daily + $tot_h)/3 ;
                        
                        $summary[$ct->kd_code] = $tot_p;
                        $kd_summary[round($tot_p)] = $ct->kd_name;
                        $sum_max = round(max($summary));    
                        $type_k = $ct->kd_type;


                        $sum_v1 = round(max($summary));
                        $desc_max_peng = '';
                        foreach ($kd_summary as $key => $value) 
                        {
                            if($sum_v1 == $key)
                            {
                                $desc_max_peng = $value;    
                            }
                        }

                        /* dapetin nilai min */
                        $sum_v2 = round(min($summary));
                        $desc_min_peng = '';
                        foreach ($kd_summary as $key => $value) 
                        {
                            if($sum_v2 == $key)
                            {
                                $desc_min_peng = $value;    
                            }
                        }

                        /* dapetin nilai kkm max dan min  */
                        $max_peng = get_kkm ( $val_mst->course_id,round(max($summary)),$request->class_grade_id );
                        $min_peng = get_kkm (  $val_mst->course_id,round(min($summary)),$request->class_grade_id );


                        /* dapetin keterangan untuk input analisis  */
                        $nilai_peng_max = 'CUKUP BAIK';
                        $nilai_peng_min = 'CUKUP BAIK';
                        if($max_peng  == 'A')
                        {
                            $nilai_peng_max = 'SANGAT BAIK';
                        }
                        else if($max_peng == 'B')
                        {
                            $nilai_peng_max = 'BAIK';
                        }
                        else if($max_peng == 'C' )
                        {
                            $nilai_peng_max = 'CUKUP BAIK';
                        }

                        if($min_peng  == 'A')
                        {
                            $nilai_peng_min = 'SANGAT BAIK';
                        }
                        else if($min_peng == 'B')
                        {
                            $nilai_peng_min = 'BAIK';
                        }
                        else if($min_peng == 'C' )
                        {
                            $nilai_peng_min = 'CUKUP BAIK';
                        }

                    }
                    else
                    {
                        $skill = \App\Models\Summary_skill::
                        where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 

                        $count = \App\Models\Summary_skill::
                        where('student_id',$row->student->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->get(); 
                        $c_count = (!empty($count)) ? count($count) : 1;
                        $val_skill = (!empty($skill)) ? $skill->total_skill : 0 ;
                        
                     
                        $val_daily = (!empty($skill)) ? $skill->total_skill : 0 ;
                        $tot_p = ($val_skill) ;
                        $summary_skill[$ct->kd_code] = $tot_p;
                        $kd_summary_skill[round($tot_p)] = $ct->kd_name;
                        $type_k = $ct->kd_type;
                        /* Unuk yang tipe Keterampilan */
                        /* dapetin nilai max  */
                        $sum_v3 = round(max($summary_skill));
                        $desc_max_ket = 0;
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_v3 == $key)
                            {
                                $desc_max_ket = $value;    
                            }
                        }

                        /* dapetin nilai min */
                        $sum_v4 = round(min($summary_skill));
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_v4 == $key)
                            {
                                $desc_min_ket = $value;    
                            }
                        }


                        /* dapetin nilai kkm max dan min  */
                        $max_ket = get_kkm ( $val_mst->course_id,round(max($summary_skill)),$request->class_grade_id );
                        $min_ket = get_kkm (  $val_mst->course_id,round(min($summary_skill)),$request->class_grade_id );
                        /* dapetin keterangan untuk input analisis  */
                        $nilai_ket_max = 'CUKUP BAIK';
                        $nilai_ket_min = 'CUKUP BAIK';
                        if($max_ket  == 'A')
                        {
                            $nilai_ket_max = 'SANGAT BAIK';
                        }
                        else if($max_ket == 'B')
                        {
                            $nilai_ket_max = 'BAIK';
                        }
                        else if($max_ket == 'C' )
                        {
                            $nilai_ket_max = 'CUKUP BAIK';
                        }

                        if($min_ket  == 'A')
                        {
                            $nilai_ket_min = 'SANGAT BAIK';
                        }
                        else if($min_ket == 'B')
                        {
                            $nilai_ket_min = 'BAIK';
                        }
                        else if($min_ket == 'C' )
                        {
                            $nilai_ket_min = 'CUKUP BAIK';
                        }
                    }   

                }
                    /**/    

                    /*cek first in the table raport*/
                     $exist_tema = 
                     \App\Models\Raport_pts::where('course_id',$val_mst->course_id)
                     ->where('student_id',$row->student->student_id)
                     ->where('step_study_id',stepStudyActive())
                     ->first();

                    $tot_sum_skill = 0;
                     $tot_pembagi_skill = 0;
                     foreach ($summary_skill as $key => $sm) {
                         # code..
                        if( !empty($sm != 0))
                        {
                            $tot_sum_skill +=$sm;
                            $tot_pembagi_skill++;
                        }
                     }

                     $tot_sum = 0;
                     $tot_pembagi = 0;
                     foreach ($summary as $key => $s) {
                         # code..
                        if(!empty($s))
                        {
                            $tot_sum +=$s;
                            $tot_pembagi++;
                        }
                     }

                     if(empty($exist_tema))
                     {
                                /* insert TO Raport */
                            $insert_tema['course_id'] = $val_mst->course_id;
                            $insert_tema['student_id'] = $row->student->student_id;
                            $insert_tema['step_study_id'] =  stepStudyActive();

                            if(array_sum($summary) == 0 )
                            {
                                $insert_tema['total_pengetahuan'] = 0;  
                            }
                            else
                            {
                                // $insert_tema['total_pengetahuan'] = round (round(array_sum($summary)) / count($summary) );
                                $insert_tema['total_pengetahuan'] = round(@( $tot_sum / $tot_pembagi ));

                            }
                            if(array_sum($summary_skill) == 0 )
                            {
                                $insert_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                // $insert_tema['total_keterampilan'] = round (round(array_sum($summary_skill)) / count($summary_skill) );
                                $insert_tema['total_keterampilan'] =  round(@( $tot_sum_skill / $tot_pembagi_skill ));

                            }   
                            
                            $insert_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$insert_tema['total_pengetahuan'],$request->class_grade_id);
                            $insert_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$insert_tema['total_keterampilan'],$request->class_grade_id);

                            $insert_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max.' dalam '.$desc_max_peng. '.' . $nilai_peng_min. ' dalam '.$desc_min_peng ;

                            $insert_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max.' dalam '.$desc_max_ket. '.' . $nilai_ket_min. ' dalam '.$desc_min_ket ;

                            $insert_tema['raport_pts_insert_time'] = date('Y-m-d H:i:s');
                            $insert_tema['raport_pts_insert_by'] = \Auth::user()->id;
                            
                            \App\Models\Raport_pts::create($insert_tema);    
                     }
                     else
                     {
                                /* UPDATE TO Raport */
                            $update_['course_id'] = $val_mst->course_id;
                            $update_['student_id'] = $row->student->student_id;
                            $update_['step_study_id'] =  stepStudyActive();

                            if(array_sum($summary) == 0 )
                            {
                                $update_['total_pengetahuan'] = 0;  
                            }
                            else
                            {
                                // $update_['total_pengetahuan'] = round (round(array_sum($summary)) / count($summary) );
                                $update_['total_pengetahuan'] = round(@( $tot_sum / $tot_pembagi ));
                            }
                            if(array_sum($summary_skill) == 0 )
                            {
                                $update_['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $update_['total_keterampilan'] =  round(@( $tot_sum_skill / $tot_pembagi_skill ));
                                // $update_['total_keterampilan'] = round (round(array_sum($summary_skill)) / count($summary_skill) );
                            }   
                            
                            $update_['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$update_['total_pengetahuan'],$request->class_grade_id);
                            $update_['predikat_keterampilan'] = get_kkm($val_mst->course_id,$update_['total_keterampilan'],$request->class_grade_id);

                            $update_['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max.' dalam '.$desc_max_peng. '.' . $nilai_peng_min. ' dalam '.$desc_min_peng ;

                            $update_['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max.' dalam '.$desc_max_ket. '.' . $nilai_ket_min. ' dalam '.$desc_min_ket ;

                            $update_['raport_pts_insert_time'] = date('Y-m-d H:i:s');
                            $update_['raport_pts_insert_by'] = \Auth::user()->id;
                    
                            \App\Models\Raport_pts::where('course_id',$val_mst->course_id)
                            ->where('student_id',$row->student->student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->update($update_);    
                     }

                    
            }
        }
        else
        {
            $summary_non_tema =[] ;
            $summary_skill_non_tema=[];
            $skill_non_tema=[];
            $nilai_peng_max_non_tema = '';
            $desc_max_peng_non_tema = '';
            $nilai_peng_min_non_tema = '';
            $desc_min_peng_non_tema = '';
              /* dapetin keterangan untuk input analisis  */
            $nilai_peng_max_non_tema = 'CUKUP BAIK';
            $nilai_peng_min_non_tema = 'CUKUP BAIK';

            /* dapetin keterangan untuk input analisis  */
            $nilai_ket_max_non_tema = 'CUKUP BAIK';
            $nilai_ket_min_non_tema = 'CUKUP BAIK';

            $desc_min_ket_non_tema = 0;
            $desc_max_ket_non_tema = 0;
            
            // ini bukan tematik
                $course_setting = 
                \DB::table('m_kd as mk')
                ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
                ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
                 ->join('m_course as c','c.course_id','cd.course_id')
                ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
                ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
                ->where('ms.study_group_id',$request->study_group_id)
                ->where('c.course_id',$val_mst->course_id)
                ->where('cd.unit_year_id',$unit_year_id)
                ->get();


                foreach($data_siswa as $row)
                {

                    foreach($course_setting as $ct)
                    {
                        if($ct->kd_type == 'Pengetahuan')
                        {
                            $val_non_tema = 
                            \DB::table('daily_exercise as de')
                            ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id"))
                            ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                            ->join('m_kd as k','k.kd_id','kd.kd_id')
                            ->groupBy('student_id','k.kd_id')
                            ->where('student_id',$row->student->student_id)
                            ->where('k.kd_id',$ct->kd_id)
                            ->where('k.kd_type','Pengetahuan')
                            ->where('de.step_study_id',stepStudyActive())
                            ->first();

                            $uts_non_tema = \App\Models\Summary_kd::where('type','uts')
                            ->where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 
                            $val_uts_non_tema = (!empty($uts_non_tema)) ? $uts_non_tema->total : 0 ;
                            
                            
                            $daily_non_tema = \App\Models\Summary_kd::
                            where('type','daily')
                            ->where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 

                            $val_daily_non_tema = (!empty($daily_non_tema)) ? $daily_non_tema->total : 0 ;


                            $get_h_non_tema = (!empty($val_non_tema->tot)) ? $val_non_tema->tot : 0 ;
                            $tot_p_non_tema = ($val_uts_non_tema + $val_daily_non_tema + $get_h_non_tema)/3 ;




                            $summary_non_tema[$ct->kd_code] = $tot_p_non_tema;
                            $kd_summary[round($tot_p_non_tema)] = $ct->kd_name;
                            $sum_max = round(max($summary_non_tema));    
                            $type_k_non_tema = $ct->kd_type;

                                 /* Unuk yang tipe Pengetahuan */
                            /* dapetin nilai max  */
                            $sum_v1_non_tema = round(max($summary_non_tema));
                            $desc_max_peng_non_tema = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v1_non_tema == $key)
                                {
                                    $desc_max_peng_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai min */
                            $sum_v2_non_tema = round(min($summary_non_tema));
                            $desc_min_peng_non_tema = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v2_non_tema == $key)
                                {
                                    $desc_min_peng_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai kkm max dan min  */
                            $max_peng_non_tema = get_kkm ( $val_mst->course_id,round(max($summary_non_tema)),$request->class_grade_id );
                            $min_peng_non_tema = get_kkm (  $val_mst->course_id,round(min($summary_non_tema)),$request->class_grade_id );


                            /* dapetin keterangan untuk input analisis  */
                            $nilai_peng_max_non_tema = 'CUKUP BAIK';
                            $nilai_peng_min_non_tema = 'CUKUP BAIK';
                            if($max_peng_non_tema  == 'A')
                            {
                                $nilai_peng_max_non_tema = 'SANGAT BAIK';
                            }
                            else if($max_peng_non_tema == 'B')
                            {
                                $nilai_peng_max_non_tema = 'BAIK';
                            }
                            else if($max_peng_non_tema == 'C' )
                            {
                                $nilai_peng_max_non_tema = 'CUKUP BAIK';
                            }

                            if($min_peng_non_tema  == 'A')
                            {
                                $nilai_peng_min_non_tema = 'SANGAT BAIK';
                            }
                            else if($min_peng_non_tema == 'B')
                            {
                                $nilai_peng_min_non_tema = 'BAIK';
                            }
                            else if($min_peng_non_tema == 'C' )
                            {
                                $nilai_peng_min_non_tema = 'CUKUP BAIK';
                            }

                        }
                        else
                        {
                            $skill_non_tema = \App\Models\Summary_skill::
                            where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 

                            $count_non_tema = \App\Models\Summary_skill::
                            where('student_id',$row->student->student_id)
                            ->where('kd_id',$ct->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->get(); 


                            $c_count = (!empty($count_non_tema)) ? count($count_non_tema) : 1;
                            $val_skill_non_tema = (!empty($skill_non_tema)) ? $skill_non_tema->total_skill : 0 ;
                        
                            $val_daily_non_tema = (!empty($skill_non_tema)) ? $skill_non_tema->total_skill : 0 ;
                            $tot_p_non_tema = ($val_skill_non_tema) ;

                            $summary_skill_non_tema[$ct->kd_code] = $tot_p_non_tema;
                            $kd_summary_skill_non_tema[round($tot_p_non_tema)] = $ct->kd_name;
                            $type_k_non_tema = $ct->kd_type;
                                  /* Unuk yang tipe Keterampilan */
                            /* dapetin nilai max  */
                            $sum_v3_non_tema = round(max($summary_skill_non_tema));
                            $desc_max_ket_non_tema = 0;
                            foreach ($kd_summary_skill_non_tema as $key => $value) 
                            {
                                if($sum_v3_non_tema == $key)
                                {
                                    $desc_max_ket_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai min */
                            $sum_v4_non_tema = round(min($summary_skill_non_tema));
                            $desc_min_ket_non_tema = '';
                            foreach ($kd_summary_skill_non_tema as $key => $value) 
                            {
                                if($sum_v4_non_tema == $key)
                                {
                                    $desc_min_ket_non_tema = $value;    
                                }
                            }

                            /* dapetin nilai kkm max dan min  */
                            $max_ket_non_tema = get_kkm ( $val_mst->course_id,round(max($summary_skill_non_tema)),$request->class_grade_id );
                            $min_ket_non_tema = get_kkm (  $val_mst->course_id,round(min($summary_skill_non_tema)),$request->class_grade_id );



                            /* dapetin keterangan untuk input analisis  */
                            $nilai_ket_max_non_tema = 'CUKUP BAIK';
                            $nilai_ket_min_non_tema = 'CUKUP BAIK';
                            if($max_ket_non_tema  == 'A')
                            {
                                $nilai_ket_max_non_tema = 'SANGAT BAIK';
                            }
                            else if($max_ket_non_tema == 'B')
                            {
                                $nilai_ket_max_non_tema = 'BAIK';
                            }
                            else if($max_ket_non_tema == 'C' )
                            {
                                $nilai_ket_max_non_tema = 'CUKUP BAIK';
                            }

                            if($min_ket_non_tema  == 'A')
                            {
                                $nilai_ket_min_non_tema = 'SANGAT BAIK';
                            }
                            else if($min_ket_non_tema == 'B')
                            {
                                $nilai_ket_min_non_tema = 'BAIK';
                            }
                            else if($min_ket_non_tema == 'C' )
                            {
                                $nilai_ket_min_non_tema = 'CUKUP BAIK';
                            }

                            /**/     
                        }   

                    }


                    /*cek first in the table raport*/
                     $cek_non_tema = \App\Models\Raport_pts::where('course_id',$val_mst->course_id)
                     ->where('student_id',$row->student->student_id)
                     ->where('step_study_id',stepStudyActive())
                     ->first();


                     $tot_sum_skill_non_tema = 0;
                     $tot_pembagi_skill_non_tema = 0;
                     foreach ($summary_skill_non_tema as $key => $sm_non_tema) {
                         # code..
                        if( !empty($sm_non_tema != 0))
                        {
                            $tot_sum_skill_non_tema +=$sm_non_tema;
                            $tot_pembagi_skill_non_tema++;
                        }
                     }

                     $tot_sum_non_tema = 0;
                     $tot_pembagi_non_tema = 0;
                     foreach ($summary_non_tema as $key => $s_non_tema) {
                         # code..
                        if(!empty($s_non_tema))
                        {
                            $tot_sum_non_tema +=$s_non_tema;
                            $tot_pembagi_non_tema++;
                        }
                     }


                     if(empty($cek_non_tema))
                     {
                             /* insert tematik TO Raport */
                            $insert_non_tema['course_id'] = $val_mst->course_id;
                            $insert_non_tema['student_id'] = $row->student->student_id;
                            $insert_non_tema['step_study_id'] =  stepStudyActive();
                            // if(!empty($summary))
                            if(array_sum($summary_non_tema) == 0 )
                            {
                                $insert_non_tema['total_pengetahuan'] = 0;
                            }
                            else
                            {
                                $insert_non_tema['total_pengetahuan'] = round(@($tot_sum_non_tema/$tot_pembagi_non_tema));

                                // $insert_non_tema['total_pengetahuan'] = round (round(array_sum($summary_non_tema)) / count($summary_non_tema) );
                            }
                            
                            if(array_sum($summary_skill_non_tema) == 0 )
                            {
                                $insert_non_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $insert_non_tema['total_keterampilan'] = round (@($tot_sum_skill_non_tema/$tot_pembagi_skill_non_tema));

                                // $insert_non_tema['total_keterampilan'] = round (round(array_sum($summary_skill_non_tema)) / count($summary_skill_non_tema) );
                            }

                            
                            $insert_non_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$insert_non_tema['total_keterampilan'],$request->class_grade_id);
                            $insert_non_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max_non_tema.' dalam '.$desc_max_peng_non_tema. '.' . $nilai_peng_min_non_tema. ' dalam '.$desc_min_peng_non_tema ;
                            $insert_non_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$insert_non_tema['total_pengetahuan'],$request->class_grade_id);
                            $insert_non_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max_non_tema.' dalam '.$desc_max_ket_non_tema. '.' . $nilai_ket_min_non_tema. ' dalam '.$desc_min_ket_non_tema ;

                            $insert_non_tema['raport_pts_insert_time'] = date('Y-m-d H:i:s');
                            $insert_non_tema['raport_pts_insert_by'] = \Auth::user()->id;

                            \App\Models\Raport_pts::create($insert_non_tema);    
                     }
                     else
                     {
                        /* update non tematik TO Raport */
                            $update_non_tema['course_id'] = $val_mst->course_id;
                            $update_non_tema['student_id'] = $row->student->student_id;
                            $update_non_tema['step_study_id'] =  stepStudyActive();

                            if(array_sum($summary_non_tema) == 0 )
                            {
                                $update_non_tema['total_pengetahuan'] = 0;
                            }
                            else
                            {
                                $update_non_tema['total_pengetahuan'] = round(@($tot_sum_non_tema/$tot_pembagi_non_tema));
                                // $update_non_tema['total_pengetahuan'] = round (round(array_sum($summary_non_tema)) / count($summary_non_tema) );
                            }
                            
                            if(array_sum($summary_skill_non_tema) == 0 )
                            {
                                $update_non_tema['total_keterampilan'] = 0;    
                            }
                            else
                            {
                                $update_non_tema['total_keterampilan'] = round (@($tot_sum_skill_non_tema/$tot_pembagi_skill_non_tema));
                                // $update_non_tema['total_keterampilan'] = round (round(array_sum($summary_skill_non_tema)) / count($summary_skill_non_tema) );
                            }

                            
                            $update_non_tema['predikat_keterampilan'] = get_kkm($val_mst->course_id,$update_non_tema['total_keterampilan'],$request->class_grade_id);
                            $update_non_tema['keterangan_pengetahuan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_peng_max_non_tema.' dalam '.$desc_max_peng_non_tema. '.' . $nilai_peng_min_non_tema. ' dalam '.$desc_min_peng_non_tema ;
                            $update_non_tema['predikat_pengetahuan'] = get_kkm($val_mst->course_id,$update_non_tema['total_pengetahuan'],$request->class_grade_id);
                            $update_non_tema['keterangan_keterampilan'] =  'Ananda '.$row->student->student_name. '  '. $nilai_ket_max_non_tema.' dalam '.$desc_max_ket_non_tema. '.' . $nilai_ket_min_non_tema. ' dalam '.$desc_min_ket_non_tema ;

                            $update_non_tema['raport_pts_insert_time'] = date('Y-m-d H:i:s');
                            $update_non_tema['raport_pts_insert_by'] = \Auth::user()->id;

                            \App\Models\Raport_pts::where('course_id',$val_mst->course_id)
                            ->where('student_id',$row->student->student_id)
                            ->where('step_study_id',stepStudyActive())
                            ->update($update_non_tema);    
                     }

                   
                }
            } // this ended if else tematik
        }  
        // this ended for looping raport uts

          \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }


    public function get_view_raport(Request $request)
    {
        $q=$request->id;
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();


        $student = 
        \App\Models\Study_group_setting::with(['student','study_group'])
        ->whereHas('student',function($query) use ($q){
            $query->where('student_id',$q);
        })
        ->where('unit_year_id',$unit_year_id)->first();

        $student_grup = 
        \App\Models\Study_group_setting::where('student_id',$q)->first();

        $unit = \App\Models\M_unit::where('unit_id',$student->student->unit_id)->first();
       
        $course_biasa = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$student_grup->study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','biasa')
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->get();
        

        if(empty($course_biasa))
        {
            return response(json_encode(['message'=>'Silahkan Masukan Nilai KKM Terlebih Dahulu']),500);
        }
        $course_mulok = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$student_grup->study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('course_type','muatan_lokal')
        // ->whereNotIn('c.course_name',['Tahsin'])
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->get();


        
        if(empty($course_mulok))
        {
            return response(json_encode(['message'=>'Silahkan Masukan Nilai KKM Terlebih Dahulu']),500);
        }

        $kelakuan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kelakuan')
        ->where('student_id',$q)->first();

        $kerajinan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerajinan')
        ->where('student_id',$q)->first();

        $kerapihan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerapihan')
        ->where('student_id',$q)->first();
    
        $walas =   $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$student->study_group_id)
        ->first();
        $semester =  \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',yearActive())->first();
        $year =  \App\Models\M_unit_year::where('unit_year_status','active')->first();

        $spiritual =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','spiritual')->get();
        $sosial =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','sosial')->get();


        $tahsin = \App\Models\Tahsin::where('student_id',$request->id)->get();
        $tahfizh = \App\Models\Tahfizh::where('student_id',$request->id)->get();
        $eskul = \App\Models\Extracurricular::where('student_id',$request->id)->get();
        $teacher_note = \App\Models\TeacherNote::where('student_id',$request->id)->first();

        $tinggi = 
          \DB::table('physical_student as a')
        ->where('step_study_id',stepStudyActive())
        ->where('student_id',$request->id)
        ->where('physical_type','Tinggi')
        ->where('physical_category','Fisik')
        ->first();    
        $berat = 
          \DB::table('physical_student as a')
        ->where('step_study_id',stepStudyActive())
        ->where('student_id',$request->id)
        ->where('physical_type','Berat')
        ->where('physical_category','Fisik')
        ->first();

        $absensi = 
            $q_vl = \DB::table('absensi')
            ->select(\DB::raw("count(absensi_total) as tot,absensi_type"))
            ->where('student_id',$request->id)
            ->groupBy('absensi_type')
            ->get();

        $kesehatan = \App\Models\PhysicalStudent::where('student_id',$request->id)->where('physical_category','Kesehatan')->where('step_study_id',stepStudyActive())->get();

        /* Ini untuk header */
        $tb = 
            '<table width="100%" style="font-size:12px;">
                <tr>
                    <td style="text-align: left"  width="80%">
                       <h6 style="text-align: center;">             RAPORT PESERTA DIDIK DAN PROFIL PESERTA DIDIK </h6>
                       <h6 style="text-align: center;">      '.$unit->unit_name.'         </h6>
                       <h6 style="text-align: center;">        '.$unit->unit_address.'     </h6>
                    </td>
                    <td width="10%">
                        
                    </td>
                </tr>
              </table>';

            /* untuk nama dan nisn */
            $tb.='<table cellspacing="0" cellpadding="0" width="100%" style="font-size:12px">
                <tr>
                        <td width="50%" class="f12"  >
                            <table    style="margin: 0px;padding: 0px;" width="100%" cellpadding="0" cellspacing="0" style="font-size:12px;"> 
                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12"  width="40%" >
                                    Nama Peserta Didik 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->student->student_name.'</td>
                                </tr>
                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12" width="40%">
                                         Kelas 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->study_group->study_group_name.' </td>
                                </tr>

                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12" width="40%">
                                    No Induk 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->student->student_id_card.' </td>
                                </tr>
                            </table>
                        </td>
                        
                            <td  width="50%" class="f12" style="margin: 0px;padding-left: 90px;">
                            <table    style="margin: 0px;padding: 0px;" width="100%" cellpadding="0" cellspacing="0" border="0" style="font-size:12px;"> 
                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            Semester
                                        </td>
                                        <td width="5%" style="text-align: right;">:</td>
                                        <td width="30%" style="text-align: right;">  '.$semester->step_study_name.'  </td>
                                    </tr>
                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            
                                        </td>
                                        <td width="5%" style="text-align: right;"></td>
                                         <td width="30%" style="text-align: right;"> </td>
                                    </tr> 

                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            Tahun Pelajaran
                                        </td>
                                        <td width="5%" style="text-align: right;">:</td>
                                        <td width="30%" style="text-align: right;"> '.$year->unit_year_name.' </td>
                                    </tr>
                                </table>
                            </td>
                        
                </tr>
            </table>
                       
              <hr>';

               /*
                select  count(*) as one, ( 
                        select count(*)  from friendly_value fv 
                        where fv.friendly_value_category = 'spiritual'
                        and fv.friendly_value_type  = 'SB'
                        and fv.friendly_value_type  = 'Ibadah'
                        and student_id = '1446'   
                    ) as two, (select count(*)  from pd p
                        where p.pd_category = 'spiritual'
                        and p.pd_value  = 'SB'
                        and p.pd_type  = 'Ibadah'
                        and student_id = '1446') as three
                from observasi o
                where o.observasi_category = 'spiritual'
                and observasi_value  = 'SB'
                and observasi_type  = 'Ibadah'
                and student_id = '1446';
               */
              /* untuk data spiritual dan data nilai  */
              $obser_sprit = \App\Models\Observasi::where('observasi_category','spiritual')->where('student_id',$student->student->student_id)->get();
              $obser_sosial = \App\Models\Observasi::where('observasi_category','sosial')->where('student_id',$student->student->student_id)->get();


              $tb.= '<div class="f12"> A. Sikap</div>';

                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr>
                        <th colspan="2" align="center">  Deskripsi: </th>
                    </tr>';

                $tb.='<tr class="f12">
                    <td align="left">1. Sikap Spritual</td>';
                    $tb.='<td align="left"> Ananda '.strtoupper($student->student->student_name).' sangat taat ber';
                    foreach($obser_sprit as $os)
                    {   
                        if($os->observasi_value == "SB")
                        {
                            $ot = $os->observasi_type;
                            $tb.= $ot.', ';
                        }
                    }
                    $tb.='dengan baik</td>';
                $tb.='</tr>';

                $tb.='<tr class="f12">
                    <td align="left">2. Sikap Sosial</td>';
                    $tb.='<td align="left"> Ananda '.strtoupper($student->student->student_name).' sangat ';
                    foreach($obser_sosial as $oso)
                    {   
                        if($oso->observasi_value == "SB")
                        {
                            $ot = $oso->observasi_type;
                            $tb.= $ot.', ';
                        }
                    }
                    $tb.='</td>';
                $tb.='</tr>';

                $tb.='</table><br/>';



                
                $tb.='<div class="f12"> B. Pengetahuan dan Keterampilan</div>
                  <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
                    <thead class="color_b"> 
                         <tr class="f12">
                            <td align="center">No</td>
                            <td  align="center">Mata Pelajaran</td>
                            <td  align="center">KKM</td>
                            <td  align="center">NILAI</td>
                            <td  align="center">RATA - RATA KELAS</td>
                            <td  align="center">KET</td>
                        </tr>
                    </thead>
                    <tbody>';
                        
                        $no = 1; 
                        $total_stu = 0;
                        foreach($course_biasa as $c) 
                       {

                         $list_course = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('cs.course_id',$c->course_id)
                        ->where('k.class_grade_id',$student->student->class_grade_id)
                        ->first();

                        if(empty($list_course))
                        {
                            $avg_c = 0;
                            $total_stu = 0;
                        }
                        else
                        {
                            if(  $list_course->total_pengetahuan != 0) 
                            {
                                $total_stu = round(  ($list_course->total_pengetahuan+$list_course->total_keterampilan) /2  ) ;        
    
                               $avg_c = \DB::table('raport as rps')
                                ->join('m_student as ms','ms.student_id','rps.student_id')
                                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                                ->select(\DB::raw('  round ( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
                                ->where('course_id',$list_course->course_id)
                                ->where('msg.study_group_id',$student->study_group_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first();
                            }
                            else if( $list_course->total_keterampilan != 0) 
                            {
                                $total_stu = round(  $list_course->total_keterampilan  ) ;    
                                $avg_c = \DB::table('raport as rps')
                                ->join('m_student as ms','ms.student_id','rps.student_id')
                                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                                ->select(\DB::raw(' round ( sum ( total_keterampilan  ) / count(rps.student_id ) )  as tot'))
                                ->where('course_id',$list_course->course_id)
                                ->where('msg.study_group_id',$student->study_group_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first();
                            }
                            else
                            {
                                $avg_c = 0;
                                $total_stu = 0;
                            }
                        }

                        
                       // dd($total_stu);
                        
                       $total_ = (empty($total_stu)) ? 0 : $total_stu;
                       $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;
                       $kkm_value = (empty($list_course)) ? 0 : $list_course->kkm_value;
                       
                        $tb .= '<tr><td class="f12" align="center"> '.$no.'</td>';
                        $tb.='<td class="f12" align="left"> '.$c->course_name.'</td>';
                        $tb.='<td class="f12"  align="center">  '.$kkm_value.' </td>';
                            $tb.='<td class="f12"  align="center">  '.$total_.'</td>';
                            $tb.='<td class="f12"  align="center">  '.$avg_.'   </td>';
                            $tb.='<td class="f12"  align="center">';
                            if($total_ >= $kkm_value)  
                            {
                                $tb.="Tuntas";
                            }  
                            else
                            {
                                $tb.="Belum Tuntas";
                            }
                            $tb.='</td>';
                            $tb.='</tr>';
                            $no++;
                        }

                    $tb .= '<tr class="f12">
                        <td align="center"></td>
                        <td colspan="5">Muatan Lokal</td>
                    </tr>';

                $no_mulok=1; 
                foreach($course_mulok as $c) 
                {

                         $list_course_mulok = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('c.course_id',$c->course_id)
                        ->where('k.class_grade_id',$student->student->class_grade_id)
                        ->first();


                        if(!empty($list_course_mulok->total_pengetahuan)  )
                        {
                            $total_stu = round(  ($list_course_mulok->total_pengetahuan+$list_course_mulok->total_keterampilan) /2  ) ;    

                            $avg_c = \DB::table('raport as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course_mulok->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                        }
                        elseif(!empty($list_course_mulok->total_keterampilan))
                        {
                            $total_stu = $list_course_mulok->total_keterampilan;


                            $avg_c = \DB::table('raport as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round ( sum (total_keterampilan ) / count(rps.student_id ) ) as tot'))
                            ->where('course_id',$list_course_mulok->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();  
                        }
                        $total_ = (empty($total_stu)) ? 0 : $total_stu;
                        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot; 
                        $kkm_val_ =  (empty($list_course_mulok->kkm_value)) ? 0 : $list_course_mulok->kkm_value;
                        $tb.=
                        '<tr>
                            <td class="f12" align="center">'.$no_mulok.'</td>
                            <td class="f12" align="left"> '.$c->course_name.' </td>
                            <td class="f12"  align="center">  '.$kkm_val_.' </td>
                            <td class="f12"  align="center"> '. $total_ .' </td>
                            <td class="f12"  align="center"> '. $avg_ .'  </td>
                            <td class="f12"  align="center">';
                            if($total_ >= $kkm_val_)  
                            {
                              $tb.="Tuntas";
                            }   
                            else
                            {
                                $tb.="Belum Tuntas";    
                            }   
                        $tb.='</td>
                        </tr>';
                        $no_mulok++;
                    }

                     $tb.='</tbody>
                  </table>
                    <br/>';

                    
                 $tb.='<div class="f12"> Catatan Tahsin & Tahfizh  </div>';
                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr>
                        <th>  Target Hafalan Surat </th>
                        <th>  Pencapaian </th>
                    </tr>';
                $mulok_tahsin = 
                \DB::table('m_course as c')
                ->join('course_setting as cd','cd.course_id','c.course_id')
                ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
                ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
                ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
                ->where('ms.study_group_id',$student->study_group_id)
                ->where('cg.class_grade_id',$student->student->class_grade_id)   
                ->where('cd.unit_year_id',yearActive())
                ->where('course_type','muatan_lokal')
                ->where('kkm.class_grade_id',$student->student->class_grade_id)
                ->where('c.course_name','Tahsin')
                ->get();

                $mulok_tahfizh = 
                \DB::table('m_course as c')
                ->join('course_setting as cd','cd.course_id','c.course_id')
                ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
                ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
                ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
                ->where('ms.study_group_id',$student->study_group_id)
                ->where('cg.class_grade_id',$student->student->class_grade_id)   
                ->where('cd.unit_year_id',yearActive())
                ->where('course_type','muatan_lokal')
                ->where('kkm.class_grade_id',$student->student->class_grade_id)
                ->where('c.course_name','Tahfizh')
                ->get();
                if(!empty($mulok_tahsin))
                {
                    foreach ($mulok_tahsin as $key => $cr) 
                    {

                              $list_course_mulok = \DB::table('course_setting as cs')
                            ->join('m_course as c','c.course_id','cs.course_id')
                            ->join('m_kkm as k','k.course_id','c.course_id')
                            ->join('raport as r','r.course_id','c.course_id')
                            ->where('r.student_id',$student->student->student_id)
                            ->where('r.step_study_id',stepStudyActive())
                            ->where('c.course_id',$cr->course_id)
                            ->where('k.class_grade_id',$student->student->class_grade_id)
                            ->first();
                            $tot_catatan = round(  $list_course_mulok->total_keterampilan  ) ;   

                            $list_detail = \DB::table('course_setting as cs')
                                ->join('m_course as c','c.course_id','cs.course_id')
                                ->join('m_kd as d','d.course_setting_id','cs.course_setting_id')
                                ->join('m_kd_detail as e','e.kd_id','d.kd_id')
                                ->join('raport as r','r.course_id','c.course_id')
                                ->where('r.student_id',$student->student->student_id)
                                ->where('r.step_study_id',stepStudyActive())
                                ->where('cs.class_grade_id',$cr->class_grade_id)
                                ->where('r.course_id',$cr->course_id)
                                ->get();
                            

                            $tb.='<tr class="f12">';
                                
                                 
                                $tb.='<td align="left">';
                                $tb.=$cr->course_name.'<br>';
                                foreach ($list_detail as $key => $vl_detail) {
                                    $tb.=$vl_detail->kd_name.'<br>';
                                }
                                $tb.='</td>';
                                
                                $tb.='<td align="left">';
                                $count = 0;
                                $tmbah=0;
                                foreach ($list_detail as $key => $vl_detail)
                                {
                                    if($vl_detail->total_keterampilan !=0)
                                    {
                                        $tmbah+=$vl_detail->total_keterampilan;
                                        $count++;
                                    }
                                }
                                $total_catatan = $tmbah/$count;
                                $max_ket = get_kkm ( $cr->course_id,$total_catatan,$cr->class_grade_id );
                                if($max_ket  == 'A')
                                {
                                    $tb.='SANGAT BAIK';
                                }
                                elseif($max_ket == 'B')
                                {
                                    $tb.='BAIK';
                                }
                                elseif($max_ket == 'C' )
                                {
                                    $tb.='CUKUP BAIK';
                                }

                                $tb.='</td>';
                                
                            '</tr>';
                    } 
                } 

                if(!empty($mulok_tahfizh))
                {
                    foreach ($mulok_tahfizh as $key => $cr) 
                    {

                              $list_course_mulok = \DB::table('course_setting as cs')
                            ->join('m_course as c','c.course_id','cs.course_id')
                            ->join('m_kkm as k','k.course_id','c.course_id')
                            ->join('raport as r','r.course_id','c.course_id')
                            ->where('r.student_id',$student->student->student_id)
                            ->where('r.step_study_id',stepStudyActive())
                            ->where('c.course_id',$cr->course_id)
                            ->where('k.class_grade_id',$student->student->class_grade_id)
                            ->first();
                            $tot_catatan = round(  $list_course_mulok->total_keterampilan  ) ;   

                            $list_detail = \DB::table('course_setting as cs')
                                ->join('m_course as c','c.course_id','cs.course_id')
                                ->join('m_kd as d','d.course_setting_id','cs.course_setting_id')
                                ->join('m_kd_detail as e','e.kd_id','d.kd_id')
                                ->join('raport as r','r.course_id','c.course_id')
                                ->where('r.student_id',$student->student->student_id)
                                ->where('r.step_study_id',stepStudyActive())
                                ->where('cs.class_grade_id',$cr->class_grade_id)
                                ->where('r.course_id',$cr->course_id)
                                ->get();
                            

                            $tb.='<tr class="f12">';
                                
                                 
                                $tb.='<td align="left">';
                                $tb.=$cr->course_name.'<br>';
                                foreach ($list_detail as $key => $vl_detail) {
                                    $tb.=$vl_detail->kd_name.'<br>';
                                }
                                $tb.='</td>';
                                
                                $tb.='<td align="left">';
                                $count = 0;
                                $tmbah=0;
                                foreach ($list_detail as $key => $vl_detail)
                                {
                                    if($vl_detail->total_keterampilan !=0)
                                    {
                                        $tmbah+=$vl_detail->total_keterampilan;
                                        $count++;
                                    }
                                }
                                $total_catatan = $tmbah/$count;
                                $max_ket = get_kkm ( $cr->course_id,$total_catatan,$cr->class_grade_id );
                                if($max_ket  == 'A')
                                {
                                    $tb.='SANGAT BAIK';
                                }
                                elseif($max_ket == 'B')
                                {
                                    $tb.='BAIK';
                                }
                                elseif($max_ket == 'C' )
                                {
                                    $tb.='CUKUP BAIK';
                                }

                                $tb.='</td>';
                                
                            '</tr>';
                    } 
                }
                
                $tb.='</table><br/>';




                $teacher_ = (empty($teacher_note)) ? "" : $teacher_note->raport_pas;
                
                
                 $tb.='<div class="f12"> C. Ekstrakurikular  </div>';
                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr>
                        <th>  Ekstrakurikular </th>
                        <th>  Deskripsi </th>
                    </tr>';
                if(!empty($eskul))
                {
                    foreach ($eskul as $key => $value) 
                    {
                        $tb.='<tr class="f12">
                            <td align="left">'.$value->type.'</td>
                            <td align="left">'.$value->value.' '.$value->desc .'</td>
                        </tr>';
                    } 
                }
                
                $tb.='</table><br/>';

        


                $tb.='<div class="f12"> D. Catatan  </div>
                  <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
                         <tr class="f12">
                            <td align="left">'.$teacher_.'</td>
                        </tr>
                  </table>
                    <br/>';


                 $tb.='<div class="f12"> E. Tinggi dan Berat Badan  </div>';
                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr >
                        <th rowspan="2">  Aspek Yang Dinilai </th>
                        <th colspan="2">  Semester </th>
                    </tr>';
                $tb.='<tr> 
                        <th>  1 </th>
                        <th>  2 </th>
                </tr>';
                if(!empty($tinggi))
                {
                    $tb.='<tr class="f12">
                    <td align="left">Tinggi Badan</td>
                    <td align="left"></td>
                    <td align="left">'.$tinggi->physical_value.'</td>
                    </tr>';    
                }


                if(!empty($berat))
                {
                    $tb.='<tr class="f12">
                        <td align="left">Berat Badan</td>
                        <td align="left"></td>
                        <td align="left">'.$berat->physical_value.'</td>
                    </tr>';
                }   
        
                $tb.='</table><br/>';

                $tb.='<div class="f12"> F. Kondisi Kesehatan  </div>';
                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr>
                        <th>  Aspek Fisik </th>
                        <th>  Keterangan </th>
                    </tr>';
                if(!empty($kesehatan))
                {
                    foreach ($kesehatan as $key => $val_kes) 
                    {
                        $tb.='<tr class="f12">
                            <td align="left">'.$val_kes->physical_type.'</td>
                            <td align="left">'.$val_kes->physical_value .'</td>
                        </tr>';
                    } 
                }
                $tb.='</table><br/>';
                $prestation = \App\Models\Prestation::where('student_id',$request->id)->where('step_study_id',stepStudyActive())->get();

                $tb.='<div class="f12"> G. Prestasi  </div>';
                 $tb.='<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">';
                 $tb.='<tr>
                        <th>  Jenis Prestasi </th>
                        <th>  Keterangan </th>
                    </tr>';
                if(count($prestation) > 0)
                {
                    foreach ($prestation as $key => $val_pres) 
                    {
                        $tb.='<tr class="f12">
                            <td align="left">'.$val_pres->value.'</td>
                            <td align="left">'.$val_pres->desc .'</td>
                        </tr>';
                    } 
                }
                
                $tb.='</table><br/>';




                $tb.='<table width="100%" class="table table-bordered" style="font-size:12px;">

                    <tr>
                        
                        <td  width="50%">
                             <table border="1" cellspacing="0" cellspacing="0"  class="table table-bordered" width="100%" style="font-size:12px;">
                                <tr>
                                    <td class="f12" colspan="2">Ketidakhadiran</td>
                                    <td class="f12" >Jumlah</td>
                                </tr>';
                                $tot= 0;
                                $no = 1;
                                foreach($absensi as $k => $ab)
                                {
                                    $tb.='<tr class="f12">
                                        <td align="left">'.$no.'</td>
                                        <td  align="left">'.$ab->absensi_type.'</td>
                                        <td  align="left"> '.$ab->tot.'  Hari </td>
                                    </tr>';
                                    $tot +=$ab->tot;
                                    $no++;
                                }
                                $tb.='<tr>
                                    <td colspan="2" class="f12">Jumlah</td>
                                    <td class="f12"> '.$tot. '  Hari</td>
                                </tr>
                            </table>
                        </td>';


                        $tb.='<td width="50%" >
                                <table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" width="100%" style="font-size:12px;">
                                    <tr class="f12">
                                        <td      colspan="2"> Kepribadian </td>
                                        <td    > Nilai </td>
                                    </tr>
                                    <tr class="f12">
                                        <td>1</td>
                                        <td    align="left">Kelakuan</td>';
                                        $tb.='<td    align="left">';
                                            if(!empty($kelakuan))  
                                            {
                                                $tb.=$kelakuan->personality_value;
                                            }
                                            else
                                            {
                                                $tb.='';
                                            }
                                        $tb.='</td>
                                    </tr>';
                                    $tb.='<tr class="f12">
                                        <td  >2</td>
                                        <td    align="left">Kerajinan</td>
                                        <td    align="left">';
                                            if(!empty($kerajinan)) 
                                            {
                                                $tb.=$kerajinan->personality_value; 
                                            }
                                            else
                                            {
                                                $tb.="";
                                            }
                                        $tb.='</td>
                                    </tr>';
                                    $tb.='<tr class="f12">
                                        <td  >3</td>
                                        <td    align="left">Kerapihan</td>
                                        <td    align="left">';
                                            if(!empty($kerapihan)) 
                                            {
                                                $tb.=$kerapihan->personality_value;
                                            }
                                            else
                                            {
                                                $tb.="";
                                            }
                                        $tb.='</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="f12"> &nbsp; </td>
                                        <td class="f12">   &nbsp; </td>
                                    </tr>

                                </table>
                        </td>
                    </tr>
                </table>';

                $kepsek = \DB::table('m_employee as a')
                ->join('roles as b','a.employee_role','b.id')
                ->select('employee_role','photo_assign','b.name','employee_name')
                ->where('b.name','ilike','%Kepala Sekolah%')
                ->first();
                 
                  $tb.='<table width="100%" class="table table-bordered" style="font-size:12px;">
                    <tr>
                        <td class="f12" align="center">
                            Mengetahui : 
                            <br>
                            Orang Tua / Wali,
                        </td>
                        <td></td>
                        <td class="f12" align="center">
                            Jakarta, '.toIndonesia($semester->date_pas).'
                            <br>
                            Wali Kelas '.$student->study_group->study_group_name.'
                        </td>
                    </tr>';
                    $tb.='<tr>
                        <td class="f12" align="center">
                            <div style="margin-top:60px">
                                --------------------------
                            </div>
                        </td>
                        <td align="center">Kepala Sekolah
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                            <b><u>'.$kepsek->employee_name.'</u></b>
                        </td>
                        <td class="f12" align="center">
                            <div style="margin-top:60px">
                                <b><u>'.$walas->employee->employee_name.'</u></b>
                            </div>
                        </td>
                    </tr>
                  </table>';


                $tb.='<br/>
                <div class="f12"> Lampiran </div>
              <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px">
                <thead class="color_b"> 
                    <tr class="f12" >
                        <td rowspan="2">No</td>
                        <td rowspan="2">Mata Pelajaran</td>
                        <td colspan="3" align="center"> Pengetahuan </td>
                        <td colspan="3" align="center"> Keterampilan </td>
                    </tr>
                   
                    <tr class="f12">
                        <td> Nilai </td>
                        <td> Predikat </td>
                        <td> Deskripsi </td>   
                        <td> Nilai </td>
                        <td> Predikat </td>
                        <td> Deskripsi </td>
                    </tr>             
                </thead>
                
                <tbody>';
                    $no_lamp= 1;
                    foreach($course_biasa as $c)
                    {
                        
                         $list_course = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('r.course_id',$c->course_id)
                        ->first();
                        $predikat_pengetahuan = (empty($list_course)) ? 0 : $list_course->predikat_pengetahuan;
                        $total_pengetahuan = (empty($list_course)) ? 0 : $list_course->total_pengetahuan;
                        $keterangan_pengetahuan = (empty($list_course)) ? 0 : $list_course->keterangan_pengetahuan;
                        $total_keterampilan =   (empty($list_course)) ? 0 : $list_course->total_keterampilan;
                        $predikat_keterampilan = (empty($list_course)) ? 0 : $list_course->predikat_keterampilan;
                        $keterangan_keterampilan = (empty($list_course)) ? 0 : $list_course->keterangan_keterampilan;
                        $peng_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->keterangan_pengetahuan : "";
                        $tot_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->total_pengetahuan : "";
                        $pred_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->predikat_pengetahuan : "";
                                        
                        $tb .='<tr class="f12">
                            <td> '.$no_lamp.' </td>
                            <td> '.$c->course_name.' </td>
                            <td> '.$tot_ket .'</td>   
                            <td> '. $pred_ket .'</td>   
                            <td> '.$peng_ket.'</td>   
                            <td> '.$total_keterampilan.'</td>   
                            <td> '.$predikat_keterampilan.'</td>   
                            <td> '. $keterangan_keterampilan .'</td>   
                        </tr>';
                        $no_lamp++;
                    }

                    $tb.='<tr class="color_b">
                        <td align="center" class="f12"></td>
                        <td colspan="7" style="font-size: 14px">Muatan Lokal</td>
                    </tr>';
                    $no_lamp_mul= 1;
                    foreach($course_mulok as $c) 
                    {    
                         $list_course = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('r.course_id',$c->course_id)
                        ->first();
                        $predikat_pengetahuan = (empty($list_course)) ? 0 : $list_course->predikat_pengetahuan;
                        $total_pengetahuan = (empty($list_course)) ? 0 : $list_course->total_pengetahuan;
                        $keterangan_pengetahuan = (empty($list_course)) ? 0 : $list_course->keterangan_pengetahuan;
                        $total_keterampilan =   (empty($list_course)) ? 0 : $list_course->total_keterampilan;
                        $predikat_keterampilan = (empty($list_course)) ? 0 : $list_course->predikat_keterampilan;
                        $keterangan_keterampilan = (empty($list_course)) ? 0 : $list_course->keterangan_keterampilan;
                         
                      $peng_mul = ($c->course_name != "Komputer") ? $list_course->keterangan_pengetahuan : "";
                      $tot_mul = ($c->course_name != "Komputer") ? $list_course->total_pengetahuan : "";
                      $pred_mul = ($c->course_name != "Komputer") ? $list_course->predikat_pengetahuan : "";
                        if( $c->course_name != 'Tahfizh' and $c->course_name != 'Tahsin')
                        {
                            $tb.='<tr class="f12">
                            <td> '.$no_lamp_mul.'</td>
                            <td> '.$c->course_name.'</td>';

                            $tb.='<td> '. $pred_mul .'</td>';

                            $tb.='<td> '.$tot_mul .'</td>   
                            <td> '.$peng_mul.'</td>   
                            <td> '.$total_keterampilan.'</td>   
                            <td> '.$predikat_keterampilan.'</td>   
                            <td> '. $keterangan_keterampilan .'</td>   
                        </tr>';
                        $no_lamp_mul++;    
                        }
                    
                    }
                $tb.='</tbody>
              </table>';
        return ['data_all'=>$tb];
    }      

    public function get_view_raport_pts(Request $request)
    {
        $q=$request->id;
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();


        $student = 
        \App\Models\Study_group_setting::with(['student','study_group'])
        ->whereHas('student',function($query) use ($q){
            $query->where('student_id',$q);
        })
        ->where('unit_year_id',$unit_year_id)->first();

        $student_grup = 
        \App\Models\Study_group_setting::where('student_id',$q)->first();

        $unit = \App\Models\M_unit::where('unit_id',$student->student->unit_id)->first();
       

        $course_biasa = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$student_grup->study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        // ->where('kkm.step_study_id',$stepStudyActive)
        ->where('course_type','biasa')
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->get();

        if(empty($course_biasa))
        {
            return response(json_encode(['message'=>'Silahkan Masukan Nilai KKM Terlebih Dahulu']),500);
        }

        $course_mulok = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$student_grup->study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        // ->where('kkm.step_study_id',$stepStudyActive)
        ->where('course_type','muatan_lokal')
        ->whereNotIn('c.course_name',['Tahsin'])
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->get();


        
        if(empty($course_mulok))
        {
            return response(json_encode(['message'=>'Silahkan Masukan Nilai KKM Terlebih Dahulu']),500);
        }

        $kelakuan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kelakuan')
        ->where('student_id',$q)->first();

        $kerajinan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerajinan')
        ->where('student_id',$q)->first();

        $kerapihan= 
            \App\Models\Personality::
        where('step_study_id',stepStudyActive())
        ->where('personality_type','Kerapihan')
        ->where('student_id',$q)->first();
    
        $walas =   $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$student->study_group_id)
        ->first();
        $semester =  \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',yearActive())->first();
        $year =  \App\Models\M_unit_year::where('unit_year_status','active')->first();

        $spiritual =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','spiritual')->get();
        $sosial =  \App\Models\Observasi::where('student_id',$request->id)->where('observasi_category','sosial')->get();


        $tahsin = \App\Models\Tahsin::where('student_id',$request->id)->get();
        $tahfizh = \App\Models\Tahfizh::where('student_id',$request->id)->get();
        $eskul = \App\Models\Extracurricular::where('student_id',$request->id)->get();
        $teacher_note = \App\Models\TeacherNote::where('student_id',$request->id)->first();
        $tinggi = 
          \DB::table('physical_student as a')
        ->join('m_step_study as b','b.step_study_id','a.step_study_id')
        ->join('m_unit_year as c','c.unit_year_id','b.unit_year_id')
        ->where('unit_year_status','active')
        ->where('student_id',$request->id)
        ->where('physical_type','Tinggi')
        ->where('physical_category','Fisik')
        ->get();    
        $berat = 
          \DB::table('physical_student as a')
        ->join('m_step_study as b','b.step_study_id','a.step_study_id')
        ->join('m_unit_year as c','c.unit_year_id','b.unit_year_id')
        ->where('unit_year_status','active')
        ->where('student_id',$request->id)
        ->where('physical_type','Berat')
        ->where('physical_category','Fisik')
        ->get();

        $absensi = 
            $q_vl = \DB::table('absensi')
            ->select(\DB::raw("count(absensi_total) as tot,absensi_type"))
            ->where('student_id',$request->id)
            ->groupBy('absensi_type')
            ->get();

        $kesehatan = \App\Models\PhysicalStudent::where('student_id',$request->id)->where('physical_category','Kesehatan')->get();

        /* Ini untuk header */
        $tb = 
            '<table width="100%" style="font-size:12px;">
                <tr>
                    <td style="text-align: left"  width="80%">
                       <h6 style="text-align: center;">             RAPORT PESERTA DIDIK DAN PROFIL PESERTA DIDIK </h6>
                       <h6 style="text-align: center;">      '.$unit->unit_name.'         </h6>
                       <h6 style="text-align: center;">        '.$unit->unit_address.'     </h6>
                    </td>
                    <td width="10%">
                        
                    </td>
                </tr>
              </table>';

            /* untuk nama dan nisn */
            $tb.='<table cellspacing="0" cellpadding="0" width="100%" style="font-size:12px">
                <tr>
                        <td width="50%" class="f12"  >
                            <table    style="margin: 0px;padding: 0px;" width="100%" cellpadding="0" cellspacing="0" style="font-size:12px;"> 
                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12"  width="40%" >
                                    Nama Peserta Didik 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->student->student_name.'</td>
                                </tr>
                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12" width="40%">
                                         Kelas 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->study_group->study_group_name.' </td>
                                </tr>

                                <tr style="margin: 0px;padding: 0px;" >
                                    <td class="f12" width="40%">
                                    No Induk 
                                    </td>
                                    <td width="5%">:</td>
                                    <td width="55%"> '.$student->student->student_id_card.' </td>
                                </tr>
                            </table>
                        </td>
                        
                            <td  width="50%" class="f12" style="margin: 0px;padding-left: 90px;">
                            <table    style="margin: 0px;padding: 0px;" width="100%" cellpadding="0" cellspacing="0" border="0" style="font-size:12px;"> 
                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            Semester
                                        </td>
                                        <td width="5%" style="text-align: right;">:</td>
                                        <td width="30%" style="text-align: right;">  '.$semester->step_study_name.'  </td>
                                    </tr>
                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            NISN
                                        </td>
                                        <td width="5%" style="text-align: right;">:</td>
                                         <td width="30%" style="text-align: right;"> '.$student->student->student_nisn.' </td>
                                    </tr> 

                                    <tr>
                                        <td class="f12" width="40%" style="text-align: left;">
                                            Tahun Pelajaran
                                        </td>
                                        <td width="5%" style="text-align: right;">:</td>
                                        <td width="30%" style="text-align: right;"> '.$year->unit_year_name.' </td>
                                    </tr>
                                </table>
                            </td>
                        
                </tr>
            </table>
                       
              <hr>';
              /* untuk data spiritual dan data nilai  */
              $tb.= '
                  <div class="f12"> A. Sikap</div>
                
                   <div class="f12"> B. Pengetahuan dan Keterampilan</div>
                  <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
                    <thead class="color_b"> 
                         <tr class="f12">
                            <td align="center">No</td>
                            <td  align="center">Mata Pelajaran</td>
                            <td  align="center">KKM</td>
                            <td  align="center">NILAI</td>
                            <td  align="center">RATA - RATA KELAS</td>
                            <td  align="center">KET</td>
                        </tr>
                    </thead>
                    <tbody>';
                        
                        $no = 1; 
                        $total_stu = 0;
                        foreach($course_biasa as $c) 
                       {

                         $list_course = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport_pts as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('cs.course_id',$c->course_id)
                        ->where('k.class_grade_id',$student->student->class_grade_id)
                        ->first();

                        
                        if( ($list_course->total_keterampilan != 0) && ($list_course->total_pengetahuan != 0)  )
                        {
                        // if($list_course->total_keterampilan !)
                            $total_stu = round(  ($list_course->total_pengetahuan+$list_course->total_keterampilan) /2  ) ;        
                            // dump($total_stu);

                           $avg_c = \DB::table('raport_pts as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw('  round ( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                        }
                        else if( $list_course->total_keterampilan != 0 )
                        {
                            $total_stu = round(  $list_course->total_keterampilan  ) ;    
                            $avg_c = \DB::table('raport_pts as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round ( sum ( total_keterampilan ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                        }
                        else if( $list_course->total_pengetahuan != 0 )
                        {   
                            $total_stu = round(  $list_course->total_pengetahuan  ) ;    
                            $avg_c = \DB::table('raport_pts as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round ( sum ( total_pengetahuan  ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                            // print_r($avg_c);
                        }
                        else
                        {
                            $avg_c = 0;
                            $total_stu = 0;
                        }
                        
                       $total_ = (empty($total_stu)) ? 0 : $total_stu;
                       $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;
                       
                        $tb .= '<tr>
                            <td class="f12" align="center"> '.$no.'</td>
                            <td class="f12" align="left"> '.$c->course_name.' </td>
                            <td class="f12"  align="center">  '.$list_course->kkm_value.'</td>
                            <td class="f12"  align="center">  '.$total_.' </td>
                            <td class="f12"  align="center">  '.$avg_.'   </td>
                            <td class="f12"  align="center">';
                            if($total_ >= $list_course->kkm_value)  
                            {
                                $tb.="Tuntas";
                            }  
                            else
                            {
                                $tb.="Belum Tuntas";
                            }
                            $tb.='</td>
                        </tr>';
                            $no++;
                        }

                    $tb .= '<tr class="f12">
                        <td align="center"></td>
                        <td colspan="5">Muatan Lokal</td>
                    </tr>';

                $no_mulok=1; 
                foreach($course_mulok as $c) 
                {

                         $list_course_mulok = \DB::table('course_setting as cs')
                        ->join('m_course as c','c.course_id','cs.course_id')
                        ->join('m_kkm as k','k.course_id','c.course_id')
                        ->join('raport_pts as r','r.course_id','c.course_id')
                        ->where('r.student_id',$student->student->student_id)
                        ->where('r.step_study_id',stepStudyActive())
                        ->where('cs.course_id',$c->course_id)
                        ->where('k.class_grade_id',$student->student->class_grade_id)
                        ->first();
                     
                        

                        if(!empty($list_course_mulok->total_pengetahuan) && !empty($list_course_mulok->total_keterampilan) )
                        {
                            $total_stu = round(  ($list_course_mulok->total_pengetahuan+$list_course_mulok->total_keterampilan) /2  ) ;    

                            $avg_c = \DB::table('raport_pts as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course_mulok->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                        }
                        else if(!empty($list_course_mulok->total_keterampilan))
                        {
                            $total_stu = $list_course_mulok->total_keterampilan;

                            $avg_c = \DB::table('raport_pts as rps')
                             ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round( sum  (total_keterampilan) / count(rps.student_id ) ) as tot'))
                            ->where('course_id',$list_course_mulok->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();  
                        }
                         else if( $list_course->total_pengetahuan != 0 )
                        {   
                            $total_stu = round(  $list_course->total_pengetahuan  ) ;    
                            $avg_c = \DB::table('raport_pts as rps')
                            ->join('m_student as ms','ms.student_id','rps.student_id')
                            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                            ->select(\DB::raw(' round ( sum ( total_pengetahuan  ) / count(rps.student_id ) )  as tot'))
                            ->where('course_id',$list_course->course_id)
                            ->where('msg.study_group_id',$student->study_group_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first();
                            // print_r($avg_c);
                        }
                        $total_ = (empty($total_stu)) ? 0 : $total_stu;
                        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot; 
                        $kkm_val_mulok =  (empty($list_course_mulok->kkm_value)) ? 0 : $list_course_mulok->kkm_value;
                        $tb.=
                        '<tr>
                            <td class="f12" align="center">'.$no_mulok.'</td>
                            <td class="f12" align="left"> '.$c->course_name.' </td>
                            <td class="f12"  align="center">  '.$kkm_val_mulok.' </td>
                            <td class="f12"  align="center"> '. $total_ .' </td>
                            <td class="f12"  align="center"> '. $avg_ .'  </td>
                            <td class="f12"  align="center">';
                            if($total_ >= $kkm_val_mulok)  
                            {
                              $tb.="Tuntas";
                            }   
                            else
                            {
                                $tb.="Belum Tuntas";    
                            }   
                        $tb.='</td>
                        </tr>';
                        $no_mulok++;
                    }

                     $tb.='</tbody>
                  </table>
                    <br/>';


                $tb.='<table width="100%" class="table table-bordered" style="font-size:12px;">

                    <tr>
                        
                        <td  width="50%">
                             <table border="1" cellspacing="0" cellspacing="0"  class="table table-bordered" width="100%" style="font-size:12px;">
                                <tr>
                                    <td class="f12" colspan="2">Ketidakhadiran</td>
                                    <td class="f12" >Jumlah</td>
                                </tr>';
                                $tot= 0;
                                $no = 1;
                                foreach($absensi as $k => $ab)
                                {
                                    $tb.='<tr class="f12">
                                        <td align="left">'.$no.'</td>
                                        <td  align="left">'.$ab->absensi_type.'</td>
                                        <td  align="left"> '.$ab->tot.'  Hari </td>
                                    </tr>';
                                    $tot +=$ab->tot;
                                    $no++;
                                }
                                $tb.='<tr>
                                    <td colspan="2" class="f12">Jumlah</td>
                                    <td class="f12"> '.$tot. '  Hari</td>
                                </tr>
                            </table>
                        </td>';


                        $tb.='<td width="50%" >
                                <table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" width="100%" style="font-size:12px;">
                                    <tr class="f12">
                                        <td      colspan="2"> Kepribadian </td>
                                        <td    > Nilai </td>
                                    </tr>
                                    <tr class="f12">
                                        <td>1</td>
                                        <td    align="left">Kelakuan</td>';
                                        $tb.='<td    align="left">';
                                            if(!empty($kelakuan))  
                                            {
                                                $tb.=$kelakuan->personality_value;
                                            }
                                            else
                                            {
                                                $tb.='';
                                            }
                                        $tb.='</td>
                                    </tr>';
                                    $tb.='<tr class="f12">
                                        <td  >2</td>
                                        <td    align="left">Kerajinan</td>
                                        <td    align="left">';
                                            if(!empty($kerajinan)) 
                                            {
                                                $tb.=$kerajinan->personality_value; 
                                            }
                                            else
                                            {
                                                $tb.="";
                                            }
                                        $tb.='</td>
                                    </tr>';
                                    $tb.='<tr class="f12">
                                        <td  >3</td>
                                        <td    align="left">Kerapihan</td>
                                        <td    align="left">';
                                            if(!empty($kerapihan)) 
                                            {
                                                $tb.=$kerapihan->personality_value;
                                            }
                                            else
                                            {
                                                $tb.="";
                                            }
                                        $tb.='</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="f12"> &nbsp; </td>
                                        <td class="f12">   &nbsp; </td>
                                    </tr>

                                </table>
                        </td>
                    </tr>
                </table>';
                    

                $teacher_ = (empty($teacher_note)) ? "" : $teacher_note->raport_pts;
                 $tb.='<div class="f12"> D.Catatan  </div>
                  <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
                         <tr class="f12">
                            <td align="left">'.$teacher_.'</td>
                        </tr>
                  </table>
                    <br/>';
                 
                  $tb.='<table width="100%" class="table table-bordered" style="font-size:12px;">
                    <tr>
                        <td class="f12" align="center">
                            Mengetahui : 
                            <br>
                            Orang Tua / Wali,
                        </td>
                        <td></td>
                        <td class="f12" align="center">
                            Jakarta, '.toIndonesia($semester->date_pts).'
                            <br>
                            Wali Kelas '.$student->study_group->study_group_name.'
                        </td>
                    </tr>';
                    $tb.='<tr>
                        <td class="f12" align="center">
                            <div style="margin-top:60px">
                                --------------------------
                            </div>
                        </td>
                        <td></td>
                        <td class="f12" align="center">
                            <div style="margin-top:60px">
                                '.$walas->employee->employee_name.'
                            </div>
                        </td>
                    </tr>
                  </table>';
        return ['data_all'=>$tb];
    }      

    public function get_view_ledger(Request $request)
    {
        
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();

        $data_siswa =  
        get_list_student($request->study_group_id);


        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$request->study_group_id)
        ->first();

     
        // dd($walas);
        $course_setting = 
        \DB::table('m_course as c')

        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();
       

        $loop_month = ['S','I','A']; 
        $tb = "";
        $tb.='<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered">
            <thead>
        
                <tr>
                    <th style="font-weight:bold; ">Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; ">'.  $walas->study_group->study_group_name.'</th>
                </tr>
                <tr>
                    <th style="font-weight:bold; ">Wali Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; "> '.  $walas->employee->employee_name .'   </th>
                </tr>
        
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th rowspan ="3" >No</th>
                    <th rowspan ="3" >ID</th>
                    <th rowspan ="3"  style="text-align:center"> Nama </th>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" colspan="3">'.$cs->course_name.'</th>';
                    }
                    $tb.='
                    <th colspan="3" style="text-align:center" rowspan="2">Rata 2</th>
                    <th colspan="2" style="text-align:center" rowspan="2">Sikap</th>
                    <th colspan="3" style="text-align:center" rowspan="2">  Absensi </th>
                    <th colspan="2" style="text-align:center" rowspan="2">  KET </th>
                </tr>
                <tr>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" colspan="3">'.$cs->kkm_value.'</th>';
                    }                    
                $tb.='</tr>
                <tr>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" >KI 3</th>';
                        $tb.='<th style="text-align:center" >KI 4</th>';
                        $tb.='<th style="text-align:center" >NA</th>';
                    }
                    $tb.='<th style="text-align:center" >KI 3</th>
                    <th style="text-align:center" >KI 4</th>
                    <th style="text-align:center" >NA</th> 
                    <th style="text-align:center" >KI 3</th>
                    <th style="text-align:center" >KI 4</th>
                    <th style="text-align:center" >S</th>
                    <th style="text-align:center" >I</th>
                    <th style="text-align:center" >A</th>
                    <th style="text-align:center" >N</th>
                    <th style="text-align:center" >TN</th>
                </tr>
            </thead>
            <tbody>';
                    $no = 1;    
                       $rata2_peng = 0;
                       $rata2_ket = 0;
                       $nilai_naik = [];
                       $count_course = count($course_setting) ;
                
                foreach($data_siswa as $row){
                    $tb.='<tr>   
                        <td>'.$no.'</td>
                        <td>'.$row->student_id.'</td>
                        <td>'.$row->student_name.'</td>';
                        foreach($course_setting as $cs){
                                $k3 = \App\Models\Raport::where('course_id',$cs->course_id)
                                ->where('student_id',$row->student_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first();

                                if(!empty($k3->total_pengetahuan) )
                                {
                                    $na = $na = round ( ($k3->total_pengetahuan  +  $k3->total_keterampilan) / 2 )  ;   
                                    
                                }
                                else if(!empty($k3->total_keterampilan))
                                {
                                    $na = round ( $k3->total_keterampilan ) ;   
                                }
                                else
                                {
                                    $na = 0;
                                }
                                
                                if($na < $cs->kkm_value){
                                    $nilai_naik[$row->student_id][] = $na; 
                                }
                            $tot_peng_ = (!empty($k3->total_pengetahuan)) ? $k3->total_pengetahuan : 0 ;
                            $tot_ket_ = (!empty($k3->total_keterampilan)) ? $k3->total_keterampilan : 0;
                            $tb.='<td  style="text-align:center" >'. $tot_peng_  .'</td>';
                            $tb.='<td  style="text-align:center" > '.  $tot_ket_ .'</td>';
                            $tb.='<td style="text-align:center" > '. $na.' </td>';
                        }
                                    
                        // $k3_tot = \DB::table('raport')->select(\DB::raw('sum(total_pengetahuan) /  count(course_id ) as tot_peng,sum(total_pengetahuan) as sum_peng,count(course_id) as count_course'))->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->first();
                        // $k3_tot_ket = \DB::table('raport')->select(\DB::raw('sum(total_keterampilan) /  count(course_id ) as tot_ket,sum(total_keterampilan) as sum_ket,count(course_id) as count_course'))->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->first();
                         $k3_tot = \DB::table('raport')->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->get();
                     
                         $tot_rata2_peng = 0;
                         $course_tot_peng = 0;
                         $tot_rata2_ket = 0;
                         $course_tot_ket = 0;

                        foreach($k3_tot as $kt)
                        {
                            if($kt->total_pengetahuan > 0)
                            {
                                
                                $tot_rata2_peng  +=$kt->total_pengetahuan;
                                $course_tot_peng++;
                            }
                        }

                        foreach($k3_tot as $kt)
                        {
                            if($kt->total_pengetahuan > 0)
                            {
                                
                                $tot_rata2_ket  +=$kt->total_keterampilan;
                                $course_tot_ket++;
                            }
                        }
                        $t_peng = round($tot_rata2_peng / $course_tot_peng);
                        $t_ket = round($tot_rata2_ket / $course_tot_ket);                        
                        
                        
                            
                        $tb.='<td  style="text-align:center">'.$t_peng .'</td>';
                        $tb.='<td  style="text-align:center">'.$t_ket.'</td>';
                        $tb.='<td style="text-align:center"> '.round ( ($t_peng + $t_ket) / 2 ).' </td>';

                        $ki1 = \DB::select("select count(*) as SB, ( 
                                select count(*)  from observasi o
                                where o.observasi_category = 'spiritual'
                                and observasi_value  = 'PB'
                                and student_id = '".$row->student_id."'   
                            ) as PB , (select count(*)  from observasi o
                                where o.observasi_category = 'spiritual'
                                and observasi_value  = 'B'
                                and student_id = '".$row->student_id."') as B
                        from observasi o
                        where o.observasi_category = 'spiritual'
                        and observasi_value  = 'SB'
                        and student_id = '".$row->student_id."'  
                        ;");
                        $ki2 = \DB::select("select count(*) as SB, ( 
                                select count(*)  from observasi o
                                where o.observasi_category = 'sosial'
                                and observasi_value  = 'PB'
                                and student_id = '".$row->student_id."'   
                            ) as PB , (select count(*)  from observasi o
                                where o.observasi_category = 'sosial'
                                and observasi_value  = 'B'
                                and student_id = '".$row->student_id."') as B
                        from observasi o
                        where o.observasi_category = 'sosial'
                        and observasi_value  = 'SB'
                        and student_id = '".$row->student_id."'  
                        ;");
        
                        
                        $tb.='<td style="text-align:center">';
                                if($ki1[0]->sb >=2)
                                {
                                    $tb.='SB';
                                }
                                else
                                {
                                    $tb.='B';
                                }
                        $tb.='</td>';
                        $tb.='<td style="text-align:center">';
                                if($ki2[0]->sb >=2)
                                {
                                    $tb.='SB';
                                }
                                else
                                {
                                    $tb.='B';
                                }
                        $tb.='</td>';
                                    
                        $absensi_s = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','S')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        $absensi_i = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','I')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        $absensi_a = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','A')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        
                        
                        $tb.='<td style="text-align:center" >'.$absensi_s->tot_absensi.'</td>';
                        $tb.='<td style="text-align:center" >'.$absensi_i->tot_absensi.'</td>';
                        $tb.='<td style="text-align:center" >'.$absensi_a->tot_absensi.'</td>';                  


        
                        foreach($nilai_naik as $key => $nn){
                            if($row->student_id == $key){
                                if( count($nilai_naik[$row->student_id]) == 3  ){
                                    $tb.='<td  style="text-align:center">  </td>
                                    <td  style="text-align:center"> V </td>';
                                }else{
                                    $tb.='<td  style="text-align:center"> V </td>
                                    <td  style="text-align:center">  </td>';
                                }
                            }
                        }
                        $tb.='</tr>';
                    $no++;
                }
        
            $tb.='</tbody>
        </table>';
        return ['data_all'=>$tb];
    }

    public function get_view_ledger_pts(Request $request)
    {
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();

        $data_siswa =  
        get_list_student($request->study_group_id);
        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$request->study_group_id)
        ->first();


        $course_setting = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$request->study_group_id)
        ->where('cg.class_grade_id',$request->class_grade_id)   
        ->where('cd.unit_year_id',$unit_year_id)
        // ->where('kkm.step_study_id',$stepStudyActive)
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->get();


        $loop_month = ['S','I','A']; 
        $tb = "";
        $tb.='<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered">
            <thead>
        
                <tr>
                    <th style="font-weight:bold;background-color:#2196F3;color:#fff ">Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; ">'.  $walas->study_group->study_group_name.'</th>
                </tr>
                <tr>
                    <th style="font-weight:bold; ">Wali Kelas </th>
                    <th style="font-weight:bold; ">:</th>
                    <th style="font-weight:bold; "> '.  $walas->employee->employee_name .'   </th>
                </tr>
        
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th rowspan ="3" >No</th>
                    <th rowspan ="3" >ID</th>
                    <th rowspan ="3"  style="text-align:center"> Nama </th>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" colspan="3">'.$cs->course_name.'</th>';
                    }
                    $tb.='
                    <th colspan="3" style="text-align:center" rowspan="2">Rata 2</th>
                    <th colspan="2" style="text-align:center" rowspan="2">Sikap</th>
                    <th colspan="3" style="text-align:center" rowspan="2">  Absensi </th>
                    <th colspan="2" style="text-align:center" rowspan="2">  KET </th>
                </tr>
                <tr>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" colspan="3">'.$cs->kkm_value.'</th>';
                    }                    
                $tb.='</tr>
                <tr>';
                    foreach($course_setting as $cs){
                        $tb.='<th style="text-align:center" >KI 3</th>';
                        $tb.='<th style="text-align:center" >KI 4</th>';
                        $tb.='<th style="text-align:center" >NA</th>';
                    }
                    $tb.='<th style="text-align:center" >KI 3</th>
                    <th style="text-align:center" >KI 4</th>
                    <th style="text-align:center" >NA</th> 
                    <th style="text-align:center" >KI 3</th>
                    <th style="text-align:center" >KI 4</th>
                    <th style="text-align:center" >S</th>
                    <th style="text-align:center" >I</th>
                    <th style="text-align:center" >A</th>
                    <th style="text-align:center" >N</th>
                    <th style="text-align:center" >TN</th>
                </tr>
            </thead>
            <tbody>';
                    $no = 1;    
                       $rata2_peng = 0;
                       $rata2_ket = 0;
                       $nilai_naik = [];
                       $count_course = count($course_setting) ;
                
                foreach($data_siswa as $row){
                    $tb.='<tr>   
                        <td>'.$no.'</td>
                        <td>'.$row->student_id.'</td>
                        <td>'.$row->student_name.'</td>';
                        foreach($course_setting as $cs){
                                $k3 = \App\Models\Raport_pts::where('course_id',$cs->course_id)
                                ->where('student_id',$row->student_id)
                                ->where('step_study_id',stepStudyActive())
                                ->first();

                                // if(!empty($k3->total_keterampilan))
                                // {   
                                //     $na = round ( $k3->total_keterampilan ) ;   
                                // }
                                // else if(!empty($k3->total_pengetahuan) && !empty($k3->total_keterampilan))
                                // {
                                //     $na =round ( ($k3->total_pengetahuan  +  $k3->total_keterampilan) / 2 )  ;   
                                // }
                                // else
                                // {
                                //     $na = 0;
                                // }

                                if(!empty($k3->total_pengetahuan) )
                                {
                                    if(empty($k3->total_keterampilan))
                                    {
                                        $na =  round($k3->total_pengetahuan)  ;   
                                    }   
                                    else
                                    {
                                        $na =  round ( ($k3->total_pengetahuan  +  $k3->total_keterampilan) / 2 )  ;   
                                    }                                 
                                }
                                else if(!empty($k3->total_keterampilan))
                                {
                                    $na = round ( $k3->total_keterampilan ) ;   
                                }
                                else
                                {
                                    $na = 0;
                                }
                                
                                
                                if($na < $cs->kkm_value){
                                    $nilai_naik[$row->student_id][] = $na; 
                                }
                            $tot_peng_ = (!empty($k3->total_pengetahuan)) ? $k3->total_pengetahuan : 0 ;
                            $tot_ket_ = (!empty($k3->total_keterampilan)) ? $k3->total_keterampilan : 0;
                            $tb.='<td  style="text-align:center" >'. $tot_peng_  .'</td>';
                            $tb.='<td  style="text-align:center" > '.  $tot_ket_ .'</td>';
                            $tb.='<td style="text-align:center" > '. $na.' </td>';
                        }
                                    
                            // $k3_tot = \DB::table('raport_pts')->select(\DB::raw('sum(total_pengetahuan) /  count(course_id ) as tot_peng,sum(total_pengetahuan) as sum_peng,count(course_id) as count_course'))->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->first();
                            // $k3_tot_ket = \DB::table('raport_pts')->select(\DB::raw('sum(total_keterampilan) /  count(course_id ) as tot_ket,sum(total_keterampilan) as sum_ket,count(course_id) as count_course'))->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->first();
                            $k3_tot = \DB::table('raport_pts')->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->get();

                            // dump($k3_tot->tot_peng);
                            // dump($k3_tot_ket->tot_ket);
                            // dd($k3_tot_ket->sum_ket);
                            $tot_rata2_peng = 0;
                             $course_tot_peng = 0;
                             $tot_rata2_ket = 0;
                             $course_tot_ket = 0;

                            foreach($k3_tot as $kt)
                            {
                                if($kt->total_pengetahuan > 0)
                                {
                                    
                                    $tot_rata2_peng  +=$kt->total_pengetahuan;
                                    $course_tot_peng++;
                                }
                            }

                            foreach($k3_tot as $kt)
                            {
                                if($kt->total_pengetahuan > 0)
                                {
                                    
                                    $tot_rata2_ket  +=$kt->total_keterampilan;
                                    $course_tot_ket++;
                                }
                            }
                            $t_peng = round($tot_rata2_peng / $course_tot_peng);
                            $t_ket = round($tot_rata2_ket / $course_tot_ket);                        
                            // dump($tot_rata2_ket);
                            // dump($course_tot_ket);

                        // $tb.='<td  style="text-align:center">'.$k3_tot->tot_peng.'</td>';
                        // $tb.='<td  style="text-align:center">'.$k3_tot_ket->tot_ket.'</td>';
                        // $tb.='<td style="text-align:center"> '.round(($k3_tot->tot_peng + $k3_tot_ket->tot_ket) / 2 ).' </td>';


                        $tb.='<td  style="text-align:center">'.$t_peng .'</td>';
                        $tb.='<td  style="text-align:center">'.$t_ket.'</td>';
                        $tb.='<td style="text-align:center"> '.round ( ($t_peng + $t_ket) / 2 ).'</td>';


                        $ki1 = \DB::select("select count(*) as SB, ( 
                                select count(*)  from observasi o
                                where o.observasi_category = 'spiritual'
                                and observasi_value  = 'PB'
                                and student_id = '".$row->student_id."'   
                            ) as PB , (select count(*)  from observasi o
                                where o.observasi_category = 'spiritual'
                                and observasi_value  = 'B'
                                and student_id = '".$row->student_id."') as B
                        from observasi o
                        where o.observasi_category = 'spiritual'
                        and observasi_value  = 'SB'
                        and student_id = '".$row->student_id."'  
                        ;");
                        $ki2 = \DB::select("select count(*) as SB, ( 
                                select count(*)  from observasi o
                                where o.observasi_category = 'sosial'
                                and observasi_value  = 'PB'
                                and student_id = '".$row->student_id."'   
                            ) as PB , (select count(*)  from observasi o
                                where o.observasi_category = 'sosial'
                                and observasi_value  = 'B'
                                and student_id = '".$row->student_id."') as B
                        from observasi o
                        where o.observasi_category = 'sosial'
                        and observasi_value  = 'SB'
                        and student_id = '".$row->student_id."'  
                        ;");
        
                        
                        $tb.='<td style="text-align:center">';
                                if($ki1[0]->sb >=2)
                                {
                                    $tb.='SB';
                                }
                                else
                                {
                                    $tb.='B';
                                }
                        $tb.='</td>';
                        $tb.='<td style="text-align:center">';
                                if($ki2[0]->sb >=2)
                                {
                                    $tb.='SB';
                                }
                                else
                                {
                                    $tb.='B';
                                }
                        $tb.='</td>';
                                    
                        $absensi_s = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','S')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        $absensi_i = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','I')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        $absensi_a = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
                        ->where('student_id',$row->student_id)
                        ->where('absensi_type','A')
                        ->where('step_study_id',stepStudyActive())
                        ->first();
                        
                        
                        $tb.='<td style="text-align:center" >'.$absensi_s->tot_absensi.'</td>';
                        $tb.='<td style="text-align:center" >'.$absensi_i->tot_absensi.'</td>';
                        $tb.='<td style="text-align:center" >'.$absensi_a->tot_absensi.'</td>';                  
        
                        foreach($nilai_naik as $key => $nn){
                            if($row->student_id == $key){
                                if( count($nilai_naik[$row->student_id]) == 3  ){
                                    $tb.='<td  style="text-align:center">  </td>
                                    <td  style="text-align:center"> V </td>';
                                }else{
                                    $tb.='<td  style="text-align:center"> V </td>
                                    <td  style="text-align:center">  </td>';
                                }
                            }
                        }
                        $tb.='</tr>';
                    $no++;
                }
        
            $tb.='</tbody>
        </table>';
        return ['data_all'=>$tb];

    }

   


}
