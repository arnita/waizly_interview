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
		    <th >No</th>
		    <th >ID</th>
		    <th  style="text-align:center"> Nama </th>
		   	<th > Jenis Kelamin</th>
		   	
		   	@for($i=1;$i<3;$i++)
		   			<th  style="text-align: center;"> Prestasi-{{$i}} </th>	
		   	@endfor
	   </tr>
	   	{{-- 
	   	<tr>
		   	@for($i=1;$i<3;$i++)
			   		<td style="text-align: center">Jenis Prestasi-{{$i}}</td>
			   		
		   	@endfor
	   	</tr> --}}
	 


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
		         @for($i=1;$i<3;$i++)
                	@php
                     $ab= \App\Models\Prestation::
                    where('student_id',$row->student_id)
                    ->where('step_study_id',stepStudyActive())
                    ->where('type',$i)
                    ->first();
                        $val  = (!empty($ab)) ? $ab->value : "";
                        $desc  = (!empty($ab)) ? $ab->desc : "";
                    @endphp
                    <td  style="text-align: center;">{{$val}} - {{$desc}} </td>
                @endfor

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



