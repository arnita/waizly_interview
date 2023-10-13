<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\BeforeExport;
use Maatwebsite\Excel\Events\AfterSheet;
Use \Maatwebsite\Excel\Sheet;


class export_absensi implements FromView, ShouldAutoSize, WithEvents
{
	public function __construct(string $study_group_id)
    {
        $this->study_group_id = $study_group_id;
    }


   use Exportable;
    public function registerEvents(): array
    {
       $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();
          $data_siswa =  \App\Models\Study_group_setting::with(['student','study_group'])
        ->where('study_group_id',$this->study_group_id)
        ->where('unit_year_id',$unit_year_id)->get();
            
        $data_ex = count($data_siswa) + 6;


        return [
            AfterSheet::class    => function(AfterSheet $event) use ($data_ex) {

                    $event->sheet->getStyle('A4:AZ'.$data_ex)->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => '000000'],
                        ],
                    ],
                ]);
            },
        ];
    }

	public function view(): View
	{
        $unit_year_id = yearActive();
        $stepStudyActive = stepStudyActive();

        $data_siswa =  


        // \App\Models\Study_group_setting::with(['student'=>function($q){
        //         $q->orderBy('student_name','ASC');
        //     }
        // ,'study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)
        \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$this->study_group_id)
        ->where('unit_year_id',$unit_year_id)
        ->orderBy('a.student_name','ASC')
        ->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();

        $unit_year_id = yearActive();
        $year =  \App\Models\M_step_study::where('unit_year_id',$unit_year_id)
        // ->selectRaw(" extract(month from step_study_start ) as start, extract(month from step_study_end ) as end  "
        ->where('step_study_status','active')
        ->first();

        $month=[];
        $start = strtotime($year->step_study_start);
        $end = strtotime($year->step_study_end);
        while($start < $end)
        {
            // echo date('m Y', $start) . '<br>';
            $month[] = (int)date('m',$start);
            $start = strtotime("+1 month", $start);
        }

        

        // for($i = $year->start ; $i <= $year->end ; $i++)
        // {
        //     $month [] = (int)$i;
        // }

 

		  $data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'month'=>$month];

		
		  return view('excel.export_absensi', [
           	 	'data' => $data]);		
	}	
}
