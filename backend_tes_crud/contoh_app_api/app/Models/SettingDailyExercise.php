<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SettingDailyExercise extends Model
{
    //

    protected $table = 'setting_daily_exercise';
    protected $primaryKey = 'quiz_per_kd_id';
    protected $guarded = [];
    public $timestamps= false;


    public function kd()
    {
    	return $this->hasOne(M_kd::class,'kd_id','kd');
    }
}
