<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMPositionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_position', function (Blueprint $table) {
            $table->bigIncrements('position_id');
            $table->unsignedBigInteger('department_id')->nullable();
            $table->foreign('department_id')->references('department_id')->on('m_department')->onDelete('restrict')->onUpdate('restrict');
            $table->string('position_name')->nullable();
            $table->string('position_desc')->nullable();
            $table->string('position_status')->nullable();
            $table->integer('position_insert_by')->nullable();
            $table->datetime('position_insert_time')->nullable();
            $table->datetime('position_update_time')->nullable();   
            $table->integer('position_update_by')->nullable();
            $table->datetime('position_delete_time')->nullable();   
            $table->integer('position_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_position');
    }
}
