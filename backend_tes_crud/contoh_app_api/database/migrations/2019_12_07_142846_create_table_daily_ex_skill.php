<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableDailyExSkill extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('daily_exercise_skill', function (Blueprint $table) {
            $table->bigIncrements('daily_exercise_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('skill_value')->nullable();
            $table->integer('skill_type')->nullable();
            $table->integer('daily_exercise_skill_insert_by')->nullable();
            $table->datetime('daily_exercise_skill_insert_time')->nullable();
            $table->datetime('daily_exercise_skill_update_time')->nullable();   
            $table->integer('daily_exercise_skill_update_by')->nullable();
            $table->datetime('daily_exercise_skill_delete_time')->nullable();   
            $table->integer('daily_exercise_skill_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_daily_ex_skill');
    }
}
