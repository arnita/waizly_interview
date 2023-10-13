<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMUnitYearsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_unit_year', function (Blueprint $table) {
            $table->bigIncrements('unit_year_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');
            $table->string('unit_year_status')->nullable();
            $table->string('unit_year_name')->nullable();
            $table->string('unit_year_prefix')->nullable();
            $table->date('unit_year_start')->nullable();
            $table->date('unit_year_end')->nullable();
            $table->text('unit_year_desc')->nullable();
            $table->integer('unit_year_insert_by')->nullable();
            $table->dateTime('unit_year_insert_time')->nullable();
            $table->dateTime('unit_year_update_time')->nullable();   
            $table->integer('unit_year_update_by')->nullable();
            $table->dateTime('unit_year_delete_time')->nullable();   
            $table->integer('unit_year_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_unit_year');
    }
}
