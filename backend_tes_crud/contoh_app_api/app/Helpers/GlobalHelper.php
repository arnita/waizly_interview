<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Config;
use GuzzleHttp as GuzzleHttp; 
use DB as DB;


function uploadFile($file, $path, $originalName = false)
{
    if ($originalName === true) {
        $filename = preg_replace('@[^0-9a-z\.\s]+@i', '', $file->getClientOriginalName());
        $filename = str_replace(' ', '-', $filename);
    } elseif ($originalName) {
        $filename = $originalName . '.' . $file->getClientOriginalExtension();
    } else {
        $filename = strtoupper(str_random(10)) . '-' . time() . '.' . $file->getClientOriginalExtension();
    }

    $file->move($path,$filename);

    return $filename;   
}

function toIndonesia($date)
{
    if($date == null)
    {
        $date_ = date('Y-m-d');
    }
    else
    {
        $date_ = $date;
    }
    $bulan = array (
        1 =>   'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $pecahkan = explode('-', $date_); 
    return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
} 


function yearActive()
{
	$dt = \App\Models\M_unit_year::where('unit_year_status','active')->first();
	
	if(empty($dt))
	{
		return false;
	}
	return $dt->unit_year_id; 

}

function stepStudyActive()
{
	$year_id =  \App\Models\M_unit_year::where('unit_year_status','active')->first();
	
	if(!empty($year_id))
	{
		$dt = \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',$year_id->unit_year_id)->first();	
		if(empty($dt))
		{
			return false;
		}
		return $dt->step_study_id; 
	}
	else
	{
		return false;
	}
}

function stepStudyActiveJson()
{

	$year_id =  \App\Models\M_unit_year::where('unit_year_status','active')->first();
	
	if(!empty($year_id))
	{
		$dt = \App\Models\M_step_study::where('step_study_status','active')->where('unit_year_id',$year_id->unit_year_id)->first();	
        $year =  \App\Models\M_unit_year::where('unit_year_status','active')->first();
		if(empty($dt))
		{
			return false;
		}
      	return response()->json(['data' => $dt,'year'=>$year]);

	}
	else
	{
		return false;
	}
}




function gen_abjad($param)
{
    $m='';
    switch ($param){
        case 1 :
            $m = 'A';
        break;
        case 2 :
            $m = 'B';
        break;
        case 3 :
            $m = 'C';
        break;
        case 4 :
            $m = 'D';
        break;
        case 5 :
            $m = 'E';
        break;
        case 6 :
            $m = 'F';
        break;
        case 7 :
            $m = 'G';
        break;
        case 8 :
            $m = 'H';
        break;
        case 9 :
            $m = 'I';
        break;
        case 10 :
            $m = 'J';
        break;
        case 11 :
            $m = 'K';
        break;
        case 12 :
            $m = 'L';
        break;
        case 13 :
            $m = 'M';
        break;
        case 14 :
            $m = 'N';
        break;
        case 15 :
            $m = 'O';
        break;
        case 16 :
            $m = 'P';
        break;
        case 17 :
            $m = 'Q';
        break;
        case 18 :
            $m = 'R';
        break;
        case 19 :
            $m = 'S';
        break;
        case 20 :
            $m = 'T';
        break;
        case 21 :
            $m = 'U';
        break;
        case 22 :
            $m = 'V';
        break;
        case 23 :
            $m = 'W';
        break;
        case 24 :
            $m = 'X';
        break;
        case 25 :
            $m = 'Y';
        break;

        case 26 :
            $m = 'Z';
        break;


        
        default:
            $m = "";
    }
    return $m;
}



function gen_month($param)
{
    $m='';
    switch ($param){
        case 1 :
            $m = 'Januari';
        break;
        case 2 :
            $m = 'Februari';
        break;
        case 3 :
            $m = 'Maret';
        break;
        case 4 :
            $m = 'April';
        break;
        case 5 :
            $m = 'Mei';
        break;
        case 6 :
            $m = 'Juni';
        break;
        case 7 :
            $m = 'Juli';
        break;
        case 8 :
            $m = 'Agustus';
        break;
        case 9 :
            $m = 'September';
        break;
        case 10 :
            $m = 'Oktober';
        break;
        case 11 :
            $m = 'November';
        break;
        case 12 :
            $m = 'Desember';
        break;
        
        default:
            $m = "";
    }
    return $m;
}


function get_kkm($course_id,$val,$study_group_id)
{
    $dt = \App\Models\M_unit_year::where('unit_year_status','active')->first();

    $year = $dt->unit_year_id;
    $dt = \App\Models\M_kkm::where('course_id',$course_id)->where('unit_year_id',$year)->first();

    $nilai = '';

    if($val < $dt->kkm_value)
    {
       return  $nilai = 'D';
    }
    else if($val >= $dt->kkm_value && $val < $dt->kkm_b )
    {
       return  $nilai = 'C';
    }
    else if ( $val >= $dt->kkm_b && $val < $dt->kkm_a )
    {
       return  $nilai  = 'B';
    }
    else if( $val >= $dt->kkm_a) 
    {
      return   $nilai = 'A';
    }
    else 
    {
       return  $nilai = 0;
    }
    // return $nilai;
}

function get_list_student($study_group_id)
{
    $dt = \App\Models\M_unit_year::where('unit_year_status','active')->first();
     return \DB::table('m_student as a')
        ->join('study_group_setting as b','a.student_id','b.student_id')
        ->join('m_study_group as c','c.study_group_id','b.study_group_id')
        ->where('b.study_group_id',$study_group_id)
        ->where('unit_year_id',$dt->unit_year_id)
        ->orderBy('a.student_name','ASC')
        ->get();
}

 function generateRandomString($length = 10) 
 {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
}

function conv_absen($ab)
{
    $rs;
    if($ab=='S')
    {
        $rs = 'Sakit';
    }
    else if($ab=='I')
    {
        $rs = 'Izin';
    }
    else if($ab=='A')
    {
        $rs = 'Alpha';
    }

    return $rs;
}


