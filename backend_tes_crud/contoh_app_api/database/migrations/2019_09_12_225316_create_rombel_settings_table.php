<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRombelSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('study_group_setting', function (Blueprint $table) {
            $table->bigIncrements('study_group_setting_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('study_group_id')->nullable();
            $table->foreign('study_group_id')->references('study_group_id')->on('m_study_group')->onDelete('restrict')->onUpdate('restrict');
            $table->string('study_group_setting_status')->nullable();
            $table->integer('study_group_setting_insert_by')->nullable();
            $table->datetime('study_group_setting_insert_time')->nullable();
            $table->datetime('study_group_setting_update_time')->nullable();   
            $table->integer('study_group_setting_update_by')->nullable();
            $table->datetime('study_group_setting_delete_time')->nullable();   
            $table->integer('study_group_setting_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('study_group_setting');
    }
}
