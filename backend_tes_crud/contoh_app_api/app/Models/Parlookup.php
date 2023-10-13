<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Parlookup extends Model
{
    //

    protected $table = 'parlookup';
    protected $primaryKey = 'parlookup_id';
    protected $guarded = [];
    public $timestamps= false;


     public function unit()
    {
    	return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }
}
