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
		    <th rowspan ="2" >No</th>
		    <th rowspan ="2" >ID</th>
		    <th rowspan ="2"  style="text-align:center"> Nama </th>
		   	<th  rowspan ="2"> Jenis Kelamin</th>
		   	@foreach($data['category']  as $m)
		   		<th  style="text-align: center;"> {{$m->name}} </th>	
		   	@endforeach
	   </tr>
	   	
	   	<tr>
	   		@foreach($data['category']  as $m)
		   		<td style="text-align: center">Nilai</td>
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
		        @foreach($data['category']  as $m)
			   			@php
			   				 $ab= \App\Models\Extracurricular::
					        where('student_id',$row->student_id)
					        ->where('step_study_id',stepStudyActive())
					        ->where('type',$m->name)
					        ->first();
					  			$value  = (!empty($ab)) ? $ab->value : "";
					  			$desc  = (!empty($ab)) ? $ab->desc : "";
					    @endphp
			   			<td  style="text-align: center;"> 
					        {{$value}}-{{$desc}}
			   			</td>
			   	@endforeach

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



