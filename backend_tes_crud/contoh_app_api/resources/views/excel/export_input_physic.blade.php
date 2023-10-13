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
	    <th style="text-align:center" colspan="{{count($data['fisik'])}}" > Fisik </th>
	    <th  style="text-align:center" colspan="{{count($data['kesehatan'])}}"> Kesehatan </th>
	  </tr>
	  	<tr>
	  		@foreach($data['fisik'] as $row)
    			<td> {{$row->name}} </td>
	    	@endforeach
	    	@foreach($data['kesehatan'] as $row)
    			<td> {{$row->name}} </td>
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
		        <td  style="text-align:center">{{$no}}</td>
		        <td  style="text-align:center">{{$row->student_id}}</td>
		        <td>{{$row->student_name}}</td>
		        @foreach($data['fisik'] as $fs)
		        	@php
			        	$data_phy = \App\Models\PhysicalStudent::
				        where('student_id',$row->student_id)
				        ->where('step_study_id',stepStudyActive())
				        ->where('physical_category','Fisik')
				        ->where('physical_type',$fs->name)
				        ->first();
				         $physical_value  = (!empty($data_phy)) ? $data_phy->physical_value : "";
		        	@endphp
    				<td  style="text-align:center"> {{$physical_value}} </td>
	    		@endforeach

	    		@foreach($data['kesehatan'] as $kes)
			        @php
			        	$data_kes = \App\Models\PhysicalStudent::
				        where('student_id',$row->student_id)
				        ->where('step_study_id',stepStudyActive())
				        ->where('physical_category','Kesehatan')
				        ->where('physical_type',$kes->name)
				        ->first();
				         $kes_value  = (!empty($data_kes)) ? $data_kes->physical_value : "";
			        @endphp
    				<td  style="text-align:center"> {{$kes_value}} </td>
	    		@endforeach
		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



