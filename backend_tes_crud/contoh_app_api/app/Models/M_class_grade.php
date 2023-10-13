<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_class_grade extends Model
{
    //
    protected $table = 'm_class_grade';
    protected $primaryKey = 'class_grade_id';
    protected $guarded = [];
    public $timestamps= false;


    public function unit()
    {
    	return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }
}
