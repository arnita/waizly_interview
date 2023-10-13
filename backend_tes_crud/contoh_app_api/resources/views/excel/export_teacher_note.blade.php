<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered">
	<thead>
		@php 
			$year = \App\Models\M_unit_year::where('unit_year_status','active')->first(); 
		@endphp
		<tr>
            <th style="font-weight:bold; ">Kelas </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; "> {{ $data['walas']->study_group->study_group_name  }} /  {{$year->unit_year_name}}  </th>
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
		    <th>No</th>
		    <th>ID</th>
		    <th style="text-align:center"> Nama </th>
		   	<th>
		   		Narasi Rapor PTS
		   	</th>
		   	<th>
		   		Narasi Rapor PAS
		   	</th>
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
	   			@php
	   				 $ab= \App\Models\TeacherNote::
			        where('student_id',$row->student_id)
			        ->where('step_study_id',stepStudyActive())
			        ->first();
			  			$raport_pts  = (!empty($ab)) ? $ab->raport_pts : "";
			  			$raport_pas  = (!empty($ab)) ? $ab->raport_pas : "";
			    @endphp
	   			<td  style="text-align: left;"> 
					{{$raport_pts}}
	   			</td>
	   			<td  style="text-align: left;"> 
					{{$raport_pas}}
	   			</td>
		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



