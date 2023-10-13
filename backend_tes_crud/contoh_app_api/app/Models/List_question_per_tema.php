<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class List_question_per_tema extends Model
{
    //
    protected $table = 'list_question_per_tema';
    protected $primaryKey = 'list_question_per_tema_id';
    protected $guarded = [];
    public $timestamps= false;


    public function structure_tematic_detail()
    {
    	return $this->hasOne(\App\Models\Structure_tematic_detail::class,'structure_tematic_detail_id','structure_tematic_detail_id');
    }
}
