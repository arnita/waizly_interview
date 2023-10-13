<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtableinputanalysis extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('input_analysis', function (Blueprint $table) {
            $table->bigIncrements('input_analysis_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('number_question')->nullable();
            $table->string('value_quality')->nullable();
            $table->string('total_value')->nullable();
            $table->string('input_analysis_type')->nullable();
            $table->integer('input_analysis_insert_by')->nullable();
            $table->datetime('input_analysis_insert_time')->nullable();
            $table->datetime('input_analysis_update_time')->nullable();   
            $table->integer('input_analysis_update_by')->nullable();
            $table->datetime('input_analysis_delete_time')->nullable();   
            $table->integer('input_analysis_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('input_analysis');
    }
}
