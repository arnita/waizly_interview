<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_kd_detail extends Model
{
    //

    protected $table = 'm_kd_detail';
    protected $primaryKey = 'kd_detail_id';
    protected $guarded = [];
    public $timestamps= false;


    public function kd()
    {
    	return $this->hasOne(M_kd::class,'kd_id','kd_id');
    }

}
