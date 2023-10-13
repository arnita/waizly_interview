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
		   	<th  rowspan ="3"> Jenis Kelamin</th>
		   	@foreach($data['month']  as $m)
		   		<th colspan="3" style="text-align: center;"> {{gen_month($m)}} </th>
		   	@endforeach
	   </tr>
	   <tr>
	   		@foreach($data['month']  as $m)
		   		@foreach($loop_month as $lm)
		   			<td  style="text-align: center;"> {{$m}} </td>
		   		@endforeach
	   		@endforeach
	   </tr>
	   <tr>
	   	@foreach($data['month']  as $m)
	   		@foreach($loop_month as $lm)
	   			<td  style="text-align: center;"> {{$lm}} </td>
	   		@endforeach
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
		        <td>{{$row->student_gender}}</td>
		        @foreach($data['month']  as $m)
			   		@foreach($loop_month as $lm)
			   			@php
			   				 $ab= \App\Models\Absensi::
					        where('student_id',$row->student_id)
					        ->where('step_study_id',stepStudyActive())
					        ->where('month',$m)
					        ->where('absensi_type',$lm)
					        ->first();
					  			$dd  = (!empty($ab)) ? $ab->absensi_total : "";
					    @endphp
			   			<td  style="text-align: center;"> 
					        {{$dd}}
			   			</td>
			   		@endforeach
			   	@endforeach

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



