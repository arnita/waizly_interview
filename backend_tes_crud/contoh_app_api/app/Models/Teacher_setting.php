<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Teacher_setting extends Model
{
    //
    protected $table = 'teacher_setting';
    protected $primaryKey = 'teacher_setting_id';
    protected $guarded = [];
    public $timestamps= false;

	public function employee()
    {
    	return $this->hasOne(M_employee::class,'employee_id','employee_id');
    }

    public function course()
    {
        return $this->hasOne(M_course::class,'course_id','course_id');
    }


}
