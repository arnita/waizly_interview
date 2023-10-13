<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course_setting extends Model
{
    
    protected $table = 'course_setting';
    protected $primaryKey = 'course_setting_id';
    protected $guarded = [];
    public $timestamps= false;

    public function course()
    {
    	return $this->hasOne(M_course::class,'course_id','course_id');
    }


    public function study_group()
    {
    	return $this->hasOne(M_study_group::class,'study_group_id','study_group_id');
    }

    public function employee()
    {
    	return $this->hasOne(M_employee::class,'employee_id','employee_id');
    }
}
