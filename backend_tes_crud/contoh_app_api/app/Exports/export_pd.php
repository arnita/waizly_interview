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


class export_pd implements FromView,ShouldAutoSize, WithEvents
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
            

         $category =  \App\Models\Parlookup::where('category','ekstrakurikuler')
        ->get();

        $spiritual=  \App\Models\Parlookup::where('category','spiritual')->get();

        $sosial =  \App\Models\Parlookup::where('category','sosial')->get();

        $tot_hf = gen_abjad ( (count($spiritual) + count($sosial) + 3) * 2 ) ;
        

        $data_ex = count($data_siswa) + 5;


        return [
            AfterSheet::class    => function(AfterSheet $event) use ($data_ex,$tot_hf) {

                    $event->sheet->getStyle('A4:'.$tot_hf.$data_ex.'')->applyFromArray([
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

        $data_siswa =  get_list_student($this->study_group_id);

        // \App\Models\Study_group_setting::with(['student','study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();

		  $data = ['data_siswa'=>$data_siswa,'walas'=>$walas];

		
		  return view('excel.export_pd', [
           	 	'data' => $data]);		
	}	
}
