<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableInstitution extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution', function (Blueprint $table) {
            $table->increments('institution_id'); 
            $table->string('institution_name')->nullable();
            $table->text('institution_desc')->nullable();
            $table->string('institution_address')->nullable();
            $table->string('institution_telp')->nullable();
            $table->string('institution_email')->nullable();
            $table->timestamp('institution_start_time')->nullable();
            $table->timestamp('institution_end_time')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('institution');
    }
}
