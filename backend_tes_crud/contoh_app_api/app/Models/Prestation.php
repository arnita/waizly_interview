<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Prestation extends Model
{
    //
    protected $table = 'prestation';
    protected $primaryKey = 'prestation_id';
    protected $guarded = [];
    public $timestamps = false;
}

