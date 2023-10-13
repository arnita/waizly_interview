<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMDepartmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_department', function (Blueprint $table) {
            $table->bigIncrements('department_id');
            $table->string('department_name')->nullable();
            $table->string('department_desc')->nullable();
            $table->string('department_status')->nullable();
            $table->integer('department_insert_by')->nullable();
            $table->datetime('department_insert_time')->nullable();
            $table->datetime('department_update_time')->nullable();   
            $table->integer('department_update_by')->nullable();
            $table->datetime('department_delete_time')->nullable();   
            $table->integer('department_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_department');
    }
}
