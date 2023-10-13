<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createpersonality extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personality', function (Blueprint $table) {
            $table->bigIncrements('personality_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->string('personality_type')->nullable();
            $table->string('personality_value')->nullable();
            $table->integer('personality_insert_by')->nullable();
            $table->datetime('personality_insert_time')->nullable();
            $table->datetime('personality_update_time')->nullable();   
            $table->integer('personality_update_by')->nullable();
            $table->datetime('personality_delete_time')->nullable();   
            $table->integer('personality_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('personality');
    }
}
