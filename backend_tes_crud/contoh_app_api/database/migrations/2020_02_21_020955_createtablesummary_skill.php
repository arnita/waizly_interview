<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetablesummarySkill extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('summary_skill', function (Blueprint $table) {
            $table->bigIncrements('summary_skill_id');
             $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('total_skill')->nullable();
            $table->integer('summary_skill_insert_by')->nullable();
            $table->datetime('summary_skill_insert_time')->nullable();
            $table->datetime('summary_skill_update_time')->nullable();   
            $table->integer('summary_skill_update_by')->nullable();
            $table->datetime('summary_skill_delete_time')->nullable();   
            $table->integer('summary_skill_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('summary_skill');
    }
}
