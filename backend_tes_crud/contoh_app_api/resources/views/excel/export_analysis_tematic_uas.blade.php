@php
	$tot = 0;
	//dd($data['walas']->employee->employee_name);
@endphp
@foreach($data['data_bobot_val'] as $row)
	@php
		$tot += $row->quality_question;
	@endphp
@endforeach

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
            <th style="font-weight:bold; "> Nama Tema </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{  $data['data_tema']->structure_tematic_name  }}  </th>
        </tr>

        <tr>
            <th style="font-weight:bold; "> ID Tema </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; text-align: left; " >  {{ $data['data_tema']->structure_tematic_id  }}   </th>
        </tr>

        <tr>
        	<td></td>
        	<td></td>
        </tr>
	  <tr>
	    <th  rowspan="7" >No</th>
	    <th  rowspan="7" >ID</th>
		<th  rowspan="7"  style="text-align:center"> Nama </th>
		@foreach($data['data_bobot_val'] as $row)
			<th style="text-align: right;"  >{{ $row->kd_id  }}</th>
		@endforeach
	  </tr>

	  <tr>
	  	<th colspan="{{ count($data['data_bobot_val']) }}"  style="text-align:center">KD</th>
	  </tr>

	  <tr>
	    @foreach($data['data_bobot_val'] as $row)
	    	<td style="text-align: right;"  >{{$row->kd_code}} </td>
	    @endforeach
	  </tr>
	  <tr>
	    <th colspan="{{ count($data['data_bobot_val']) }}"  style="text-align:center"> Bobot </th>
	  </tr>
	  <tr>
	  	@foreach($data['data_bobot_val'] as $row)
	    	<td>{{ $row->quality_question  }} </td>
	    @endforeach
	    <td> {{$tot}} </td>
	  </tr> 
	  <tr>
	    <th colspan="{{ count($data['data_bobot_val']) }}"  style="text-align:center"> Soal </th>
	   	<!-- <td>Nilai Akhir</td> -->
	  </tr>
	  <tr>
	  	@foreach($data['data_bobot_val'] as $row)
	    	<td>{{ $row->number_question  }} </td>
	    @endforeach
	  </tr>
	</thead>
	<tbody>
		@php
			$no = 1;
			$tot_val = 0;
			$var_kd = [];
		@endphp
		@foreach($data['data_siswa'] as $row)
		    <tr>   
		        <td>{{$no}}</td>
		        <td>{{$row->student_id}}</td>
		        <td>{{$row->student_name}}</td>
			        
 					@foreach($data['data_bobot_val'] as $r)
			    		@php	
							$var_kd[] = $r->kd_id;
				        	$det = \DB::table('input_analysis_tema')
				        	->where('student_id',$row->student_id)
				        	->where('number_question',$r->number_question)
				   			->where('kd_id',$r->kd_id)
							->where('step_study_id',stepStudyActive())
				        	->where('input_analysis_tema_type','uas')->first();
				        	$val_q = ( empty($det->value_quality) )  ? 0 : $det->value_quality ;
				        @endphp
			    <td> {{$val_q}} </td>

	    			@endforeach		

	    			@php

		            $q_vl = \DB::table('input_analysis_tema')
		            ->select(\DB::raw("sum(value_quality::integer) as tot"))
		            ->where('student_id',$row->student_id)
		            ->where('input_analysis_tema_type','uas')
					->whereIn('kd_id',array_unique($var_kd))
		            ->first();

		            @endphp

		           <!--  @if(!empty($data['total_bobot']))
		           
		                @php 
		                	$v_q = (!empty($q_vl->tot)) ?  $q_vl->tot  : 0; 
		                @endphp
		                <td>{{round($v_q*100/$data['total_bobot'])}}</td>;    
		            @else
		                <td>0</td>;
		            @endif -->
		            
	    			
		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	</tbody>
</table>



