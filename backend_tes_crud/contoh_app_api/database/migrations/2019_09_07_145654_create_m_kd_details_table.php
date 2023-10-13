<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMKdDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_kd_detail', function (Blueprint $table) {
            $table->bigIncrements('kd_detail_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('kd_detail_insert_by')->nullable();
            $table->datetime('kd_detail_insert_time')->nullable();
            $table->datetime('kd_detail_update_time')->nullable();   
            $table->integer('kd_detail_update_by')->nullable();
            $table->datetime('kd_detail_delete_time')->nullable();   
            $table->integer('kd_detail_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_kd_detail');
    }
}
