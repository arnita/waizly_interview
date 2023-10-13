<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePDsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pd', function (Blueprint $table) {
            $table->bigIncrements('pd_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('pd_type')->nullable();
            $table->string('pd_category')->nullable();
            $table->enum('pd_value',['SB','PB'])->nullable();
            $table->integer('pd_insert_by')->nullable();
            $table->datetime('pd_insert_time')->nullable();
            $table->datetime('pd_update_time')->nullable();   
            $table->integer('pd_update_by')->nullable();
            $table->datetime('pd_delete_time')->nullable();   
            $table->integer('pd_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pd');
    }
}
