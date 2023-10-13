<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCourseSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('course_setting', function (Blueprint $table) {
            $table->bigIncrements('course_setting_id');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('study_group_id')->nullable();
            $table->foreign('study_group_id')->references('study_group_id')->on('m_study_group')->onDelete('restrict')->onUpdate('restrict');
            $table->string('course_setting_status')->nullable();
            $table->integer('course_setting_insert_by')->nullable();
            $table->datetime('course_setting_insert_time')->nullable();
            $table->datetime('course_setting_update_time')->nullable();   
            $table->integer('course_setting_update_by')->nullable();
            $table->datetime('course_setting_delete_time')->nullable();   
            $table->integer('course_setting_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('course_setting');
    }
}
