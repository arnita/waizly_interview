<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFriendlyValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('friendly_value', function (Blueprint $table) {
            $table->BigIncrements('friendly_value_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('friendly_value_type')->nullable();
            $table->string('friendly_value_category')->nullable();
            $table->enum('friendly_value_value',['SB','PB'])->nullable();
            $table->integer('friendly_value_insert_by')->nullable();
            $table->datetime('friendly_value_insert_time')->nullable();
            $table->datetime('friendly_value_update_time')->nullable();   
            $table->integer('friendly_value_update_by')->nullable();
            $table->datetime('friendly_value_delete_time')->nullable();   
            $table->integer('friendly_value_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('friendly_value');
    }
}
