<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeacherNotesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teacher_note', function (Blueprint $table) {
            $table->bigIncrements('teacher_note_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('raport_pts')->nullable();
            $table->string('raport_pas')->nullable();
            $table->integer('teacher_note_insert_by')->nullable();
            $table->datetime('teacher_note_insert_time')->nullable();
            $table->datetime('teacher_note_update_time')->nullable();   
            $table->integer('teacher_note_update_by')->nullable();
            $table->datetime('teacher_note_delete_time')->nullable();   
            $table->integer('teacher_note_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teacher_note');
    }
}
