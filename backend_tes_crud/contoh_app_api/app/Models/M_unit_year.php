<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_unit_year extends Model
{
    //
    protected $table = 'm_unit_year';
    protected $primaryKey = 'unit_year_id';
    protected $guarded = [];
    public $timestamps= false;

    public function unit()
    {
    	return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }
}
