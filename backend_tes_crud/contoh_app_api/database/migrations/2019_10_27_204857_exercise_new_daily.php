<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ExerciseNewDaily extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('daily_exercise', function (Blueprint $table) {
            $table->bigIncrements('daily_exercise_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('kd_detail_id')->nullable();
            $table->foreign('kd_detail_id')->references('kd_detail_id')->on('m_kd_detail')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('structure_tematic_id')->nullable();
            $table->foreign('structure_tematic_id')->references('structure_tematic_id')->on('structure_tematic')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->string('kd_type')->nullable();
            $table->float('score')->nullable();
            $table->integer('daily_exercise_type')->nullable();
            $table->integer('daily_exercise_insert_by')->nullable();
            $table->datetime('daily_exercise_insert_time')->nullable();
            $table->datetime('daily_exercise_update_time')->nullable();   
            $table->integer('daily_exercise_update_by')->nullable();
            $table->datetime('daily_exercise_delete_time')->nullable();   
            $table->integer('daily_exercise_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
