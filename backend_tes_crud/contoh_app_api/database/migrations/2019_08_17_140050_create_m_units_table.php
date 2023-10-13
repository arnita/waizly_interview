<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMUnitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_unit', function (Blueprint $table) {
            $table->bigIncrements('unit_id');
            $table->unsignedBigInteger('education_level_id')->nullable();
            $table->foreign('education_level_id')->references('education_level_id')->on('m_education_level')->onDelete('restrict')->onUpdate('restrict');
            $table->string('unit_name')->nullable();
            $table->string('unit_desc')->nullable();
            $table->string('unit_logo')->nullable();
            $table->string('unit_prefix')->nullable();
            $table->text('unit_address')->nullable();
            $table->string('unit_telp')->nullable();
            $table->string('unit_email')->nullable();
            $table->string('unit_website')->nullable();
            $table->string('unit_status')->nullable();
            $table->integer('unit_insert_by')->nullable();
            $table->dateTime('unit_insert_time')->nullable();
            $table->dateTime('unit_update_time')->nullable();   
            $table->integer('unit_update_by')->nullable();
            $table->dateTime('unit_delete_time')->nullable();   
            $table->integer('unit_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_unit');
    }
}
