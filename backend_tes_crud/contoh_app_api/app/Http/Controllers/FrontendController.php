<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Http\Controllers\ApiController;
use App\Exports\AnalysisDaily;
use App\Exports\AnalysisUTS;
use App\Exports\AnalysisUAS;
use App\Exports\export_analysis_tematic_daily;
use App\Exports\export_analysis_tematic_uts;
use App\Exports\export_analysis_tematic_uas;
use App\Exports\export_absensi;
use App\Exports\export_input_physic;
use App\Exports\export_extracurricular;
use App\Exports\export_observasi;
use App\Exports\export_friendly_value;
use App\Exports\export_pd;
use App\Exports\export_tahfizh;
use App\Exports\export_tahsin;
use App\Exports\export_personality;
use App\Exports\export_daily_exercise;
use App\Exports\export_daily_exercise_skill;
use App\Exports\export_teacher_note;
use App\Exports\export_prestation;
use App\Exports\download_summary_value;
use App\Exports\download_ledger;
use App\Exports\download_ledger_pts;
use App\Exports\export_employee;
use App\Exports\export_student;
use App\Exports\export_kd;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade as PDF;



class FrontendController extends Controller
{

    public function index()
    {
        return view('layouts.app');
    }

    public function export_input_analysis(Request $request)
    {
        
        // dd($request->all());
        $kd = 
          \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_course as mc','mc.course_id','z.course_id')
        ->join('m_class_grade as mcg','mcg.class_grade_id','z.class_grade_id')
        ->where('kd_id',$request->kd_id)->first();

        $study_group =  \DB::table('m_study_group')->where('study_group_id',$request->study_group_id)->first();


        $course = explode('/', $kd->course_name);

        $course_name = (count($course) > 0) ? $course[0] : $kd->course_name;
        
    	return Excel::download(new AnalysisDaily( $request->study_group_id,$request->kd_id,$request->class_grade_id ),'Input_analysis_non_tema_harian_'.$study_group->study_group_name.'_'.$course_name.'.xlsx');
    }

    public function export_input_analysis_uts(Request $request)
    {
        
        $kd = 
          \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_course as mc','mc.course_id','z.course_id')
        ->join('m_class_grade as mcg','mcg.class_grade_id','z.class_grade_id')
        ->where('mc.course_id',$request->course_id)->first();
        $study_group =  \DB::table('m_study_group')->where('study_group_id',$request->study_group_id)->first();
        // dd($study_group);

        $course = explode('/', $kd->course_name);

        $course_name = (count($course) > 0) ? $course[0] : $kd->course_name;
        // dd($course_name);
        return Excel::download(new AnalysisUTS( $request->study_group_id,$request->class_grade_id,$request->course_id ),'Input_analysis_non_tema_uts_'.$study_group->study_group_name.'_'.$course_name.'.xlsx');
    }


    public function export_input_analysis_uas(Request $request)
    {

        $kd = 
          \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_course as mc','mc.course_id','z.course_id')
        ->join('m_class_grade as mcg','mcg.class_grade_id','z.class_grade_id')
        ->where('mc.course_id',$request->course_id)->first();
        $study_group =  \DB::table('m_study_group')->where('study_group_id',$request->study_group_id)->first();


        $course = explode('/', $kd->course_name);

        $course_name = (count($course) > 0) ? $course[0] : $kd->course_name;
        return Excel::download(new AnalysisUAS( $request->study_group_id,$request->class_grade_id,$request->course_id ),'Input_analysis_non_tema_uas_'.$study_group->study_group_name.'_'.$course_name.'.xlsx');
    }


    public function export_analysis_tematic_daily(Request $request)
    {
    	return Excel::download(new export_analysis_tematic_daily( $request->study_group_id,$request->structure_tematic_id),date('YmdHis').'_Input_analysis_tematik_harian.xlsx');
    }


    public function export_absensi(Request $request)
    {
        return Excel::download(new export_absensi( $request->study_group_id),date('YmdHis').'_Input_absensi.xlsx');
    }

    public function export_extracurricular(Request $request)
    {
        return Excel::download(new export_extracurricular( $request->study_group_id),date('YmdHis').'_Input_ekstrakurikular.xlsx');
    }


    public function export_prestation(Request $request)
    {
        return Excel::download(new export_prestation( $request->study_group_id),date('YmdHis').'_Input_prestasi.xlsx');
    }

    public function export_teacher_note(Request $request)
    {
        return Excel::download(new export_teacher_note( $request->study_group_id),date('YmdHis').'_Input_catatan_guru.xlsx');
    }

