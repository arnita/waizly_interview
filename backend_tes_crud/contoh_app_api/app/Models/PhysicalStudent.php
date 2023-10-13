<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PhysicalStudent extends Model
{
    //

    protected $table = 'physical_student';
    protected $primaryKey = 'physical_student_id';
    protected $guarded = [];
    public $timestamps= false;
}
