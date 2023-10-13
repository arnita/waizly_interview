<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_kkm extends Model
{
    //
    protected $table = 'm_kkm';
    protected $primaryKey = 'kkm_id';
    protected $guarded = [];
    public $timestamps= false;


    public function course()
    {
    	return $this->hasOne(M_course::class,'course_id','course_id');
    }


    public function class_grade()
    {
    	return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
    }
}
