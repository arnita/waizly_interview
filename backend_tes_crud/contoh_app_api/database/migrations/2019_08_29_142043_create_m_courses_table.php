<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMCoursesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_course', function (Blueprint $table) {
            $table->bigIncrements('course_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');            
            $table->unsignedBigInteger('class_grade_id')->nullable();
            $table->foreign('class_grade_id')->references('class_grade_id')->on('m_class_grade')->onDelete('restrict')->onUpdate('restrict');            
            $table->string('course_status')->nullable();
            $table->string('course_name')->nullable();
            $table->string('course_code')->nullable();
            $table->string('course_desc')->nullable();
            $table->integer('course_insert_by')->nullable();
            $table->dateTime('course_insert_time')->nullable();
            $table->dateTime('course_update_time')->nullable();   
            $table->integer('course_update_by')->nullable();
            $table->dateTime('course_delete_time')->nullable();   
            $table->integer('course_delete_by')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_course');
    }
}
