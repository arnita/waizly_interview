<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_employee_unit extends Model
{
    //
    protected $table = 'employee_unit';
    protected $primaryKey = 'employee_unit_id';
    protected $guarded = [];
    public $timestamps= false;
}
