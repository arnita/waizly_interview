<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMKkmsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_kkm', function (Blueprint $table) {
            $table->bigIncrements('kkm_id');
            $table->integer('kkm_value')->nullable();
            $table->integer('kkm_a')->nullable();
            $table->integer('kkm_b')->nullable();
            $table->integer('kkm_c')->nullable();
            $table->integer('kkm_d')->nullable();
            $table->integer('kkm_insert_by')->nullable();
            $table->datetime('kkm_insert_time')->nullable();
            $table->datetime('kkm_update_time')->nullable();   
            $table->integer('kkm_update_by')->nullable();
            $table->datetime('kkm_delete_time')->nullable();   
            $table->integer('kkm_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_kkm');
    }
}
