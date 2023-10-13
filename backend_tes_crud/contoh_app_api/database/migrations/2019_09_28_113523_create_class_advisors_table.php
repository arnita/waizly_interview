<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClassAdvisorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class_advisor', function (Blueprint $table) {
            $table->bigIncrements('class_advisor_id');
            $table->unsignedBigInteger('employee_id')->nullable();
            $table->foreign('employee_id')->references('employee_id')->on('m_employee')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('unit_year_id')->nullable();
            $table->foreign('unit_year_id')->references('unit_year_id')->on('m_unit_year')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('study_group_id')->nullable();
            $table->foreign('study_group_id')->references('study_group_id')->on('m_study_group')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('class_advisor_insert_by')->nullable();
            $table->datetime('class_advisor_insert_time')->nullable();
            $table->datetime('class_advisor_update_time')->nullable();   
            $table->integer('class_advisor_update_by')->nullable();
            $table->datetime('class_advisor_delete_time')->nullable();   
            $table->integer('class_advisor_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('class_advisor');
    }
}
