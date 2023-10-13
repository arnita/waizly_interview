<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class List_question_per_kd extends Model
{
    //
    protected $table = 'list_question_per_kd';
    protected $primaryKey = 'list_question_per_kd_id';
    protected $guarded = [];
    public $timestamps= false;


    public function quiz_per_kd()
    {
    	return $this->hasOne(Quiz_per_kd::class,'quiz_per_kd_id','quiz_per_kd_id');
    }

}
