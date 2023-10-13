<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title> Cetak Raport </title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php  echo public_path().'/assets/css/bootstrap-theme.min.css' ?>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   
       
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

    <style type="text/css">
        
        * {
            font-family: Roboto,  sans-serif;
            font-size: x-small;
    
        }
        div{
            margin:0;
            padding:0;
        }
        .page-break {
            page-break-after: always;
        }
        h1,h2,h3,h4,h5,h6{
 
            margin: 0; 
            padding: 0; 
            border: 0; 
        }
        .f14{
            font-size: 14px;
        }
        .f12{
            font-size: 12px;
        }
        .f10{
            font-size: 10px;
        }
        .f11{
            font-size: 11px;
        }
        .normal{
            font-weight: normal;
        }
        tr,td,th{
            padding :5px;
            margin :5px;
        }
        .color_b {
            background-color: #B0C4DE
        }
        .bold{
            font-weight: bold;
        }
        .clear_column{
            padding :0px;
            margin :0px;
        }
        
    </style>
</head>

<body style="background-color: #fff">

  <table width="100%">
    <tr>
        <td width="10%"><img src="{{ url('/logo2.png') }}" width="100" height="100"></td>
        <td style="text-align: left"  width="80%">
           <h5 style="text-align: center;">             RAPORT PESERTA DIDIK DAN PROFIL PESERTA DIDIK </h5>
           <h5 style="text-align: center;">             {{$unit->unit_name}}  </h5>
           <h5 style="text-align: center;">             {{$unit->unit_address}} </h5>
        </td>
        <td width="10%">
            
        </td>
    </tr>
  </table>

  <table cellspacing="0" cellpadding="0" width="100%" >
    <tr>
            <td width="50%" class="f12"  >
                <table    width="100%" cellpadding="0" cellspacing="0"> 
                    <tr class="clear_column" >
                        <td class="f12 clear_column" width="40%"   >
                        Nama Peserta Didik 
                        </td>
                        <td width="5%" class="clear_column">:</td>
                        <td width="55%" class="clear_column">{{$student->student->student_name}}</td>
                    </tr>
                    <tr  >
                        <td class="f12 clear_column" width="40%" >
                             Kelas 
                        </td>
                        <td width="5%" class="clear_column">:</td>
                        <td width="55%" class="clear_column"> {{$student->study_group->study_group_name}} </td>
                    </tr>

                    <tr  >
                        <td class="f12 clear_column" width="40%" >
                        
                        </td>
                        <td width="5%" class="clear_column"></td>
                        <td width="55%" class="clear_column">   </td>
                    </tr>
                </table>
            </td>
            
                <td  width="50%" class="f12" style="margin: 0px;padding-left: 90px;">
                <table     width="100%" cellpadding="0" cellspacing="0" border="0"> 
                        <tr>
                            <td class="f12 clear_column" width="40%"  style="text-align: left;">
                                Semester
                            </td>
                            <td width="5%" style="text-align: right;" class="clear_column">:</td>
                            <td width="30%" style="text-align: right;" class="clear_column">   {{$semester->step_study_name}}</td>
                        </tr>
                        <tr>
                            <td class="f12 clear_column" width="40%"  style="text-align: left;">
                                NISN
                            </td>
                            <td width="5%" class="clear_column" style="text-align: right;">:</td>
                             <td width="30%"  class="clear_column" style="text-align: right;"> {{$student->student->student_nisn}}</td>
                        </tr> 

                        <tr>
                            <td class="f12 clear_column" width="40%"  style="text-align: left;">
                                Tahun Pelajaran
                            </td>
                            <td width="5%" class="clear_column" style="text-align: right;">:</td>
                            <td width="30%" class="clear_column" style="text-align: right;"> {{$year->unit_year_name}}</td>
                        </tr>
                    </table>
                </td>
            
    </tr>
