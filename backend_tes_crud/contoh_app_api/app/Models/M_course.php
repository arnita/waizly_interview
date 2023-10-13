<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_course extends Model
{
    //
    protected $table = 'm_course';
    protected $primaryKey = 'course_id';
    protected $guarded = [];
    public $timestamps= false;

    public function unit()
    {
    	return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }

    // public function employee()
    // {
    //     return $this->hasOne(M_employee::class,'employee_id');
    // }


    public function teacher_setting()
    {
        return $this->hasOne(Teacher_setting::class,'course_id','course_id');
    }

    // public function teacher()
    // {
    //     return $this->hasOne(Teacher_setting::class,'course_id','course_id');
    // }


    public function class_grade()
    {
    	return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
    }
}
