<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Class_advisor extends Model
{
    //
    protected $table = 'class_advisor';
    protected $primaryKey = 'class_advisor_id';
    protected $guarded = [];
    public $timestamps= false;



    public function study_group()
    {
    	return $this->hasOne(M_study_group::class,'study_group_id','study_group_id');
    }
    
    public function employee()
    {
    	return $this->hasOne(M_employee::class,'employee_id','employee_id');
    }
}
