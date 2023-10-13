@php $loop_uh = ['U2','P1','P2','U1']; @endphp
<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered" border="1">
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
            <th style="font-weight:bold; "> Nama Mata Pelajaran </th>
            <th style="font-weight:bold; ">:</th>
            <th style="font-weight:bold; ">  {{  (!empty($data['dt_k'][0])) ? $data['dt_k'][0]->course_name  : "" }}  </th>
        </tr>


        <tr>
        	<td></td>
        	<td></td>
        </tr>


        <tr style="background-color: green">
        	<td >Unjuk Kerja (U)</td>
        </tr>
        <tr style="background-color: green">
        	<td>Produk (P1)</td>
        </tr>
        <tr style="background-color: green">
        	<td>Proyek (P2)</td>
        </tr>

        <tr>
        	<td></td>
        	<td></td>
        </tr>
	  	<tr>
		    <th rowspan ="3" style="text-align:center" >No</th>
		    <th rowspan ="3"  style="text-align:center">ID</th>
		    <th rowspan ="3"  style="text-align:center"> Nama </th>
			<th rowspan ="3"  style="text-align:center"> Jenis Kelamin </th>
			@foreach($data['dt_k'] as $dd)
				@foreach($loop_uh as $lu)
					<td style="text-align: center;">{{$dd->kd_id}}</td>
				@endforeach
		 	@endforeach
	   </tr>
	   <tr>
		 @foreach($data['dt_k'] as $dd)
			@foreach($loop_uh as $lu)
				<td style="text-align: center;">{{$dd->kd_code}}</td>
			@endforeach
		@endforeach
	   </tr>
	   <tr>
	   		@foreach($data['dt_k'] as $dd)
	   			@php
	   				 $val_ex =\DB::table('setting_daily_exercise')
                    ->where('kd_id',$dd->kd_id)
                    ->where('step_study_id',stepStudyActive())
                    ->get();
				@endphp

				@if(empty($val_wx))
					@foreach($loop_uh as $val)
						<td  style="text-align: center;">{{$val}}</td>
					@endforeach	
				@else
					@foreach($val_ex as $ve)
						<td  style="text-align: center;">{{$ve->skill_type}}</td>
					@endforeach
				@endif
	   			
	   		@endforeach
	   </tr>
	 
	</thead>
	<tbody>
		@php
			$no = 1;	
			$tot_val = 0;
		@endphp
		@foreach($data['data_siswa'] as $row)
		    <tr   rowspan="2">   
		        <td   style="text-align:center;vertical-align: top" >{{$no}}</td>
		        <td    style="text-align:center;vertical-align: top" >{{$row->student_id}}</td>
		        <td    style="text-align:center;vertical-align: top" >{{$row->student_name}}</td>
		        <td    style="text-align:center;vertical-align: top" >{{$row->student_gender}}</td>
		         @foreach($data['dt_k'] as $dd)
		         		@php
                        $val_ex =\DB::table('setting_daily_exercise')
                        ->where('kd_id',$dd->kd_id)
                        ->where('step_study_id',stepStudyActive())
                        ->get();
                        @endphp
                        @foreach($val_ex as $ve)
	                        @php
	                            $ori_val =\DB::table('daily_exercise_skill')
	                            ->where('kd_id',$dd->kd_id)
	                            ->where('student_id',$row->student_id)
	                            ->where('skill_type',$ve->skill_type)
	                            ->where('step_study_id',stepStudyActive())
	                            ->first();
	                            $val_ori = (!empty($ori_val)) ? $ori_val->skill_value :"";
	                        @endphp
                            <td style="text-align: center;">{{$val_ori}}</td> 
                        @endforeach
                  @endforeach    
                
		 	</tr>
	
			@php 
				$no++;
			@endphp
	    @endforeach
	 

	    
	</tbody>
</table>



