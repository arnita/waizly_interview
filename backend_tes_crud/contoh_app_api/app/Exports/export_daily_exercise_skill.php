<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class export_daily_exercise_skill implements FromView
{
	public function __construct(string $study_group_id,string $class_grade_id)
    {
        $this->study_group_id = $study_group_id;
        $this->class_grade_id = $class_grade_id;
        $this->course_id = $_GET['course_id'];
        $this->kd_type = $_GET['kd_type'];
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

        $data_siswa =  
        get_list_student($this->study_group_id);
        // \App\Models\Study_group_setting::with(['student','study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();


        $structure_tematic = \App\Models\Structure_tematic::where('study_group_id',$this->study_group_id)
        ->where('step_study_id',$stepStudyActive)
        ->get();

		//  $dt_k =  \DB::table('m_kd  as a')
        // ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        // ->join('m_course as c','c.course_id','a.course_id')
        // ->where('step_study_id',$stepStudyActive)
        // ->where('a.course_id',$this->course_id)
        // ->where('kd_type',$this->kd_type)->get();

        $dt_k = \DB::table('m_kd as a')
        ->join('m_kd_detail as b','b.kd_id','=','a.kd_id')
        // ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as d','d.course_id','c.course_id')
        // ->join('m_study_group as e','e.study_group_id','c.study_group_id')
        // ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
        ->where('c.class_grade_id',$this->class_grade_id)
        ->where('step_study_id',$stepStudyActive)
        ->where('c.course_id',$this->course_id)
        ->where('kd_type',$this->kd_type)->get();

		$data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'structure_tematic'=>$structure_tematic,'dt_k'=>$dt_k];
		
		return view('excel.export_daily_exercise_skill', [
           	 	'data' => $data]);		
	}	
}
