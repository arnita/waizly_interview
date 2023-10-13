<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeacherSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teacher_setting', function (Blueprint $table) {
            $table->bigIncrements('teacher_setting_id');
            $table->unsignedBigInteger('employee_id')->nullable();
            $table->foreign('employee_id')->references('employee_id')->on('m_employee')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('unit_year_id')->nullable();
            $table->foreign('unit_year_id')->references('unit_year_id')->on('m_unit_year')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->string('teacher_setting_status')->nullable();
            $table->integer('teacher_setting_insert_by')->nullable();
            $table->datetime('teacher_setting_insert_time')->nullable();
            $table->datetime('teacher_setting_update_time')->nullable();   
            $table->integer('teacher_setting_update_by')->nullable();
            $table->datetime('teacher_setting_delete_time')->nullable();   
            $table->integer('teacher_setting_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teacher_setting');
    }
}
