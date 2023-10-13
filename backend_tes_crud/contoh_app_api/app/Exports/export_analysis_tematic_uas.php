<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Contracts\View\View;

class export_analysis_tematic_uas implements FromView
{
    public function __construct(string $study_group_id,string $structure_tematic_id)
    {
        $this->study_group_id = $study_group_id;
        $this->structure_tematic_id = $structure_tematic_id;
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
        $data_siswa =
        get_list_student($this->study_group_id);
        // \App\Models\Study_group_setting::with(['student','study_group'])
        // ->where('study_group_id',$this->study_group_id)
        // ->where('unit_year_id',$unit_year_id)->get();

        $walas = \App\Models\Class_advisor::with(['study_group','employee'])
        ->where('study_group_id',$this->study_group_id)
        ->first();

      
      	$data_bobot_val = \DB::table('structure_tematic as a')
        ->select('c.number_question','c.quality_question','a.structure_tematic_name','a.structure_tematic_id','b.kd_id','d.kd_code')
      	->join('structure_tematic_detail as b','a.structure_tematic_id','b.structure_tematic_id')
      	->join('list_question_per_tema as c','c.structure_tematic_detail_id','b.structure_tematic_detail_id')
        ->join('m_kd as d','d.kd_id','b.kd_id')
      	->where('a.structure_tematic_id',$this->structure_tematic_id)
      	->where('b.type_question','uas')
      	->whereNotNull('number_question')
      	->orderBy('number_question','asc')
      	->get();


        
        $total = 0;
        foreach ($data_bobot_val as $list) 
        {
            $total += $list->quality_question;
        }

      	$data_tema = \App\Models\Structure_tematic::find($this->structure_tematic_id);


		  $data = ['data_siswa'=>$data_siswa,'walas'=>$walas,'data_bobot_val'=>$data_bobot_val,'data_tema'=>$data_tema,'total_bobot'=>$total];

		
		  return view('excel.export_analysis_tematic_uas', [
           	 	'data' => $data]);

		
	}	
}
