@php
	$tot = 0;
	//dd($data['walas']->employee->employee_name);
@endphp
@foreach($data['data_bobot'] as $row)
	@php
		$tot += $row->quality_question;
	@endphp
@endforeach

<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered">
	<thead>

		<tr>
            <th style="font-weight:bold; ">Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; "> {{ $data['walas']->study_group->study_group_name  }}-{{ $data['walas']->study_group->study_group_id  }}   </th>
        </tr>
        <tr>
            <th style="font-weight:bold; ">Wali Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{ $data['walas']->employee->employee_name  }}  </th>
        </tr> 

        <tr>
            <th style="font-weight:bold; "> Nama Mata Pelajaran </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{  (!empty($data['data_bobot'][0])) ? $data['data_bobot'][0]->course_name.'-'.$data['data_bobot'][0]->course_id  :"" }}  </th>
        </tr>

    
        <tr>
        	<td></td>
        	<td></td>
        </tr>
	  <tr>
	    <th  rowspan="6" >No</th>
	    <th  rowspan="6" >ID</th>
	    <th  rowspan="6"  style="text-align:center"> Nama </th>
	    <th colspan="{{ count($data['data_bobot']) }}"  style="text-align:center">KD</th>
	  </tr>
	  <tr>
	    @foreach($data['data_bobot'] as $row)
	    	<td>{{ $row->kd_id  }} </td>
	    @endforeach
	  </tr>
	  <tr>
	    <th colspan="{{ count($data['data_bobot']) }}"  style="text-align:center"> Bobot </th>
	  </tr>
	  <tr>
	  	@foreach($data['data_bobot'] as $row)
	    	<td>{{ $row->quality_question  }} </td>
	    @endforeach
	    <td> {{$tot}} </td>
	  </tr> 
	  <tr>
	    <th colspan="{{ count($data['data_bobot']) }}"  style="text-align:center"> Soal </th>
	   	<!-- <td>Nilai Akhir</td> -->
	  </tr>
	  <tr>
	  	@foreach($data['data_bobot'] as $row)
	    	<td>{{ $row->number_question  }} </td>
	    @endforeach
	  </tr>
	</thead>
	<tbody>
		@php
			$no = 1;
			$tot_val = 0;
			$arr_val = [];
		@endphp
		@foreach($data['data_siswa'] as $row)
		    <tr>   
		        <td>{{$no}}</td>
		        <td>{{$row->student_id}}</td>
		        <td>{{$row->student_name}}</td>
			        @foreach($data['data_bobot'] as $r)
			    		@php	
				        	$det = \DB::table('input_analysis')->where('kd_id',$r->kd_id)
							->where('step_study_id',stepStudyActive())
							->where('student_id',$row->student_id)->where('number_question',$r->number_question)->where('input_analysis_type','uts')->first();
				        	$val_q = ( empty($det->value_quality) )  ? 1 : $det->value_quality ;
				        	$arr_val[] = $r->kd_id;
				        @endphp
			    <td> {{$val_q}} </td>

	    			@endforeach			
	    		@php	
		        	$q_vl = \DB::table('input_analysis')->select(\DB::raw("sum(value_quality::integer) as tot"))
					->where('step_study_id',stepStudyActive())
					->where('student_id',$row->student_id)->where('input_analysis_type','uts')->whereIn('kd_id',$arr_val)->first();
		        @endphp
		        <!-- @if($tot == 0)
		        	<td></td>
		        @else
		        	<td> {{ $q_vl->tot/$tot*100 }} </td>
		        @endif
			     -->
		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	</tbody>
</table>



