<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumnquestionuasdll extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('structure_tematic_detail', function (Blueprint $table) {
            //
            $table->integer('question_uts')->nullable();
            $table->integer('question_uas')->nullable();
            $table->integer('question_daily')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('structure_tematic_detail', function (Blueprint $table) {
            //
        });
    }
}
