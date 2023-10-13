<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class AnalysisUAS implements FromView
{
   	public function __construct(string $study_group_id,string $class_grade_id,string $course_id)
    {
        $this->study_group_id = $study_group_id;
        $this->class_grade_id = $class_grade_id;
        $this->course_id = $course_id;
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
        $data_siswa =  get_list_student($this->study_group_id);

        // \App\Models\Study_group_setting::with(['student','study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();


        $stepStudyActive = stepStudyActive();
        $data_bobot =  
        // \DB::table('m_course as z')
        // ->join('m_kd as a','a.course_id','z.course_id')
        // ->join('quiz_per_kd as b','b.kd_id','a.kd_id')
        // ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        // ->where('b.type_question','uas')
        // ->where('b.step_study_id',$stepStudyActive)
        // ->orderBy('c.number_question','asc')
        // ->get();
        

        //   \DB::table('m_kd as a')
        // ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        // ->join('m_course as mc','mc.course_id','z.course_id')
        // ->join('quiz_per_kd as b','b.kd_id','a.kd_id')
        // ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        // ->where('b.type_question','uas')
        // ->where('b.step_study_id',$stepStudyActive)
        // ->orderBy('c.number_question','asc')
        // ->get();

          \DB::table('m_kd as a')
        ->join('course_setting as z','z.course_setting_id','a.course_setting_id')
        ->join('m_course as mc','mc.course_id','z.course_id')
        ->join('quiz_per_kd as b','b.kd_id','a.kd_id')
        ->join('list_question_per_kd as c','c.quiz_per_kd_id','b.quiz_per_kd_id')
        ->where('b.type_question','uas')
        ->where('z.course_id',$this->course_id)
        ->where('z.class_grade_id',$this->class_grade_id)
        ->where('b.step_study_id',$stepStudyActive)
        ->orderBy('c.number_question','asc')
        ->get();

        // dd($data_bobot);
        // dd('asem');

        if(count($data_bobot) == 0)
        {
            dd("Soal Belum Dibuat");
        }

         $data = ['data_siswa'=>$data_siswa,'data_bobot'=>$data_bobot,'walas'=>$walas];
        return view('excel.analysis_uas', [
                'data' => $data
        ]);


		
	}	
}
