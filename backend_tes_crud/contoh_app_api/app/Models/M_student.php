<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_student extends Model
{
    //
    protected $table = 'm_student';
    protected $primaryKey = 'student_id';
    protected $guarded = [];
    public $timestamps= false;

    public function unit()
    {
        return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }

    public function class_grade()
    {
        return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
    }


    public function study_group()
    {
        return $this->hasOne(Study_group_setting::class,'student_id','student_id');
    }


    public function user()
    {
        return $this->hasOne(User::class,'id','user_id');
    }

    

}
