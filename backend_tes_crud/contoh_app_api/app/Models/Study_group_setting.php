<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Study_group_setting extends Model
{
    //

    protected $table = 'study_group_setting';
    protected $primaryKey = 'study_group_setting_id';
    protected $guarded = [];
    public $timestamps= false;

    public function student()
    {
    	return $this->hasOne(M_student::class,'student_id','student_id');
    }


    public function study_group()
    {
    	return $this->hasOne(M_study_group::class,'study_group_id','study_group_id');
    }

    public function class_grade()
    {
        return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
    }


    

}
