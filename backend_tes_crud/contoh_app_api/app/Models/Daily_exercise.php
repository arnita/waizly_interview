<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Daily_exercise extends Model
{
    protected $table = 'daily_exercise';
    protected $primaryKey = 'daily_exercise_id';
    protected $guarded = [];
    public $timestamps= false;

}