    public function export_observasi(Request $request)
    {
        return Excel::download(new export_observasi( $request->study_group_id),date('YmdHis').'_Input_observasi.xlsx');
    }

    public function export_friendly_value(Request $request)
    {
        return Excel::download(new export_friendly_value( $request->study_group_id),date('YmdHis').'_Input_friendly_value.xlsx');
    }

    public function export_daily_exercise(Request $request)
    {
        
        return Excel::download(new export_daily_exercise( $request->study_group_id,$request->class_grade_id),date('YmdHis').'_Input_ulangan_harian_pengetahuan.xlsx');
    }


    public function export_daily_exercise_skill(Request $request)
    {
        $course = \App\Models\M_course::where('course_id',$request->course_id)->first();
        $cr='';
        if(empty($course->course_desc))
        {
            $cr = $course->course_name;
        }
        else
        {
            $cr = $course->course_desc;
        }
        return Excel::download(new export_daily_exercise_skill( $request->study_group_id,$request->class_grade_id),date('YmdHis').'_Input_ulangan_harian_keterampilan - '.$cr.'.xlsx');
    }

    public function export_pd(Request $request)
    {
        return Excel::download(new export_pd( $request->study_group_id),date('YmdHis').'_Input_penilaian_diri_sendiri.xlsx');
    }

    public function export_tahsin(Request $request)
    {
        return Excel::download(new export_tahsin( $request->study_group_id),date('YmdHis').'_Input_penilaian_tahsin.xlsx');
    }

    public function export_tahfizh(Request $request)
    {
        return Excel::download(new export_tahfizh( $request->study_group_id),date('YmdHis').'_Input_penilaian_tahfizh.xlsx');
    }


    public function export_personality(Request $request)
    {
        
        return Excel::download(new export_personality( $request->study_group_id),date('YmdHis').'_Input_penilaian_personality.xlsx');
    }

    public function export_analysis_tematic_uts(Request $request)
    {
        return Excel::download(new export_analysis_tematic_uts( $request->study_group_id,$request->structure_tematic_id),date('YmdHis').'_Input_analysis_tematik_uts.xlsx');
    }  


    public function export_input_physic(Request $request)
    {
        return Excel::download(new export_input_physic( $request->study_group_id),date('YmdHis').'_Input_physic.xlsx');
    }  

    public function export_analysis_tematic_uas(Request $request)
    {
        return Excel::download(new export_analysis_tematic_uas( $request->study_group_id,$request->structure_tematic_id),date('YmdHis').'_Input_analysis_tematik_uas.xlsx');
    }

    public function export_employee(Request $request)
    {
        return Excel::download(new export_employee(),date('YmdHis').'_Input_employee.xlsx');
    }

    public function export_student(Request $request)
    {
        return Excel::download(new export_student(),date('YmdHis').'_Input_student.xlsx');
    }

    public function export_kd(Request $request)
    {
        return Excel::download(new export_kd(),date('YmdHis').'_Input_Kd.xlsx');
    }

    public function download_summary_value(Request $request)
    {
        return Excel::download(new download_summary_value( $request->study_group_id,$request->course_id,$request->class_grade_id),date('YmdHis').'_download_rekap.xlsx');
    }

    public function download_ledger(Request $request)
    {
        return Excel::download(new download_ledger( $request->study_group_id,$request->class_grade_id),date('YmdHis').'_download_ledger.xlsx');
    }

    public function download_ledger_pts(Request $request)
    {
        return Excel::download(new download_ledger_pts( $request->study_group_id,$request->class_grade_id),date('YmdHis').'_download_ledger_pts.xlsx');
    }

    public function print_raport_pas(Request $request)
    {

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
        // ->where('kkm.step_study_id',stepStudyActive())
        ->where('course_type','biasa')
        ->where('kkm.class_grade_id',$request->class_grade_id)
        ->orderBy('c.course_id','desc')
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

        $path = public_path() . '/raport/raport_'.'RAPORT-'.$data['student']->student->student_name.'.pdf';
        $fileName = 'RAPORT-'.$data['student']->student->student_name.'.pdf';

        $pdf = PDF::
        setOptions([
            'logOutputFile' => storage_path('tmp')."log.htm",
            'tempDir' => storage_path('tmp'),
             'isRemoteEnabled'=> TRUE,
            'isHtml5ParserEnabled'=> TRUE
        ])->loadView('pdf.print_raport_pts', $data);
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
        return $pdf->download($fileName);
    }
}
