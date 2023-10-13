<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_employee', function (Blueprint $table) {
            $table->bigIncrements('employee_id');
            $table->string('employee_status')->nullable();
            $table->string('employee_id_card')->nullable();
            $table->unsignedBigInteger('position_id')->nullable();
            $table->foreign('position_id')->references('position_id')->on('m_position')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('restrict')->onUpdate('restrict');
            $table->string('employee_type')->nullable();
            $table->string('employee_name')->nullable();
            $table->string('employee_working_status')->nullable();
            $table->string('employee_nik')->nullable();
            $table->string('employee_gender')->nullable();
            $table->string('employee_birth_place')->nullable();
            $table->datetime('employee_birth_date')->nullable();
            $table->string('employee_religion')->nullable();
            $table->string('employee_identity')->nullable();
            $table->string('employee_last_education')->nullable();
            $table->string('employee_marital_status')->nullable();
            $table->string('employee_hp')->nullable();
            $table->string('employee_website')->nullable();
            $table->string('employee_telp')->nullable();
            $table->string('employee_address')->nullable();
            $table->string('employee_photo')->nullable();
            $table->string('employee_desc')->nullable();
            $table->string('employee_email')->nullable();
            $table->integer('employee_insert_by')->nullable();
            $table->datetime('employee_insert_time')->nullable();
            $table->datetime('employee_update_time')->nullable();   
            $table->integer('employee_update_by')->nullable();
            $table->datetime('employee_delete_time')->nullable();   
            $table->integer('employee_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_employee');
    }
}
