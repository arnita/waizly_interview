<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Extracurricular extends Model
{
    //
    protected $table = 'extracurricular';
    protected $primaryKey = 'extracurricular_id';
    protected $guarded = [];
    public $timestamps = false;
}
