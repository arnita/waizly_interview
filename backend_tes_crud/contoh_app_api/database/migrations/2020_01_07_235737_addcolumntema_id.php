<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddcolumntemaId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('input_analysis_tema', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('structure_tematic_id')->nullable();
            $table->foreign('structure_tematic_id')->references('structure_tematic_id')->on('structure_tematic')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('input_analysis_tema', function (Blueprint $table) {
            //
        });
    }
}
