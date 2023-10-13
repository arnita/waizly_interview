<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_employee extends Model
{
    //
    protected $table = 'm_employee';
    protected $primaryKey = 'employee_id';
    protected $guarded = [];
    public $timestamps= false;


    public function teacher_setting()
    {
    	return $this->belongsTo(Teacher_setting::class);
    }

 	public function user()
    {
    	return $this->belongsTo(User::class,'user_id','id');
    }




}
