<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_kd extends Model
{
    //
    protected $table = 'm_kd';
    protected $primaryKey = 'kd_id';
    protected $guarded = [];
    public $timestamps= false;


    public function unit_year()
    {
    	return $this->hasOne(M_unit_year::class,'unit_year_id','unit_year_id');
    }



    public function course()
    {
    	return $this->hasOne(M_course::class,'course_id','course_id');
    }

}
