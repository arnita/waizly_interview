<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PD extends Model
{
    //
    protected $table = 'pd';
    protected $primaryKey = 'pd_id';
    protected $guarded = [];
    public $timestamps= false;
}
