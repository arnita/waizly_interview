<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMParentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_parent', function (Blueprint $table) {
            $table->bigIncrements('parent_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');    
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('restrict')->onUpdate('restrict');    
            $table->string('parent_name')->nullable();
            $table->string('parent_id_card')->nullable();
            $table->string('parent_status')->nullable();
            $table->string('parent_nickname')->nullable();
            $table->string('parent_gender')->nullable();
            $table->string('parent_birth_place')->nullable();
            $table->date('parent_birth_date')->nullable();
            $table->text('parent_address')->nullable();
            $table->string('parent_hp')->nullable();
            $table->string('parent_telp')->nullable();
            $table->string('parent_email')->nullable();
            
            $table->string('parent_photo')->nullable();
            $table->string('parent_hobby')->nullable();

            $table->string('parent_religion')->nullable();
       
            $table->integer('parent_insert_by')->nullable();
            $table->dateTime('parent_insert_time')->nullable();
            $table->dateTime('parent_update_time')->nullable();   
            $table->integer('parent_update_by')->nullable();
            $table->dateTime('parent_delete_time')->nullable();   
            $table->integer('parent_delete_by')->nullable();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_parent');
    }
}
