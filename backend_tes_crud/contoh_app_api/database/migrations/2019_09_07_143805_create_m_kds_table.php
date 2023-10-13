<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMKdsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_kd', function (Blueprint $table) {
            $table->bigIncrements('kd_id');
            $table->unsignedBigInteger('unit_year_id')->nullable();
            $table->foreign('unit_year_id')->references('unit_year_id')->on('m_unit_year')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->string('kd_code')->nullable();
            $table->string('kd_name')->nullable();
            $table->string('kd_desc')->nullable();
            $table->string('kd_type');
            $table->integer('kd_insert_by')->nullable();
            $table->datetime('kd_insert_time')->nullable();
            $table->datetime('kd_update_time')->nullable();   
            $table->integer('kd_update_by')->nullable();
            $table->datetime('kd_delete_time')->nullable();   
            $table->integer('kd_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_kd');
    }
}
