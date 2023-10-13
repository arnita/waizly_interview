<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered">
    <thead>

        <tr>
            <th style="font-weight:bold; ">Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; "> {{ $data['walas']->study_group->study_group_name  }}  </th>
        </tr>
        <tr>
            <th style="font-weight:bold; ">Wali Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{ $data['walas']->employee->employee_name  }}  </th>
        </tr> 

        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <th rowspan ="4" >No</th>
            <th rowspan ="4" >ID</th>
            <th rowspan ="4"  style="text-align:center"> Nama </th>
            <th colspan="20" style="text-align: center;"> Rekapitulasi Nilai  {{ ( count($data['course_setting_pengetahuan']) == 0 )  ?  $data['course_setting_keterampilan'][0]->course_name  : $data['course_setting_pengetahuan'][0]->course_name}} </th>
        </tr>
        <tr>
            <th style="text-align: center;" colspan="{{count($data['course_setting_pengetahuan'])}}" rowspan="2"> Pengetahuan </th>
            <th colspan="2"  style="text-align: center;">Tertinggi</th>
            <th colspan="2"  style="text-align: center;">Terendah</th>
            <td  style="text-align: center;" rowspan ="3"  >NA</td>
            <td  style="text-align: center;"  rowspan ="3"  >P</td>
            <th style="text-align: center;" colspan="{{count($data['course_setting_pengetahuan'])}}" rowspan="2"> Keterampilan </th>
            <th colspan="2"  style="text-align: center;">Tertinggi</th>
            <th colspan="2"  style="text-align: center;">Terendah</th>
            <td  style="text-align: center;" rowspan ="3"  >NA</td>
            <td  style="text-align: center;"  rowspan ="3"  >P</td>
        </tr>
        <tr>
            <td style="text-align: center;" rowspan="2">KD</td>
            <td style="text-align: center;"  rowspan="2">N</td>
            <td style="text-align: center;"  rowspan="2">KD</td>
            <td style="text-align: center;"  rowspan="2">N</td>

            <td style="text-align: center;" rowspan="2">KD</td>
            <td style="text-align: center;"  rowspan="2">N</td>
            <td style="text-align: center;"  rowspan="2">KD</td>
            <td style="text-align: center;"  rowspan="2">N</td>
          
        </tr>
       <tr>
            @if(count($data['course_setting_pengetahuan']) > 0 )
                @foreach($data['course_setting_pengetahuan'] as $ct)
                    <th style="text-align: center;" rowspan="1">{{$ct->kd_code}} </th>
                @endforeach 
            @else 
                <th> 0 </th>
            @endif
        
            @if( count($data['course_setting_keterampilan']) > 0 )
                @foreach($data['course_setting_keterampilan'] as $ct)
                    <th style="text-align: center;" rowspan="1">{{$ct->kd_code}}</th>
                @endforeach
            @else 
                <th></th>
            @endif
        </tr>
     
    </thead>
    <tbody>
        @php
            $no = 1;    
            $tot_val = 0;
            $tot_p = 0;
            $min =0;
            $max = 0;
            $summary  =[];
            $kd_summary = [];
        @endphp
        @foreach($data['data_siswa'] as $row)
            <tr>   
                <td>{{$no}}</td>
                <td>{{$row->student_id}}</td>
                <td>{{$row->student_name}}</td>              
                @foreach($data['course_setting_pengetahuan'] as $ct)
                    @php    
                        /*  Get Total Per KD */
                        $val_h = 
                        \DB::table('daily_exercise as de')
                        ->select(\DB::raw("round (sum(score) / count(student_id ) ) as tot,student_id,k.kd_id"))
                        ->join('m_kd_detail as kd','de.kd_detail_id','kd.kd_detail_id')
                        ->join('m_kd as k','k.kd_id','kd.kd_id')
                        ->groupBy('student_id','k.kd_id')
                        ->where('student_id',$row->student_id)
                        ->where('k.kd_id',$ct->kd_id)
                        ->where('k.kd_type','Pengetahuan')
                        ->where('de.step_study_id',stepStudyActive())
                        ->first();
                        
                        $val_h_ = (!empty($val_h)) ? $val_h->tot : 0 ;


                        $uts = \App\Models\Summary_tematic::where('type','uts')
                        ->where('student_id',$row->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_uts = (!empty($uts)) ? $uts->total : 0 ;
                        
                        $uas = \App\Models\Summary_tematic::where('type','uas')
                        ->where('student_id',$row->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_uas = (!empty($uas)) ? $uas->total : 0 ;

                        $daily = \App\Models\Summary_tematic::
                        where('type','daily')
                        ->where('student_id',$row->student_id)
                        ->where('kd_id',$ct->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->first(); 
                        $val_daily = (!empty($daily)) ? $daily->total : 0 ;
                        
                        if($ct->class_grade_name == "GRADE 6")
                         {
                            if(empty($val_uas)){
                                $tot_p = ($val_daily + $val_h_)/2 ;   
                            }else{
                                $tot_p = ($val_uas + $val_daily + $val_h_)/3 ;
                            }   
                         }
                         
                         else
                         {
                            if(empty($val_uas)){
                                $tot_p = ($val_uts + $val_daily + $val_h_)/3 ;   
                            }else{
                                $tot_p = ($val_uts + $val_uas + $val_daily + $val_h_)/4 ;
                            }
                         }
                         $summary[$ct->kd_code] = $tot_p;
                         $kd_summary[round($tot_p)] = $ct->kd_code;


                    @endphp
                    <td style="text-align: center;">{{round($tot_p)}}</td>
                    
                @endforeach

                @if( count ($data['course_setting_pengetahuan'])  > 0 )
                    <td  style="text-align: center;">
                            @php
                            /* mendapatkan nilai tertinggi dan terendah */
                                /* Mendapatkan nilai max */
                                $sum_v1 = round(max($summary));
                                $tot_na = '';
                                foreach ($kd_summary as $key => $value) 
                                {
                                    if($sum_v1 == $key)
                                    {
                                        $tot_na = $value;    
                                    }
                                }
                            @endphp
                            {{$tot_na}}
                    
                    </td>
                    <td  style="text-align: center;">{{ round(max($summary)) }} </td>
               
                    <td  style="text-align: center;"> @php
                            /* Mendapatkan nilai min */
                            $sum_v2 = round(min($summary));
                            $tot_na = '';
                            foreach ($kd_summary as $key => $value) 
                            {
                                if($sum_v2 == $key)
                                {
                                    $tot_na = $value;    
                                }
                            }
                            $nilai_akhir_a = round (round(array_sum($summary)) / count($summary) );
                        @endphp
                        {{$tot_na}}
                    </td>

                    <td style="text-align: center;"> {{ round(min($summary)) }}</td>
                    <!-- Mendapatkan nilai akhir  -->
                    <td style="text-align: center;"> {{ round (round(array_sum($summary)) / count($summary) ) }}</td>
                    <!-- Mendapatkan nilai Predikat  -->
                    <td style="text-align: center;"> {{get_kkm($data['course_setting_keterampilan'][0]->course_id,$nilai_akhir_a,$data['study_group']->class_grade->class_grade_id)}} </td>

                @else
                    <td  style="text-align: center;">
                    </td>
                    <td  style="text-align: center;"></td>
               
                    <td  style="text-align: center;">
                    </td>

                    <td style="text-align: center;"> </td>
                    <!-- Mendapatkan nilai akhir  -->
                    <td style="text-align: center;"> </td>
                    <!-- Mendapatkan nilai Predikat  -->
                    <td style="text-align: center;"> </td>
                    
                    <td style="text-align: center;"> </td>

                @endif


<!--  NILAI KETERAMPILAN -->

                @foreach($data['course_setting_keterampilan'] as $ck)
                        @php    
                            /*  Get Total Per KD */
                            $skill = \App\Models\Summary_skill::
                            where('student_id',$row->student_id)
                            ->where('kd_id',$ck->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->first(); 

                            $count = \App\Models\Summary_skill::
                            where('student_id',$row->student_id)
                            ->where('kd_id',$ck->kd_id)
                            ->where('step_study_id',stepStudyActive())
                            ->get(); 
                            $c_count = (!empty($count)) ? count($count) : 1;
                            $val_skill = (!empty($skill)) ? $skill->total_skill : 0 ;
                            
                         
                            $val_daily = (!empty($skill)) ? $skill->total_skill : 0 ;
                            $tot_p = ($val_skill) ;
                            $summary_skill[$ck->kd_code] = $tot_p;
                            $kd_summary_skill[round($tot_p)] = $ck->kd_code;
                            $c_kolom = count($data['course_setting_keterampilan']);


                        @endphp
                        <td style="text-align: center;" colspan="{{ ($c_kolom == 1) ? 2:0  }}">{{round($tot_p)}}</td>
                @endforeach

                <td  style="text-align: center;">
                    @php
                        /* mendapatkan nilai tertinggi dan terendah */

                        /* Mendapatkan nilai max */
                        $sum_s1 = round(max($summary_skill));
                        $tot_na_s1 = '';
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_s1 == $key)
                            {
                                $tot_na_s1 = $value;    
                            }
                        }
                    @endphp
                    {{$tot_na_s1}}
                </td>
                <td  style="text-align: center;">{{ round(max($summary_skill)) }}</td>
               
               <td  style="text-align: center;"> @php

                        /* Mendapatkan nilai min */
                        $sum_s2 = round(min($summary_skill));
                        //dump($kd_summary_skill);
                        $tot_na_s2 = '';
                        foreach ($kd_summary_skill as $key => $value) 
                        {
                            if($sum_s2 == $key)
                            {
                                $tot_na_s2 = $value;    
                            }
                        }
                        $nilai_akhir = round (round(array_sum($summary_skill)) / count($summary_skill) );
                    @endphp
                    {{$tot_na_s2}}

                </td>
                <td style="text-align: center;"> {{ round(min($summary_skill)) }}</td>

                <!-- Mendapatkan nilai akhir  -->
                <td style="text-align: center;"> {{ $nilai_akhir }}</td>
                <!-- Mendapatkan nilai Predikat  -->
                <td style="text-align: center;"> {{get_kkm($data['course_setting_keterampilan'][0]->course_id,$nilai_akhir,$data['study_group']->class_grade->class_grade_id)}} </td>

            </tr>

            @php 
                $no++;
            @endphp
        @endforeach



       
        
    </tbody>
</table>



