<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMClassGradesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_class_grade', function (Blueprint $table) {
            $table->bigIncrements('class_grade_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('class_grade_order')->nullable();
            $table->string('class_grade_status')->nullable();
            $table->string('class_grade_name')->nullable();
            $table->text('class_grade_desc')->nullable();
            $table->integer('class_grade_insert_by')->nullable();
            $table->dateTime('class_grade_insert_time')->nullable();
            $table->dateTime('class_grade_update_time')->nullable();   
            $table->integer('class_grade_update_by')->nullable();
            $table->dateTime('class_grade_delete_time')->nullable();   
            $table->integer('class_grade_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_class_grade');
    }
}
