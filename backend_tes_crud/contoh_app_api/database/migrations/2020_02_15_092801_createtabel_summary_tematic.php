<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetabelSummaryTematic extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('summary_tematic', function (Blueprint $table) {
            $table->bigIncrements('summary_tematic_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('structure_tematic_id')->nullable();
            $table->foreign('structure_tematic_id')->references('structure_tematic_id')->on('structure_tematic')->onDelete('restrict')->onUpdate('restrict');
            $table->string('type');
            $table->integer('total');
            $table->integer('summary_tematic_insert_by')->nullable();
            $table->datetime('summary_tematic_insert_time')->nullable();
            $table->datetime('summary_tematic_update_time')->nullable();   
            $table->integer('summary_tematic_update_by')->nullable();
            $table->datetime('summary_tematic_delete_time')->nullable();   
            $table->integer('summary_tematic_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('summary_tematic');
    }
}
