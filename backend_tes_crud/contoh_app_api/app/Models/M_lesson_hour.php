<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_lesson_hour extends Model
{
    //
    protected $table = 'm_lesson_hour';
    protected $primaryKey = 'lesson_hour_id';
    protected $guarded = [];
    public $timestamps= false;
}
