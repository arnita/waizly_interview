<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStructureTematicDetailId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('list_question_per_tema', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('structure_tematic_detail_id')->nullable();
            $table->foreign('structure_tematic_detail_id')->references('structure_tematic_detail_id')->on('structure_tematic_detail')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('list_question_per_tema', function (Blueprint $table) {
            //
        });
    }
}
