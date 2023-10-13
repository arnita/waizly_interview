<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class download_summary_value implements FromView
{
	public function __construct(string $study_group_id,string $course_id,string $class_grade_id)
    {
        $this->study_group_id = $study_group_id;
        $this->course_id = $course_id;
        $this->class_grade_id = $class_grade_id;
    }


   use Exportable;
    public function registerEvents(): array
    {
        return [
            BeforeExport::class  => function(BeforeExport $event) {
                $event->writer->setCreator('Patrick');
            },
            AfterSheet::class    => function(AfterSheet $event) {
                $event->sheet->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);

                $event->sheet->styleCells(
                    'B2:G8',
                    [
                        'borders' => [
                            'outline' => [
                                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                                'color' => ['argb' => 'FFFF0000'],
                            ],
                        ]
                    ]
                );
            },
        ];
    }

	public function view(): View
	{
        
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();

        $data_siswa = \DB::table('study_group_setting as a')
        ->join('m_student as b','b.student_id','a.student_id')
        ->join('m_study_group as c','c.study_group_id','a.study_group_id')
        ->join('m_class_grade as d','d.class_grade_id','c.class_grade_id')
        ->where('b.class_grade_id',$this->class_grade_id)
        ->where('a.study_group_id',$this->study_group_id)
        ->where('a.unit_year_id',$unit_year_id)
        ->orderBy('b.student_name','ASC')
        ->get();


        $study_group = \App\Models\M_study_group::with('class_grade')->where('study_group_id',$this->study_group_id)->first();


        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();


     


        $cek_tematic = 
        \DB::table('structure_tematic as st')
        ->join('structure_tematic_detail as std','st.structure_tematic_id','std.structure_tematic_id')
        ->join('m_kd as k','std.kd_id','k.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','k.course_setting_id')
        ->join('m_course as c','cd.course_id','c.course_id')
        ->where('c.course_id',$this->course_id)
        ->first();





        $course_setting_pengetahuan = 
        \DB::table('m_kd as mk')
        ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
        ->join('m_course as c','c.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$this->study_group_id)
        ->where('c.course_id',$this->course_id)
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('md.step_study_id',$stepStudyActive)
        ->where('kd_type','Pengetahuan')
        ->get();

        $course_setting_keterampilan = 
        \DB::table('m_kd as mk')
        ->join('m_kd_detail as md','mk.kd_id','md.kd_id')
        ->join('course_setting as cd','cd.course_setting_id','mk.course_setting_id')
        ->join('m_course as c','c.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$this->study_group_id)
        ->where('c.course_id',$this->course_id)
        ->where('cd.unit_year_id',$unit_year_id)
        ->where('md.step_study_id',$stepStudyActive)
        ->where('kd_type','Keterampilan')
        ->get();



		$data = ['study_group'=>$study_group,'data_siswa'=>$data_siswa,'walas'=>$walas,'course_setting_pengetahuan'=>$course_setting_pengetahuan,'course_setting_keterampilan'=>$course_setting_keterampilan];

		
        if(!empty($cek_tematic))
        {
        	return view('excel.download_summary_value_tematic', ['data' => $data]);		
        }
        else
        {
        	return view('excel.download_summary_value', ['data' => $data]);			
        }

		
	}	
}
