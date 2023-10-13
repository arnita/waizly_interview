<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExtracurricularsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('extracurricular', function (Blueprint $table) {
            $table->bigIncrements('extracurricular_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('type')->nullable();
            $table->string('value')->nullable();
            $table->string('desc')->nullable();
            $table->integer('extracurricular_insert_by')->nullable();
            $table->datetime('extracurricular_insert_time')->nullable();
            $table->datetime('extracurricular_update_time')->nullable();   
            $table->integer('extracurricular_update_by')->nullable();
            $table->datetime('extracurricular_delete_time')->nullable();   
            $table->integer('extracurricular_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('extracurricular');
    }
}
