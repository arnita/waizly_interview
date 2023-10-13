<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMEducationLevelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_education_level', function (Blueprint $table) {
            $table->bigIncrements('education_level_id');
            $table->string('education_level_name');
            $table->string('education_level_status');
            $table->string('education_level_resume');
            $table->integer('education_level_insert_by')->nullable();
            $table->dateTime('education_level_insert_time')->nullable();
            $table->dateTime('education_level_update_time')->nullable();   
            $table->integer('education_level_update_by')->nullable();
            $table->dateTime('education_level_delete_time')->nullable();   
            $table->integer('education_level_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_education_level');
    }
}
