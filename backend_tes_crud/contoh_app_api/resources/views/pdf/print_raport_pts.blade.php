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
        h1,h2,h3,h4,h5,h6{
/*            font-family: Roboto,sans-serif;         
*/            margin: 0; 
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
        table{
/*            font-size: x-small;
*/        }
      /*  tfoot tr td{
            font-weight: bold;
            font-size: x-small;
        }
        tbody tr td{
            font-size: x-small;   
        }*/
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
                        <td width="55%" class="clear_column">
                            @php

                            $tes = explode(" ",$student->student->student_name); $tus = count($tes);

                

                            if($tus >= 4)
                            {
                                echo $tes[0].' '.$tes[1].' '.$tes[2].' .'.substr($tes[3],'0','1');
                            }
                            else
                            {
                                echo $student->student->student_name;
                            }
                         @endphp</td>
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
                        No Induk 
                        </td>
                        <td width="5%" class="clear_column">:</td>
                        <td width="55%" class="clear_column">   {{$student->student->student_nis}}</td>
                    </tr>
                </table>
            </td>
            
                <td  width="50%" class="f12" style="margin: 0px;padding-left: 60px;">
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


 <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
    <thead class="color_b"> 
         <tr class="f12">
            <th align="center" width="5%">No</th>
            {{-- <th  align="center" colspan ="2" width="40%">MATA PELAJARAN</th> --}}
            <th  align="center" width="40%">MATA PELAJARAN</th>
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

         $list_course = DB::table('course_setting as cs')
        ->join('m_course as c','c.course_id','cs.course_id')
        ->join('m_kkm as k','k.course_id','c.course_id')
        ->join('raport_pts as r','r.course_id','c.course_id')
        ->where('r.student_id',$student->student->student_id)
        ->where('r.step_study_id',stepStudyActive())
        ->where('c.course_id',$c->course_id)
        ->where('k.class_grade_id',$student->student->class_grade_id)
        ->first();
        @endphp

        @if(empty($list_course))
            <h1 style="font-size: 30px;"> Mohon maaf data masih belum lengkap , segera lengkapi </h1>
            @php exit(); @endphp
        @endif

        @php
        if( ($list_course->total_keterampilan != 0) && ($list_course->total_pengetahuan != 0)  )
        {
            $total_stu = round(  ($list_course->total_pengetahuan+$list_course->total_keterampilan) /2  ) ;        

            $avg_c = DB::table('raport_pts as rps')
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
            $avg_c = DB::table('raport_pts as rps')
            ->join('m_student as ms','ms.student_id','rps.student_id')
            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
            ->select(\DB::raw(' round ( sum ( total_keterampilan  ) / count(rps.student_id ) )  as tot'))
            ->where('course_id',$list_course->course_id)
            ->where('msg.study_group_id',$study_group_id)
            ->where('step_study_id',stepStudyActive())
            ->first();
        }
         else if( $list_course->total_pengetahuan != 0 )
        {   
            $total_stu = round(  $list_course->total_pengetahuan  ) ;    
            $avg_c = \DB::table('raport_pts as rps')
            ->join('m_student as ms','ms.student_id','rps.student_id')
            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
            ->select(\DB::raw(' round ( sum ( total_pengetahuan  ) / count(rps.student_id ) )  as tot'))
            ->where('course_id',$list_course->course_id)
            ->where('msg.study_group_id',$student->study_group_id)
            ->where('step_study_id',stepStudyActive())
            ->first();
        }
        else
        {
            $avg_c = 0;
            $total_stu = 0;
        }


        $kkm_val_ =  (empty($list_course->kkm_value)) ? 0 : $list_course->kkm_value;
        $total_ = (empty($total_stu)) ? 0 : $total_stu;
        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;

       @endphp
        <tr>
            <td class="f12" align="center"> {{$no}}</td>
            {{-- <td class="f12" align="left" colspan="2" width="40%"> {{$c->course_name}} </td> --}}
            <td class="f12" align="left"  width="40%"> {{$c->course_name}} </td>
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
        {{-- <td align="center" rowspan="{{count($course_mulok)+1}}" width="5%">{{$no}}</td> --}}
        <td align="center" width="5%">{{$no}}</td>
        <td colspan="5">Muatan Lokal</td>
        {{-- <td colspan="6">Muatan Lokal</td> --}}
    </tr>

    @foreach($course_mulok as $key => $c) 
       @php


        $list_course_mulok = DB::table('course_setting as cs')
        ->join('m_course as c','c.course_id','cs.course_id')
        ->join('m_kkm as k','k.course_id','c.course_id')
        ->join('raport_pts as r','r.course_id','c.course_id')
        ->where('r.student_id',$student->student->student_id)
        ->where('r.step_study_id',stepStudyActive())
        ->where('c.course_id',$c->course_id)
        ->where('k.class_grade_id',$student->student->class_grade_id)
        ->first();


        if(!empty($list_course_mulok->total_pengetahuan) && !empty($list_course_mulok->total_keterampilan) )
        {

            $total_stu = round(  ($list_course_mulok->total_pengetahuan+$list_course_mulok->total_keterampilan) /2  ) ;        

            $avg_c = DB::table('raport_pts as rps')
            ->join('m_student as ms','ms.student_id','rps.student_id')
            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
            ->select(\DB::raw(' round( sum ( (total_keterampilan+total_pengetahuan ) /2 ) / count(rps.student_id ) )  as tot'))
            ->where('course_id',$list_course_mulok->course_id)
            ->where('msg.study_group_id',$study_group_id)
            ->where('step_study_id',stepStudyActive())
            ->first();
        }
        elseif(!empty($list_course_mulok->total_keterampilan))
        {
            $total_stu = round(  $list_course_mulok->total_keterampilan  ) ;    
            $avg_c = DB::table('raport_pts as rps')
            ->join('m_student as ms','ms.student_id','rps.student_id')
            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
            ->select(\DB::raw(' round( sum  (total_keterampilan) / count(rps.student_id ) ) as tot'))
            ->where('course_id',$list_course_mulok->course_id)
            ->where('msg.study_group_id',$study_group_id)
            ->where('step_study_id',stepStudyActive())
            ->first();
        }
        else if( $list_course->total_pengetahuan != 0 )
        {   
            $total_stu = round(  $list_course->total_pengetahuan  ) ;    
            $avg_c = \DB::table('raport_pts as rps')
            ->join('m_student as ms','ms.student_id','rps.student_id')
            ->join('study_group_setting as sgs','sgs.student_id','ms.student_id')
            ->join('m_study_group as msg','msg.study_group_id','sgs.study_group_id')
            ->select(\DB::raw(' round ( sum ( total_pengetahuan ) / count(rps.student_id ) )  as tot'))
            ->where('course_id',$list_course->course_id)
            ->where('msg.study_group_id',$student->study_group_id)
            ->where('step_study_id',stepStudyActive())
            ->first();
        }
        else
        {
            $avg_c = 0;
            $total_stu = 0;
        }

        
   
        $kkm_val_mulok =  (empty($list_course_mulok->kkm_value)) ? 0 : $list_course_mulok->kkm_value;

        $total_ = (empty($total_stu)) ? 0 : $total_stu;
        $avg_ = (empty($avg_c->tot)) ? 0 : $avg_c->tot;
        $char = range('a', 'z');
        
       @endphp
        <tr>
            <td class="f12" align="center"></td>
            <td class="f12" align="left"> {{$c->course_name}} </td>
            <td class="f12"  align="center">  {{$kkm_val_mulok}} </td>
            <td class="f12"  align="center"> {{ $total_ }} </td>
            <td class="f12"  align="center"> {{ $avg_ }}  </td>
            <td class="f12"  align="center"> {{ ($total_ >= $kkm_val_mulok)  ?  "Tuntas"  : "Belum Tuntas"  }} </td>
        </tr>
        @php
            $no++;
        @endphp
    @endforeach

    </tbody>
  </table>
    <br/>



<table width="100%" class="table table-bordered">
            <div style="margin-top: 100px;">
            </div>
</table>

<table width="100%" class="table table-bordered">

        <td  width="50%">
            <div>
            <table border="1" cellspacing="0" cellspacing="0"  class="table table-bordered" width="100%">
                <tr>
                    <th class="f12" colspan="2" align="center"> Ketidakhadiran</th>
                    <th class="f12" align="center">Jumlah Hari</th>
                </tr>

                @php $tot= 0; $abs = ['S','I','A']; @endphp               
                @foreach($abs as $k => $ab)
                    <tr class="f12">
                        <td align="left">{{$k+1}}</td>
                        <td  align="left" >{{ conv_absen($ab)}}</td>
                        <td  align="left"> @php          $list_course = DB::table('absensi')->where('absensi_type',$ab)->where('student_id',$student->student->student_id)->first();  @endphp  {{ (!empty($list_course)) ? $list_course->absensi_total : 0}}  Hari</td>
                    </tr>
                    @php (!empty($list_course)) ?  $tot +=$list_course->absensi_total : 0 ; @endphp
                @endforeach

                <tr>
                    <td colspan="2" class="f12"> Jumlah </td>
                    <td class="f12"> {{$tot}} Hari</td>
                </tr>
            </table>
            </div>
        </td>


        <td width="50%" >
            <div>
                <table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" width="100%">
                    <tr class="f12">
                        <th      colspan="2" align="center"> Kepribadian </th>
                        <th   align="center" > Nilai </th>
                    </tr>
                    <tr class="f12">
                        <td  >1</td>
                        <td    align="">Kelakuan</td>
                        <td    align="center">{{ (!empty($kelakuan))  ? $kelakuan->personality_value : "" }}</td>
                    </tr>
                    <tr class="f12">
                        <td  >2</td>
                        <td    align="">Kerajinan</td>
                        <td    align="center">{{ (!empty($kerajinan))  ? $kerajinan->personality_value : "" }}</td>
                    </tr>
                    <tr class="f12">
                        <td  >3</td>
                        <td    align="">Kerapihan</td>
                        <td    align="center">{{ (!empty($kerapihan))  ? $kerapihan->personality_value : "" }}</td>
                    </tr>

                    <tr>
                        <td colspan="2" class="f12"> &nbsp; </td>
                        <td class="f12">   &nbsp; </td>
                    </tr>

                </table>
            </div>
        </td>
</table>
    
 
@php
    $teacher_ = (empty($teacher_note)) ? "" : $teacher_note->raport_pts;   
@endphp

 <div style="margin-bottom:0;margin-top: 0; font-size: 11px;" > Catatan  </div>
  <table width="100%" class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
         <tr class="">
            <td align="left" style="font-size:11px">{{$teacher_}}</td>
        </tr>
  </table>
    <br/>



  <table width="100%" class="table table-bordered">
    <tr>
        <td class="f10" align="center">
            Mengetahui : 
            <br>
            Orang Tua / Wali,
        </td>
        <td></td>
        <td class="f10" align="center">
            Jakarta, 
            @if(!empty($semester))
                @php
                    echo toIndonesia($semester->date_pts); // Hasil 15 February 1994
                @endphp
            @endif
            
            <br>
            Wali Kelas {{$student->study_group->study_group_name}}
        </td>
    </tr>
    <tr>
        <td class="f10" align="center">
            <div style="margin-top:40px">
                --------------------------    
            </div>
        </td>
        <td>
           
        </td>
        <td class="f10" align="center">
            @if(!empty($walas->employee->photo_assign))
                <img src="{{ asset('image_employee/'.$walas->employee->photo_assign)}}" width="70px" height="70px">
            @else
                
            @endif
            <div class="f10">
                {{$walas->employee->employee_name}}
            </div>
        </td>
    </tr>
   
  </table>


     


</body>

</html>

