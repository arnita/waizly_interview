<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtableemployeesettingunit extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_unit', function (Blueprint $table) {
            $table->bigIncrements('employee_unit_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('employee_id')->nullable();
            $table->foreign('employee_id')->references('employee_id')->on('m_employee')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('employee_unit_insert_by')->nullable();
            $table->datetime('employee_unit_insert_time')->nullable();
            $table->datetime('employee_unit_update_time')->nullable();   
            $table->integer('employee_unit_update_by')->nullable();
            $table->datetime('employee_unit_delete_time')->nullable();   
            $table->integer('employee_unit_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employee_unit');
    }
}
