<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee_unit extends Model
{
    //
    protected $table = 'employee_unit';
    protected $primaryKey = 'employee_unit_id';
    protected $guarded = [];
    public $timestamps= false;



    public function unit()
    {
    	return $this->hasOne(M_unit::class,'unit_id','unit_id');
    }


}
