@php
	$type = ['SB','PB'];
@endphp
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
		    <th style="text-align:center">No</th>
		    <th style="text-align:center">ID</th>
		    <th style="text-align:center"> Nama </th>
		   	<th style="text-align:center"> Jenis Kelamin</th>
		   	@php
 				$tahfizh =  \App\Models\Parlookup::where('category','tahfizh')->get();
            @endphp
        	@foreach($tahfizh as $th)
        		<th>{{$th->name}}</th>
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
		        @foreach($data['data_tahfizh'] as $dt)
                	@php
                    $data_sp = \App\Models\Tahfizh::
                    where('student_id',$row->student_id)
                    ->where('step_study_id',stepStudyActive())
                    ->where('tahfizh_type',$dt->tahfizh_type)
                    ->where('tahfizh_value',$dt->tahfizh_value)
                    ->first();
                     $sp_value  = (!empty($data_sp)) ? $data_sp->tahfizh_value : "";
                    @endphp
                    <td>{{$sp_value}}</td>
                 @endforeach

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



