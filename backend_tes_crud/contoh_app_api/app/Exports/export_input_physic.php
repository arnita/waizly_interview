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

class export_input_physic implements FromView, ShouldAutoSize, WithEvents
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
            
        $data_ex = count($data_siswa) + 5;


        return [
            AfterSheet::class    => function(AfterSheet $event) use ($data_ex) {

                    $event->sheet->getStyle('A4:J'.$data_ex)->applyFromArray([
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


    	 $fisik =  \App\Models\Parlookup::where('category','Fisik')
        ->get();


        $kesehatan =  \App\Models\Parlookup::where('category','Kesehatan')
        ->get();

 

		  $data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'kesehatan'=>$kesehatan,'fisik'=>$fisik];

		
		  return view('excel.export_input_physic', [
           	 	'data' => $data]);		
	}	
}
