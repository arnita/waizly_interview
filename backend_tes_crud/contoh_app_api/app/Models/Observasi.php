<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Observasi extends Model
{
    //
    protected $table = 'observasi';
    protected $primaryKey = 'observasi_id';
    protected $guarded = [];
    public $timestamps= false;
}
