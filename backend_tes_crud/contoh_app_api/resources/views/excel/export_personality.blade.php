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
 				$personality =  \App\Models\Parlookup::where('category','personality')->get();
            @endphp
        	@foreach($personality as $th)
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
		        <td style="text-align:center">{{$no}}</td>
		        <td style="text-align:center">{{$row->student_id}}</td>
		        <td style="text-align:center">{{$row->student_name}}</td>
		        <td style="text-align:center">{{$row->student_gender}}</td>
		        @foreach($personality as $dt)
                	@php
                    $data_sp = \App\Models\Personality::
                    where('student_id',$row->student_id)
                    ->where('step_study_id',stepStudyActive())
                    ->where('personality_type',$dt->name)
                    // ->where('personality_value',$dt->personality_value)
                    ->first();
                     $sp_value  = (!empty($data_sp)) ? $data_sp->personality_value : "";
                    @endphp
                    <td style="text-align:center">{{$sp_value}}</td>
                 @endforeach

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



