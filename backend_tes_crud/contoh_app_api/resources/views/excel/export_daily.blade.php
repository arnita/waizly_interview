@php $loop_uh = ['1','2','3','4']; @endphp
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
		    <th rowspan ="3" style="text-align:center">No</th>
		    <th rowspan ="3"  style="text-align:center"> Nama </th>
			<th  rowspan ="3" style="text-align:center"> Jenis Kelamin </th>
			<th rowspan ="3" style="text-align:center">ID Siswa</th>
			<th  rowspan ="3" style="text-align:center"> ID KD </th>
		   	<th  rowspan ="3" style="text-align:center"> Kode KD</th>
			

		   	
			@foreach($data['structure_tematic'] as $dt)
				@foreach($loop_uh as $lu)
					<th style="text-align:center;vertical-align: top" >{{$dt->structure_tematic_id}}</th>
				@endforeach
			@endforeach	
	   </tr>

	   	<tr>
			@foreach($data['structure_tematic'] as $dt)
				@foreach($loop_uh as $lu)
					<th style="text-align:center;vertical-align: top" >{{$dt->structure_tematic_name}}</th>
				@endforeach
			@endforeach	
		</tr>
	   <tr>
		   @foreach($data['structure_tematic'] as $dt)
 				@foreach($loop_uh as $lu)
		   			<th style="text-align:center;vertical-align: top" >PH-{{$lu}}</th>
		   		@endforeach
		   	@endforeach
	   </tr>

	</thead>
	<tbody>
		@php
			$no = 1;	
			$tot_val = 0;
			$rowsp = (empty($data['tot_d'])) ? "1" : $data['tot_d'] ;
		@endphp
		
		@if(!empty($data['data_siswa']))
		
		@foreach($data['data_siswa'] as $row)
		    <tr   rowspan="2">   
		        <td rowspan="{{$rowsp}}"  style="text-align:center;vertical-align: top" >{{$no}}</td>
		        <td  rowspan="{{$rowsp}}"  style="text-align:center;vertical-align: top" >{{$row->student_name}}</td>
		        <td  rowspan="{{$rowsp}}"  style="text-align:center;vertical-align: top" >{{$row->student_gender}}</td>


		        @if(!empty($data['data_kd2']))		        	

		        	@for($i= 0;$i<1;$i++)
		        		<td  style="text-align:center;vertical-align: top" >{{$row->student_id}}</td>
					   	<td style="text-align:center;vertical-align: top">{{$data['data_kd2'][$i]->kd_detail_id}}</td>
			        	<td style="text-align:center;vertical-align: top">{{$data['data_kd2'][$i]->kd_code}}</td>
		        	@endfor

{{-- 
					@foreach($data['data_kd1'] as $row1)
					   <td  style="text-align:center;vertical-align: top" >{{$row->student_id}}</td>
					   	<td style="text-align:center;vertical-align: top">{{$row1->kd_detail_id}}</td>
			        	<td style="text-align:center;vertical-align: top">{{$row1->kd_code}}</td>
			        @endforeach
 --}}
			      
			      	@for($a= 0;$a<1;$a++)
{{-- 			     	@foreach($data['data_kd1'] as $row1)
 --}}				    @foreach($data['structure_tematic'] as $dt)
			 				@foreach($loop_uh as $lu)
			 					@php
			 						$data_ex = \App\Models\Daily_exercise::where('student_id',$row->student_id)
						            ->where('kd_detail_id',$data['data_kd2'][$a]->kd_detail_id)
						            ->where('daily_exercise_type',$lu)
						            ->where('structure_tematic_id',$dt->structure_tematic_id)
						            ->where('kd_type','Pengetahuan')
						            ->first();
						            $val_val1 = !empty($data_ex) ? $data_ex->score :'';
			 					@endphp
					   			<th style="text-align:center;vertical-align: top" >{{$val_val1}}</th>
					   		@endforeach
					   	@endforeach
					@endfor

		        @endif

		 	</tr> 
			@for($b= 1;$b<count($data['data_kd2']);$b++)
		 	{{-- @foreach($data['data_kd2'] as $row2) --}}
			<tr>
				<td  style="text-align:center;vertical-align: top" >{{$row->student_id}}</td>
				<td style="text-align:center;vertical-align: top">{{$data['data_kd2'][$b]->kd_detail_id}}</td>
				<td style="text-align:center;vertical-align: top">{{$data['data_kd2'][$b]->kd_code}}</td>

			 	 	@foreach($data['structure_tematic'] as $ddt)
		 				@foreach($loop_uh as $ll)
		 					@php
		 						$data_ex = \App\Models\Daily_exercise::where('student_id',$row->student_id)
					            ->where('kd_detail_id',$data['data_kd2'][$b]->kd_detail_id)
					            ->where('daily_exercise_type',$ll)
					            ->where('structure_tematic_id',$ddt->structure_tematic_id)
					            ->where('kd_type','Pengetahuan')
					            ->first();
					            $val_val = !empty($data_ex) ? $data_ex->score :'';
		 					@endphp
				   			<th style="text-align:center;vertical-align: top" >{{$val_val}}</th>
				   		@endforeach
				   	@endforeach
			</tr>
			@endfor
			
	
			@php 
				$no++;
			@endphp
		@endforeach
		@endif
	 
	{{--     <tr>
	    	<td>asem</td>
	    </tr> --}}


	    
	</tbody>
</table>



