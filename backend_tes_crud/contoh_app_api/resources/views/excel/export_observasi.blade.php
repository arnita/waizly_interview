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
		    <th rowspan ="2" >No</th>
		    <th rowspan ="2" >ID</th>
		    <th rowspan ="2"  style="text-align:center"> Nama </th>
		   	<th  rowspan ="2"> Jenis Kelamin</th>
		   @php
        		$spiritual=  \App\Models\Parlookup::where('category','spiritual')->get();

        		$sosial =  \App\Models\Parlookup::where('category','sosial')->get();
        	@endphp
        	@foreach($spiritual as $sp)
        		@foreach($type as $tp)
        			<th> {{$sp->name}}</th>
        		@endforeach
        	@endforeach

        	@foreach($sosial as $so)
        		@foreach($type as $tp)
        			<th>{{$so->name}}</th>
        		@endforeach
        	@endforeach
	   </tr>
	   

	   <tr>
	   		@foreach($spiritual as $sp)
	   			@foreach($type as $tp)
        			<th>{{$tp}}</th>
        		@endforeach
        	@endforeach
        	@foreach($sosial as $so)
	   			@foreach($type as $tp)
        			<th>{{$tp}}</th>
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
		        @foreach($spiritual as $sp)			
		        	@foreach($type as $tp)
			        	@php
				        	$data_sp = \App\Models\Observasi::
					        where('student_id',$row->student_id)
					        ->where('step_study_id',stepStudyActive())
					        ->where('observasi_category','spiritual')
					        ->where('observasi_type',$sp->name)
					        ->where('observasi_value',$tp)
					        ->first();
					         $sp_value  = (!empty($data_sp)) ? $data_sp->observasi_value : "";
			        	@endphp
    				<td> {{$sp_value}} </td>
	    			@endforeach
	    		@endforeach

	    		@foreach($sosial as $so)
	    			@foreach($type as $tp)
				        @php
				        	$data_so = \App\Models\Observasi::
					        where('student_id',$row->student_id)
					        ->where('step_study_id',stepStudyActive())
					        ->where('observasi_category','sosial')
					        ->where('observasi_type',$so->name)
						     ->where('observasi_value',$tp)
					        ->first();
					         $so_value  = (!empty($data_so)) ? $data_so->observasi_value : "";
				        @endphp
    				<td> {{$so_value}} </td>
	    			@endforeach
	    		@endforeach

		 </tr>
		@php 
			$no++;
		@endphp
	    @endforeach
	    
	</tbody>
</table>