</table>


  <hr>

    @php
        $obser_sprit = \App\Models\Observasi::where('observasi_category','spiritual')->where('student_id',$student->student->student_id)->get();
        $obser_sosial = \App\Models\Observasi::where('observasi_category','sosial')->where('student_id',$student->student->student_id)->get();
    @endphp


    <div class="f12" style="font-weight: bold;"> A. Sikap</div>
     <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
     <tr>
            <th colspan="2" align="center">  Deskripsi: </th>
        </tr>

    <tr class="f12">
        <td align="left">1. Sikap Spritual</td>
        <td align="left"> Ananda {{strtoupper($student->student->student_name)}} sangat taat ber
        @foreach($obser_sprit as $os)
            @if($os->observasi_value == "SB")
                @php $ot = $os->observasi_type @endphp
                {{$ot}}, 
            @endif
        @endforeach
        dengan baik</td>
    </tr>

    <tr class="f12">
        <td align="left">2. Sikap Sosial</td>
        <td align="left"> Ananda {{strtoupper($student->student->student_name)}} sangat 
        @foreach($obser_sosial as $oso)
            @if($oso->observasi_value == "SB")
                @php $ot = $oso->observasi_type @endphp
                {{$ot}} ,
            @endif
        @endforeach
        </td>
    </tr>

    </table>

 <div class="f12" style="font-weight: bold;"> B. Pengetahuan dan Keterampilan</div>
 <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
    <thead class="color_b"> 
         <tr class="f12">
            <th align="center">No</th>
            <th  align="center">MATA PELAJARAN</th>
            <th  align="center">KKM</th>
            <th  align="center">NILAI</th>
            <th  align="center">RATA - RATA KELAS</th>
            <th  align="center">KET</th>
        </tr>
    </thead>
    <tbody>
        @php
            $no = 1;
        @endphp
       @foreach($course_biasa as $c) 
       @php

         $list_course = \DB::table('course_setting as cs')
        ->join('m_course as c','c.course_id','cs.course_id')
        ->join('m_kkm as k','k.course_id','c.course_id')
        ->join('raport as r','r.course_id','c.course_id')
        ->where('r.student_id',$student->student->student_id)
        ->where('r.step_study_id',stepStudyActive())
        ->where('c.course_id',$c->course_id)
        ->where('k.class_grade_id',$student->student->class_grade_id)
        ->first();


        if(empty($list_course))
        {
            $avg_c = 0;
            $total_stu = 0;
        }
        else 
        {
            if( $list_course->total_pengetahuan != 0)  
            {
                $total_stu = round(  ($list_course->total_pengetahuan+$list_course->total_keterampilan) /2  ) ;        

                $avg_c = \DB::table('raport as rps')
                ->join('m_student as ms','ms.student_id','rps.student_id')
                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                ->select(\DB::raw('  round ( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
                ->where('course_id',$list_course->course_id)
                ->where('msg.study_group_id',$study_group_id)
                ->where('step_study_id',stepStudyActive())
                ->first();
            }
            else if( $list_course->total_keterampilan != 0 )
            {
                $total_stu = round(  $list_course->total_keterampilan  ) ;    
                $avg_c = \DB::table('raport as rps')
                ->join('m_student as ms','ms.student_id','rps.student_id')
                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                ->select(\DB::raw(' round ( sum ( total_keterampilan  ) / count(rps.student_id ) )  as tot'))
                ->where('course_id',$list_course->course_id)
                ->where('msg.study_group_id',$study_group_id)
                ->where('step_study_id',stepStudyActive())
                ->first();
            }
            else
            {
                $avg_c = 0;
                $total_stu = 0;
            }
        }


        


        $kkm_val_ =  (empty($list_course->kkm_value)) ? 0 : $list_course->kkm_value;
        $total_ = (empty($total_stu)) ? 0 : $total_stu;
        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;

       @endphp
        <tr>
            <td class="f12" align="center"> {{$no}}</td>
            <td class="f12" align="left"> {{$c->course_name}} </td>
            <td class="f12"  align="center">  {{$kkm_val_}} </td>
            <td class="f12"  align="center"> {{ $total_ }} </td>
            <td class="f12"  align="center"> {{ $avg_ }}  </td>
            <td class="f12"  align="center"> {{ ($total_ >= $kkm_val_)  ?  "Tuntas"  : "Belum Tuntas"  }} </td>
        </tr>
        @php
            $no++;
        @endphp
        @endforeach



    <tr class="f12">
        <td align="center"></td>
        <td colspan="5">Muatan Lokal</td>
    </tr>
    @php
        $no_mulok=1; 
    @endphp     
    @foreach($course_mulok as $c) 
       @php

      

        $list_course_mulok = \DB::table('course_setting as cs')
        ->join('m_course as c','c.course_id','cs.course_id')
        ->join('m_kkm as k','k.course_id','c.course_id')
        ->join('raport as r','r.course_id','c.course_id')
        ->where('r.student_id',$student->student->student_id)
        ->where('r.step_study_id',stepStudyActive())
        ->where('c.course_id',$c->course_id)
        ->where('k.class_grade_id',$student->student->class_grade_id)
        ->first();


        if(empty($list_course_mulok))
        {
            $avg_c = 0;
            $total_stu = 0;
        }
        else 
        {


            if(!empty($list_course_mulok->total_pengetahuan)  )
            {
                // dd('tes1');
                $total_stu = round(  ($list_course_mulok->total_pengetahuan+$list_course_mulok->total_keterampilan) /2  ) ;        

                $avg_c = \DB::table('raport as rps')
                ->join('m_student as ms','ms.student_id','rps.student_id')
                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                ->select(\DB::raw(' 
                    round( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  
                    as tot'))
                ->where('course_id',$list_course_mulok->course_id)
                ->where('msg.study_group_id',$study_group_id)
                ->where('step_study_id',stepStudyActive())
                ->first();


            }
            elseif(!empty($list_course_mulok->total_keterampilan))
            {
                // dd('tes2');
                $total_stu = round(  $list_course_mulok->total_keterampilan  ) ;    
                $avg_c = \DB::table('raport as rps')
                ->join('m_student as ms','ms.student_id','rps.student_id')
                ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
                ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
                ->select(\DB::raw(' 
                    case when rps.total_pengetahuan >0
                    then
                    round ( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )
                    else
                    round ( sum ( total_keterampilan  ) / count(rps.student_id ) ) 
                    end
                    as tot
                    '))
                ->where('course_id',$list_course_mulok->course_id)
                ->where('msg.study_group_id',$study_group_id)
                ->where('step_study_id',stepStudyActive())
                ->groupBy('rps.total_pengetahuan')
                ->first();


            }
            else
            {
                $avg_c = 0;
                $total_stu = 0;
            }
        }

     
        // $total_ = (empty($total_stu)) ? 0 : $total_stu;
        // $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;
        $total_ = (empty($total_stu)) ? 0 : $total_stu;
        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot; 
        $kkm_val_ =  (empty($list_course_mulok->kkm_value)) ? 0 : $list_course_mulok->kkm_value;
        
       @endphp
        <tr>
            <td class="f12" align="center">{{gen_abjad($no_mulok)}}</td>
            <td class="f12" align="left"> {{$c->course_name}} </td>
            <td class="f12"  align="center">  {{$kkm_val_}} </td>
            <td class="f12"  align="center"> {{ $total_ }} </td>
            <td class="f12"  align="center"> {{ $avg_ }}  </td>
            <td class="f12"  align="center"> {{ ($total_ >= $kkm_val_)  ?  "Tuntas"  : "Belum Tuntas"  }} </td>
        </tr>
        @php
            $no_mulok++;
        @endphp
    @endforeach

    </tbody>
  </table>
    
    
    <div class="f12" style="font-weight: bold;"> Catatan Tahsin & Tahfizh  </div>
     <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
     <tr>
            <th>  Target Hafalan Surat </th>
            <th>  Pencapaian </th>
        </tr>
        @php

        $mulok_tahsin = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        ->where('cd.unit_year_id',yearActive())
        ->where('course_type','muatan_lokal')
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->where('c.course_name','Tahsin')
        ->get();

        $mulok_tahfizh = 
        \DB::table('m_course as c')
        ->join('course_setting as cd','cd.course_id','c.course_id')
        ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
        ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
        ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
        ->where('ms.study_group_id',$study_group_id)
        ->where('cg.class_grade_id',$student->student->class_grade_id)   
        ->where('cd.unit_year_id',yearActive())
        ->where('course_type','muatan_lokal')
        ->where('kkm.class_grade_id',$student->student->class_grade_id)
        ->where('c.course_name','Tahfizh')
        ->get();
        @endphp
    @if(!empty($mulok_tahsin))
    
        @foreach ($mulok_tahsin as $key => $cr)     
                @php
                 $list_course_mulok = \DB::table('course_setting as cs')
                ->join('m_course as c','c.course_id','cs.course_id')
                ->join('m_kkm as k','k.course_id','c.course_id')
                ->join('raport as r','r.course_id','c.course_id')
                ->where('r.student_id',$student->student->student_id)
                ->where('r.step_study_id',stepStudyActive())
                ->where('c.course_id',$cr->course_id)
                ->where('k.class_grade_id',$student->student->class_grade_id)
                ->first();
                $tot_catatan = round(  $list_course_mulok->total_keterampilan  ) ;   

                $list_detail = \DB::table('course_setting as cs')
                    ->join('m_course as c','c.course_id','cs.course_id')
                    ->join('m_kd as d','d.course_setting_id','cs.course_setting_id')
                    ->join('m_kd_detail as e','e.kd_id','d.kd_id')
                    ->join('raport as r','r.course_id','c.course_id')
                    ->where('r.student_id',$student->student->student_id)
                    ->where('r.step_study_id',stepStudyActive())
                    ->where('cs.class_grade_id',$cr->class_grade_id)
                    ->where('r.course_id',$cr->course_id)
                    ->get();
                @endphp
                

                <tr class="f12">
                    
                    <td align="left" class="f11">
                        {{$cr->course_name }}<br> 
                        @foreach ($list_detail as $key => $vl_detail)
                            {{$vl_detail->kd_name}}<br>
                        @endforeach
                    </td>

                    <td class="f11">
                        <br>
                        @php
                            $count = 0;
                            $tmbah=0;
                        @endphp
                     @foreach ($list_detail as $key => $vl_detail)
                        
                        @if($vl_detail->total_keterampilan !=0)
                            @php
                                
                                $tmbah+=$vl_detail->total_keterampilan;
                                $count++;
                            @endphp
                        @endif
                    @endforeach
                        @php
                            $total_catatan = $tmbah/$count;
                            $max_ket = get_kkm ( $cr->course_id,$total_catatan,$cr->class_grade_id );
                        @endphp
                        
                        @if($max_ket  == 'A')
                            SANGAT BAIK
                        @elseif($max_ket == 'B')
                            BAIK
                        @elseif($max_ket == 'C' )
                            CUKUP BAIK
                        @endif 
                        
                    </td>
                </tr>
            
        @endforeach
    @endif 

    @if(!empty($mulok_tahfizh))
    
        @foreach ($mulok_tahfizh as $key => $cr)     
                @php
                 $list_course_mulok = \DB::table('course_setting as cs')
                ->join('m_course as c','c.course_id','cs.course_id')
                ->join('m_kkm as k','k.course_id','c.course_id')
                ->join('raport as r','r.course_id','c.course_id')
                ->where('r.student_id',$student->student->student_id)
                ->where('r.step_study_id',stepStudyActive())
                ->where('c.course_id',$cr->course_id)
                ->where('k.class_grade_id',$student->student->class_grade_id)
                ->first();
                $tot_catatan = round(  $list_course_mulok->total_keterampilan  ) ;   

                $list_detail = \DB::table('course_setting as cs')
                    ->join('m_course as c','c.course_id','cs.course_id')
                    ->join('m_kd as d','d.course_setting_id','cs.course_setting_id')
                    ->join('m_kd_detail as e','e.kd_id','d.kd_id')
                    ->join('raport as r','r.course_id','c.course_id')
                    ->where('r.student_id',$student->student->student_id)
                    ->where('r.step_study_id',stepStudyActive())
                    ->where('cs.class_grade_id',$cr->class_grade_id)
                    ->where('r.course_id',$cr->course_id)
                    ->get();
                @endphp
                

                <tr>
                    
                    <td align="left" class="f11">
                        {{$cr->course_name }}<br> 
                        @foreach ($list_detail as $key => $vl_detail)
                            {{$vl_detail->kd_name}}<br>
                        @endforeach
                    </td>

                    <td class="f11">
                        <br>
                        @php
                            $count = 0;
                            $tmbah=0;
                        @endphp
                     @foreach ($list_detail as $key => $vl_detail)
                        
                        {{-- @php 
                            $max_ket = get_kkm ( $cr->course_id,$tot_catatan,$cr->class_grade_id );                            
                        @endphp
                        @if($max_ket  == 'A')
                            SANGAT BAIK
                        @elseif($max_ket == 'B')
                            BAIK
                        @elseif($max_ket == 'C' )
                            CUKUP BAIK
                        @endif --}}
                        @if($vl_detail->total_keterampilan !=0)
                            @php
                                
                                $tmbah+=$vl_detail->total_keterampilan;
                                $count++;
                            @endphp
                        @endif
                    @endforeach
                        @php
                            $total_catatan = $tmbah/$count;
                            $max_ket = get_kkm ( $cr->course_id,$total_catatan,$cr->class_grade_id );
                        @endphp
                        
                        @if($max_ket  == 'A')
                            SANGAT BAIK
                        @elseif($max_ket == 'B')
                            BAIK
                        @elseif($max_ket == 'C' )
                            CUKUP BAIK
                        @endif 
                        
                    </td>
                </tr>
            
        @endforeach
    @endif
    
    </table>
    <br/>
    <br/>


    <div class="f12" style="font-weight: bold;" style="font-weight: bold;"> C. Ekstrakurikular  </div>
    <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
    <tr>
        <th>No</th>
        <th>  Ekstrakurikular </th>
        <th>  Deskripsi </th>
    </tr>
    <tr>
        <td>1</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>2</td>
        <td></td>
        <td></td>
    </tr>
    
   
   {{--  @if(!empty($eskul))
        @foreach ($eskul as $key => $value) 
            <tr class="f12">
                <td align="left">{{$value->type}}</td>
                <td align="left">{{$value->value}} {{$value->desc }}</td>
            </tr>
        @endforeach
    @endif
 --}}
    </table><br/>
    @php
        $teacher_ = (empty($teacher_note)) ? "" : $teacher_note->raport_pas;  
    @endphp

     <div class="f12" style="font-weight: bold;"> D.Catatan  </div>
      <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
             <tr class="f12">
                <td align="left">{{$teacher_}}</td>
            </tr>
      </table>
        <br/>
        <br/>

    <div class="f12" style="font-weight: bold;"> E. Tinggi dan Berat Badan  </div>
         <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
         <tr >
                <th rowspan="2">  Aspek Yang Dinilai </th>
                <th colspan="2">  Semester </th>
            </tr>
        <tr> 
                <th>  1 </th>
                <th>  2 </th>
        </tr>
        {{-- @if(count($tinggi) > 0) --}}
            <tr class="f12">
            <td align="left">Tinggi Badan</td>
            <td align="left"></td>
            <td align="left"></td>
            </tr>    
        {{-- @endif --}}


        {{-- @if(count($berat) > 0) --}}
            <tr class="f12">
                <td align="left">Berat Badan</td>
                <td align="left"></td>
                <td align="left"></td>
            </tr>
        {{-- @endif --}}
        
    </table><br/>

        <div class="f12" style="font-weight: bold;"> F. Kondisi Kesehatan  </div>
         <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
            <tr>
                <th>  Aspek Fisik </th>
                <th>  Keterangan </th>
            </tr>
            <tr>
                <td>Pendengaran</td>
                <td></td>
            </tr>

            <tr>
                <td>Penglihatan</td>
                <td></td>
            </tr>
            <tr>
                <td>Gigi</td>
                <td></td>
            </tr>
            
        {{-- @if(count($kesehatan) >0)
            @foreach ($kesehatan as $key => $val_kes) 
                <tr class="f12">
                    <td align="left">{{$val_kes->physical_type}}</td>
                    <td align="left">{{$val_kes->physical_value }}</td>
                </tr>
            @endforeach 
        @endif --}}
        </table><br/>


        <div class="f12" style="font-weight: bold;"> G. Prestasi  </div>
         <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0" style="font-size:12px;">
            <tr>
                <th>No</th>
                <th>  Jenis Prestasi </th>
                <th>  Keterangan </th>
            </tr>
            <tr>
                <td>1</td>
                <td></td>
                <td></td>
            </tr>
       
        {{-- @if(!empty($prestation))
        
            @foreach ($prestation as $key => $val_pres) 
            
                <tr class="f12">
                    <td align="left">{{$val_pres->value}}</td>
                    <td align="left">{{$val_pres->desc }}</td>
                </tr>
            @endforeach
        @endif --}}
        
        </table><br/>


    @php 
    $absensi_s = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
    ->where('student_id',$student->student->student_id)
    ->where('absensi_type','S')
    ->where('step_study_id',stepStudyActive())
    ->first();
    $absensi_i = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
    ->where('student_id',$student->student->student_id)
    ->where('absensi_type','I')
    ->where('step_study_id',stepStudyActive())
    ->first();
    $absensi_a = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
    ->where('student_id',$student->student->student_id)
    ->where('absensi_type','A')
    ->where('step_study_id',stepStudyActive())
    ->first();
    @endphp
    
<table width="100%" class="table table-bordered" style="padding:0px;margin: 0px">

    <tr>
        <td  width="50%">
             <table border="1" cellspacing="0" cellspacing="0"  class="table table-bordered" width="100%">
                <tr>
                    <td class="f12" colspan="2">Ketidakhadiran</td>
                    <td class="f12" >Jumlah Hari</td>
                </tr>

                @php $tot= 0;@endphp 
                @if(count($absensi) > 0)
                @foreach($absensi as $k => $ab)
                    <tr class="f12">
                        <td align="left">{{$k+1}}</td>
                        <td  align="left" >{{ conv_absen($ab->absensi_type)}}</td>
                        <td  align="left"> {{$ab->tot}} Hari</td>
                    </tr>
                    @php
                        $tot +=$ab->tot;
                    @endphp
                @endforeach
                @else
                    <tr>
                        <td>1</td>
                        <td class="f12" >Sakit</td>
                        <td class="f12" > {{$absensi_s->tot_absensi}} Hari </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="f12" >Izin</td>
                        <td class="f12" >{{$absensi_i->tot_absensi}} Hari </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="f12" >Tanpa Keterangan</td>
                        <td class="f12" >{{$absensi_a->tot_absensi}} Hari </td>
                    </tr>
                @endif

                <tr>
                    <td colspan="2" class="f12"> Jumlah </td>
                    <td class="f12"> {{$tot}}  Hari</td>
                </tr>
            </table>
        </td>

        @php
             $course_setting = 
            \DB::table('m_course as c')

            ->join('course_setting as cd','cd.course_id','c.course_id')
            ->join('m_kkm as kkm','kkm.course_id','cd.course_id')
            ->join('m_class_grade as cg','cg.class_grade_id','cd.class_grade_id')
            ->join('m_study_group as ms','ms.class_grade_id','cg.class_grade_id')
            ->where('ms.study_group_id',$study_group_id)
            ->where('cg.class_grade_id',$student->student->class_grade_id)   
            ->where('cd.unit_year_id',yearActive())
            ->where('kkm.class_grade_id',$student->student->class_grade_id)
            ->get();
        

             foreach($course_setting as $cs){
                $k3 = \App\Models\Raport::where('course_id',$cs->course_id)
                ->where('student_id',$student->student->student_id)
                ->where('step_study_id',stepStudyActive())
                ->first();

                if(!empty($k3->total_pengetahuan) && !empty($k3->total_keterampilan))
                {
                    $na = round ( $k3->total_keterampilan ) ;   
                }
                else if(!empty($k3->total_keterampilan))
                {
                    $na = $na = round ( ($k3->total_pengetahuan  +  $k3->total_keterampilan) / 2 )  ;   
                }
                else
                {
                    $na = 0;
                }
                
                if($na < $cs->kkm_value){
                    $nilai_naik[$student->student->student_id][] = $na; 
                }
            }
            $levelup = '';
            if($class->class_grade_name == "GRADE 6")
            {
                foreach($nilai_naik as $key => $nn){
                    if($student->student->student_id == $key){
                        if( count($nilai_naik[$student->student->student_id]) == 3  ){
                            $levelup= 'Tidak Lulus ';
                        }else{
                            $levelup = 'Lulus';
                        }
                    }
                }    
            }
            else
            {
                foreach($nilai_naik as $key => $nn){
                    if($student->student->student_id == $key){
                        if( count($nilai_naik[$student->student->student_id]) == 3  ){
                            $levelup= 'Tidak Naik Kelas ';
                        }else{
                            $levelup = 'Naik Kelas';
                        }
                    }
                }
            }
            
            $kelas_up = explode(" ", $class->class_grade_name);

        @endphp
        <td width="50%" >
               <table border="1" cellpadding="0" cellspacing="0.1" class="table table-bordered" width="100%">
                <tr>
                    <td class="f12">Keputusan </td>
                </tr>                
                <tr>
                    <td>Berdasarkan keputusan rapat dengan menimbang hasil belajar semester I dan II, Ananda {{$student->student->student_name}} dinyatakan
                            <br>
                            <br>
                        <b>
                        @php
                        if($kelas_up[1] ==6)
                        {
                            $up = 6;   
                        }
                        else
                        {
                            $up = $kelas_up[1]+1;
                        }
                        echo $levelup; //.':'.$up;

                        @endphp
                        </b>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
    


  <table width="100%" class="table table-bordered">
    <tr>
        <td class="f12" align="center">
            Mengetahui : 
            <br>
            Orang Tua / Wali,
        </td>
        <td></td>
        <td class="f12" align="center">
            Jakarta, 
            @if(!empty($semester))
                @php
                    echo toIndonesia($semester->date_pas);
                @endphp                
            @endif
            <br>
            Wali Kelas {{$student->study_group->study_group_name}}
        </td>
    </tr>
    @php
     $kepsek = \DB::table('m_employee as a')
                ->join('roles as b','a.employee_role','b.id')
                ->select('employee_role','photo_assign','b.name','employee_name')
                ->where('b.name','ilike','%Kepala Sekolah%')
                ->first();
    @endphp
    <tr>
        <td class="f12" align="center">
            <div style="margin-top:40px">
                --------------------------
            </div>
        </td>
        <td align="center">Kepala Sekolah
        <br>
        <br>
        <br>
        <br>
        <br>
            <b><u>{{$kepsek->employee_name}}</u></b>
        </td>
        <td class="f12" align="center">
             @if(!empty($walas->employee->photo_assign))
                <img src="{{ asset('image_employee/'.$walas->employee->photo_assign)}}" width="80px" height="80px">
            @else           
            @endif
            <div style="">
                <b><u>{{$walas->employee->employee_name}}</u></b>
            </div>
        </td>
    </tr>
   
  </table>


<div class="page-break"> </div>
<div class="f12" style="font-weight: bold;"> Lampiran </div>
<table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
  <thead class="color_b"> 
      <tr class="f12" >
          <td rowspan="2">No</td>
          <td rowspan="2">Mata Pelajaran</td>
          <td colspan="3" align="center"> Pengetahuan </td>
          <td colspan="3" align="center"> Keterampilan </td>
      </tr>
     
      <tr class="f12">
          <td> Nilai </td>
          <td> Predikat </td>
          <td> Deskripsi </td>   
          <td> Nilai </td>
          <td> Predikat </td>
          <td> Deskripsi </td>
      </tr>             
  </thead>
  
  <tbody>
      @php
          $no=1;
      @endphp
      @foreach($course_biasa as $c) 
          @php
           $list_course = \DB::table('course_setting as cs')
          ->join('m_course as c','c.course_id','cs.course_id')
          ->join('m_kkm as k','k.course_id','c.course_id')
          ->join('raport as r','r.course_id','c.course_id')
          ->where('r.student_id',$student->student->student_id)
          ->where('r.step_study_id',stepStudyActive())
          ->where('r.course_id',$c->course_id)
          ->first();
          $peng_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->keterangan_pengetahuan : "";
          $tot_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->total_pengetahuan : "";
          $pred_ket = ($c->course_name != "Pendidikan Jasmani Olahraga dan Kesehatan") ? $list_course->predikat_pengetahuan : "";
          @endphp
      <tr class="f12">
          <td> {{$no}} </td>
          <td> {{$c->course_name}} </td>
          <td> {{ (empty($list_course)) ? "" :  $tot_ket}} </td>   
          <td> {{ (empty($list_course)) ? "" :   $pred_ket}} </td>   
          <td> {{ (empty($list_course)) ? "" :  $peng_ket}} </td>   
          <td> {{ (empty($list_course)) ? "" :  $list_course->total_keterampilan}} </td>   
          <td> {{ (empty($list_course)) ? "" :  $list_course->predikat_keterampilan}} </td>   
          <td> {{ (empty($list_course)) ? "" :  $list_course->keterangan_keterampilan}} </td>   
      </tr>
      @php
          $no++;
      @endphp
      @endforeach

      <tr class="color_b">
          <td align="center" class="f12"></td>
          <td colspan="7" style="font-size: 14px">Muatan Lokal</td>
      </tr>
       @php
          $no=1;
      @endphp
      @foreach($course_mulok as $c) 
          @php
           $list_course = \DB::table('course_setting as cs')
          ->join('m_course as c','c.course_id','cs.course_id')
          ->join('m_kkm as k','k.course_id','c.course_id')
          ->join('raport as r','r.course_id','c.course_id')
          ->where('r.student_id',$student->student->student_id)
          ->where('r.step_study_id',stepStudyActive())
          ->where('r.course_id',$c->course_id)
          ->first();            
          
          $peng_mul = ($c->course_name != "Komputer") ? $list_course->keterangan_pengetahuan : "";
          $tot_mul = ($c->course_name != "Komputer") ? $list_course->total_pengetahuan : "";
          $pred_mul = ($c->course_name != "Komputer") ? $list_course->predikat_pengetahuan : "";
          @endphp

    @if( $c->course_name != 'Tahfizh' and $c->course_name != 'Tahsin')
      <tr class="f12">
          <td> {{$no}} </td>
          <td> {{$c->course_name}} </td>
          <td> {{ (empty($list_course->total_pengetahuan)) ? "" : $tot_mul }} </td>   
            <td> {{ (empty($list_course->predikat_pengetahuan)) ? "" : $pred_mul  }} </td>   
          
          <td> {{ (empty($list_course->keterangan_pengetahuan)) ? "" : $peng_mul }} </td>   
          <td> {{ (empty($list_course->total_keterampilan)) ? "" : $list_course->total_keterampilan }} </td>   
          <td> {{ (empty($list_course->predikat_keterampilan)) ? "" : $list_course->predikat_keterampilan }} </td>   
          <td> {{ (empty($list_course->keterangan_keterampilan)) ? "" : $list_course->keterangan_keterampilan  }} </td>   
      </tr>
    @endif
      @php
          $no++;
      @endphp
      @endforeach
  </tbody>
</table>



     


</body>

</html>

