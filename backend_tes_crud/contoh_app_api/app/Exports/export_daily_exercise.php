<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class export_daily_exercise implements FromView
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

        //  \App\Models\Study_group_setting::with(['student','study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();


        $structure_tematic = \App\Models\Structure_tematic::where('class_grade_id',$this->class_grade_id)
        ->where('step_study_id',$stepStudyActive)
        ->get();

        $dt_k =  \DB::table('m_kd  as a')
        ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->where('c.class_grade_id',$this->class_grade_id)
        ->where('step_study_id',$stepStudyActive)
        ->where('c.course_id',$this->course_id)
        ->where('kd_type',$this->kd_type);

        $tot_d = count($dt_k->get());


        $data_kd2 = 
        \DB::table('m_kd  as a')
        ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->where('step_study_id',$stepStudyActive)
        ->where('c.class_grade_id',$this->class_grade_id)
        ->where('c.course_id',$this->course_id)
        ->where('kd_type',$this->kd_type)
        ->orderBy('a.kd_id','asc')
        // ->take($tot_d-1)
        ->get();



        // $data_kd1 = 
        // \DB::table('m_kd  as a')
        // ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        // ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        // ->where('step_study_id',$stepStudyActive)
        // ->where('c.course_id',$this->course_id)
        // ->where('kd_type',$this->kd_type)
        // ->orderBy('a.kd_id','asc')->take(1)->get()
        // ;

        // $data_kd2 = 
        // \DB::table('m_kd  as a')
        // ->join('m_kd_detail as b','a.kd_id','b.kd_id')
        // ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        // ->where('step_study_id',$stepStudyActive)
        // ->where('c.course_id',$this->course_id)
        // ->where('kd_type',$this->kd_type)
        // ->orderBy('a.kd_id','desc')
        // ->take($tot_d-1)->get();

   
        if(empty($walas)){
            dd("silahkan tetapkan dahulu wali kelas");
        }

        $data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'structure_tematic'=>$structure_tematic,'data_kd2'=>$data_kd2,'tot_d'=>$tot_d];
        
        
        return view('excel.export_daily', [
                'data' => $data]);      
    }   
}
