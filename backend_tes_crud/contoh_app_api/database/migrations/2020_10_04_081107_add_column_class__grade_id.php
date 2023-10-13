<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnClassGradeId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('structure_tematic', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('class_grade_id')->nullable();
            $table->foreign('class_grade_id')->references('class_grade_id')->on('m_class_grade')->onDelete('restrict')->onUpdate('restrict');    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('structure_tematic', function (Blueprint $table) {
            //
        });
    }
}
