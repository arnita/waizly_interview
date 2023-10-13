<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class download_ledger implements FromView
{
	public function __construct(string $study_group_id,string $class_grade_id)
    {
        $this->study_group_id = $study_group_id;
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

        $data_siswa = get_list_student($this->study_group_id);


        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();

        $course_setting = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$this->study_group_id)
        ->where('cg.class_grade_id',$this->class_grade_id)  
        ->where('cd.unit_year_id',$unit_year_id)
        // ->where('kkm.step_study_id',$stepStudyActive)
        ->where('kkm.class_grade_id',$this->class_grade_id)
        ->get();


        $data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'course_setting'=>$course_setting];

        
        
        return view('excel.download_ledger_pas', ['data' => $data]);            

		
	}	
}
