<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Quiz_per_kd extends Model
{
    //
    protected $table = 'quiz_per_kd';
    protected $primaryKey = 'quiz_per_kd_id';
    protected $guarded = [];
    public $timestamps= false;


    public function kd()
    {
    	return $this->hasOne(M_kd::class,'kd_id','kd');
    }
}
