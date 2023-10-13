<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Personality extends Model
{
    //
      //
    protected $table = 'personality';
    protected $primaryKey = 'personality_id';
    protected $guarded = [];
    public $timestamps= false;
}
