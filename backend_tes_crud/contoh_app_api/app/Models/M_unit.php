<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_unit extends Model
{
    //
    protected $table = 'm_unit';
    protected $primaryKey = 'unit_id';
    protected $guarded = [];
    public $timestamps= false;


    public function class()
    {
    	return $this->hasOne(M_class_grade::class,'unit_id','unit_id');
    }
}
