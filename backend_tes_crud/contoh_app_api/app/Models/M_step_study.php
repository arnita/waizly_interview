<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_step_study extends Model
{
    //
    protected $table = 'm_step_study';
    protected $primaryKey = 'step_study_id';
    protected $guarded = [];
    public $timestamps= false;

    public function unit_year()
    {
    	return $this->hasOne(M_unit_year::class,'unit_year_id','unit_year_id');
    }
}
