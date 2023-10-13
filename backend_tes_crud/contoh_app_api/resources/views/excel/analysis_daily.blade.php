@php
	$tot = 0;
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
            <th style="font-weight:bold; "> {{ $data['walas']->study_group->study_group_name  }}  </th>
        </tr>
        <tr>
            <th style="font-weight:bold; ">Wali Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{ $data['walas']->employee->employee_name  }}  </th>
        </tr>
        <tr>
        	<th style="font-weight:bold; "> Muatan </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; "> {{ $data['kd']->course_name  }}  </th>
        </tr>
        <tr>
        	<th style="font-weight:bold; "> Kode KD </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold;text-align:left "> {{ $data['kd']->kd_code  }}    </th>
        </tr>
        <tr>
        	<th style="font-weight:bold; "> KD  ID </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold;text-align:left "> {{$data['kd']->kd_id}}    </th>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        </tr>
	   <tr>
	    <th  rowspan="4" >No</th>
	    <th  rowspan="4" >ID</th>
	    <th  rowspan="4"  style="text-align:center"> Nama </th>
	    <th colspan="{{count($data['data_bobot'])}}"  style="text-align:center">Bobot</th>
	    <td rowspan="2">{{$tot}}</td>
	  </tr>
	  <tr>
	    @foreach($data['data_bobot'] as $row)
	    	<td>{{$row->quality_question}}</td>
	    @endforeach
	  </tr>
	  <tr>
	    <th colspan="{{count($data['data_bobot'])}}"  style="text-align:center"> Soal </th>
	    <!-- <td rowspan="2">Nilai Akhir</td> -->
	  </tr>
	  <tr>
	  	@foreach($data['data_bobot'] as $row)
	    	<td>{{$row->number_question}}</td>
	    @endforeach
	  </tr>
	</thead>
	<tbody>
		@php
			$no = 1;
			$tot_val = 0;
		@endphp
		@foreach($data['data_siswa'] as $row)
		    <tr>   
		        <td>{{$no}}</td>
		        <td>{{$row->student_id}}</td>
		        <td>{{$row->student_name}}</td>
			        @foreach($data['data_bobot'] as $r)
			    		@php	
							$det = \DB::table('input_analysis')
							->where('kd_id',$r->kd_id)
							->where('student_id',$row->student_id)
							->where('number_question',$r->number_question)
							->where('step_study_id',stepStudyActive())
							->where('input_analysis_type','daily')->first();
				        	$val_q = ( empty($det->value_quality) )  ? 1 : $det->value_quality ;
				        @endphp
			    <td> {{$val_q}} </td>

	    			@endforeach			
	    		@php	
					$q_vl = \DB::table('input_analysis')
					->select(\DB::raw("sum(value_quality::integer) as tot"))
					->where('kd_id',$data['data_bobot'][0]->kd_id)
					->where('student_id',$row->student_id)
					->where('step_study_id',stepStudyActive())
					->where('input_analysis_type','daily')->first();
		        @endphp
		        <!-- @if($tot == 0)
		        	<td></td>
		        @else
		        	<td> {{ $q_vl->tot/$tot*100 }} </td>
		        @endif -->
			    
		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	</tbody>
</table>



