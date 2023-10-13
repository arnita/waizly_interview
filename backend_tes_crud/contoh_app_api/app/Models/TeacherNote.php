<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherNote extends Model
{
    //
    protected $table = 'teacher_note';
    protected $primaryKey = 'teacher_note_id';
    protected $guarded = [];
    public $timestamps= false;
}
