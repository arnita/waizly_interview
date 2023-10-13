<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Barryvdh\DomPDF\Facade as PDF;


class PrintRaport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $detail;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($detail)
    {
        //
        $this->detail = $detail;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
        // print_r($detail);exit();
        // $pdf = PDF::
        // setOptions([
        //     'logOutputFile' => storage_path('tmp')."log.htm",
        //     'tempDir' => storage_path('tmp'),
        //     'isRemoteEnabled'=> TRUE,
        //     'isHtml5ParserEnabled'=> TRUE
        // ])->
        // loadView('pdf.print_raport', $detail);
        // $pdf->getDomPDF()->setHttpContext(
        //     stream_context_create([
        //         'ssl' => [
        //             'allow_self_signed'=> TRUE,
        //             'verify_peer' => FALSE,
        //             'verify_peer_name' => FALSE,
        //         ]
        //     ])
        // );
        // $pdf->save($path);
        
        response()->json('asem');
        // return $pdf->download($path);
    }
}
