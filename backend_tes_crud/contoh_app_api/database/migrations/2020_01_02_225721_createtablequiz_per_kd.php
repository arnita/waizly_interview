<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetablequizPerKd extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quiz_per_kd', function (Blueprint $table) {
            $table->bigIncrements('quiz_per_kd_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('total_question')->nullable();
            $table->string('type_question')->nullable();
            $table->text('description')->nullable();
            $table->integer('quiz_per_kd_insert_by')->nullable();
            $table->datetime('quiz_per_kd_insert_time')->nullable();
            $table->datetime('quiz_per_kd_update_time')->nullable();   
            $table->integer('quiz_per_kd_update_by')->nullable();
            $table->datetime('quiz_per_kd_delete_time')->nullable();   
            $table->integer('quiz_per_kd_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('quiz_per_kd', function (Blueprint $table) {
            //
        });
    }
}
