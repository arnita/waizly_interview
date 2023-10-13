<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtablefisik extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('physical_student', function (Blueprint $table) {
            $table->bigIncrements('physical_student_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->string('physical_type')->nullable();
            $table->string('physical_category')->nullable();
            $table->string('physical_value')->nullable();
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('physical_student_insert_by')->nullable();
            $table->datetime('physical_student_insert_time')->nullable();
            $table->datetime('physical_student_update_time')->nullable();   
            $table->integer('physical_student_update_by')->nullable();
            $table->datetime('physical_student_delete_time')->nullable();   
            $table->integer('physical_student_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('physical_student');
    }
}
