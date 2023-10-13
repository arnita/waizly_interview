@php $loop_month = ['S','I','A']; @endphp
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
            <th rowspan ="3" >No</th>
            <th rowspan ="3" >ID</th>
            <th rowspan ="3"  style="text-align:center"> Nama </th>
            @foreach($data['course_setting'] as $cs)
            	<th style="text-align:center" colspan="3">{{$cs->course_name}}</th>
            @endforeach
            <th colspan="3" style="text-align:center" rowspan="2">Rata 2</th>
            <th colspan="2" style="text-align:center" rowspan="2">Sikap</th>
            <th colspan="3" style="text-align:center" rowspan="2">  Absensi </th>
            <th colspan="2" style="text-align:center" rowspan="2">  KET </th>
        </tr>
        <tr>
        	@foreach($data['course_setting'] as $cs)
				<th style="text-align:center" colspan="3">{{$cs->kkm_value}}</th>
            @endforeach
        	
        </tr>
        <tr>
        	<!-- ini untuk kolom nilai mata pelajaran -->
        	@foreach($data['course_setting'] as $cs)
	        	<th style="text-align:center" >KI 3</th>
	        	<th style="text-align:center" >KI 4</th>
	        	<th style="text-align:center" >NA</th>
	        @endforeach

	        <!-- ini untuk kolom rata rata -->
	        <th style="text-align:center" >KI 3</th>
        	<th style="text-align:center" >KI 4</th>
        	<th style="text-align:center" >NA</th> 

        	<!-- Ini untuk kolom sikap -->
        	<th style="text-align:center" >KI 3</th>
        	<th style="text-align:center" >KI 4</th>

        	<!-- ini untuk kolom absensi -->
        	<th style="text-align:center" >S</th>
        	<th style="text-align:center" >I</th>
        	<th style="text-align:center" >A</th>


        	<!-- ini untuk kolom keterangan -->
        	<th style="text-align:center" >N</th>
        	<th style="text-align:center" >TN</th>


        </tr>
  
     

    </thead>
    <tbody>
        @php
            $no = 1;    
       		$rata2_peng = 0;
       		$rata2_ket = 0;
       		$nilai_naik = [];
       		$count_course = count($data['course_setting']) ;
        @endphp
        @foreach($data['data_siswa'] as $row)
            <tr>   
                <td>{{$no}}</td>
                <td>{{$row->student_id}}</td>
                <td>{{$row->student_name}}</td>      
                <!-- ini untuk kolom nilai mata pelajaran -->
                @foreach($data['course_setting'] as $cs)        
	                @php
		    			$k3 = \App\Models\Raport::where('course_id',$cs->course_id)
		    			->where('student_id',$row->student_id)
		    			->where('step_study_id',stepStudyActive())
		    			->first();
		    			
		    			if(!empty($k3->total_pengetahuan) )
		    			{
		    				$na = round ( ($k3->total_pengetahuan  +  $k3->total_keterampilan) / 2 )  ;	
		    			}
		    			elseif(!empty($k3->total_keterampilan))
		    			{
		    				$na = round ( $k3->total_keterampilan ) ;	
		    			}
		    			else
		    			{
		    				$na = 0;
		    			}
		    			
		    			if($na < $cs->kkm_value):
		    				$nilai_naik[$row->student_id][] = $na; 
		    			endif	
		    		@endphp
		    		
		    		<td  style="text-align:center" > {{  (!empty($k3->total_pengetahuan)) ? $k3->total_pengetahuan : 0 }}</td>
	   				<td  style="text-align:center" > {{ (!empty($k3->total_keterampilan)) ? $k3->total_keterampilan : 0 }} </td>
	   				<td style="text-align:center" >  {{$na}} </td>
		    	@endforeach

		    	<!-- ini untuk kolom rata rata -->
		    		@php
                     $k3_tot = \DB::table('raport')->where('student_id',$row->student_id)->where('step_study_id',stepStudyActive())->get();
                     
                     $tot_rata2_peng = 0;
                     $course_tot_peng = 0;
                     $tot_rata2_ket = 0;
                     $course_tot_ket = 0;
		    		@endphp
		    		
		    	<td  style="text-align:center">

		    		@foreach($k3_tot as $kt)
		    			@if($kt->total_pengetahuan > 0)
		    				@php
		    					$tot_rata2_peng  +=$kt->total_pengetahuan;
		    					$course_tot_peng++;
		    				@endphp
		    			@endif
		    			
		    		@endforeach
		    		@php
		    			$t_peng = round($tot_rata2_peng / $course_tot_peng);
		    		@endphp
		    		{{ $t_peng }}
		    		
		    	</td>
		    	<td  style="text-align:center">
		    		@foreach($k3_tot as $kt)
		    			@if($kt->total_pengetahuan > 0)
		    				@php
		    					$tot_rata2_ket  +=$kt->total_keterampilan;
		    					$course_tot_ket++;
		    				@endphp
		    			@endif
		    			
		    		@endforeach
		    		@php
		    			$t_ket = round($tot_rata2_ket / $course_tot_ket);
		    		@endphp
		    		{{ $t_ket }}
		    	</td>
		    	<td style="text-align:center">
		    		{{ round ( ($t_peng + $t_ket) / 2 ) }}
		    	</td>

		    	<!-- Ini untuk kolom sikap -->
				@php
		    	$ki1 = \DB::select("select count(*) as SB, ( 
				        select count(*)  from observasi o
				        where o.observasi_category = 'spiritual'
				        and observasi_value  = 'PB'
				        and student_id = '".$row->student_id."'   
				    ) as PB , (select count(*)  from observasi o
				        where o.observasi_category = 'spiritual'
				        and observasi_value  = 'B'
				        and student_id = '".$row->student_id."') as B
				from observasi o
				where o.observasi_category = 'spiritual'
				and observasi_value  = 'SB'
				and student_id = '".$row->student_id."'  
				;");
				$ki2 = \DB::select("select count(*) as SB, ( 
				        select count(*)  from observasi o
				        where o.observasi_category = 'sosial'
				        and observasi_value  = 'PB'
				        and student_id = '".$row->student_id."'   
				    ) as PB , (select count(*)  from observasi o
				        where o.observasi_category = 'sosial'
				        and observasi_value  = 'B'
				        and student_id = '".$row->student_id."') as B
				from observasi o
				where o.observasi_category = 'sosial'
				and observasi_value  = 'SB'
				and student_id = '".$row->student_id."'  
				;");

		    	@endphp
		    	<td style="text-align:center">
		    		@php
		    			if($ki1[0]->sb >=2)
		    			{
		    				echo 'SB';
		    			}
		    			else
		    			{
		    				echo 'B';
		    			}
		    		@endphp
		    	</td>
		    	<td style="text-align:center">
		    		@php
		    			if($ki2[0]->sb >=2)
		    			{
		    				echo 'SB';
		    			}
		    			else
		    			{
		    				echo 'B';
		    			}
		    		@endphp
		    	</td>


		    	<!-- ini untuk kolom absensi -->

		    	@php	
		    	$absensi_s = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
		    	->where('student_id',$row->student_id)
		    	->where('absensi_type','S')
		    	->where('step_study_id',stepStudyActive())
		    	->first();
		    	$absensi_i = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
		    	->where('student_id',$row->student_id)
		    	->where('absensi_type','I')
		    	->where('step_study_id',stepStudyActive())
		    	->first();
		    	$absensi_a = \DB::table('absensi')->select(\DB::raw('sum(absensi_total) as tot_absensi'))
		    	->where('student_id',$row->student_id)
		    	->where('absensi_type','A')
		    	->where('step_study_id',stepStudyActive())
		    	->first();
			    @endphp
			    
				 <td style="text-align:center" >{{$absensi_s->tot_absensi}}</td>
				 <td style="text-align:center" >{{$absensi_i->tot_absensi}}</td>
				 <td style="text-align:center" >{{$absensi_a->tot_absensi}}</td>
				
			    <!-- ini untuk kolom keterangan -->
			

				@foreach($nilai_naik as $key => $nn)
					@if($row->student_id == $key)
						@if( count($nilai_naik[$row->student_id]) == 3  )
							<td  style="text-align:center">  </td>
	    					<td  style="text-align:center"> V </td>
						@else
							<td  style="text-align:center"> V </td>
	    					<td  style="text-align:center">  </td>
						@endif
	    				
	    			@endif		    		
		    	@endforeach
						    	 
				{{--  <td>asem</td>
				 <td>tes</td>
			     --}}
		   

           	</tr>
           	
        @php
        	$no++;
        @endphp  

        @endforeach

{{--        {{dd($nilai_naik)}}
 --}}



    </tbody>
</table>



