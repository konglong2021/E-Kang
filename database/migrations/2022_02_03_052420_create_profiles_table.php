<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onUpdate('cascade'); 
            $table->foreignId('warehouse_id')->nullable(); // default warehouse
            $table->string("firstname")->nullable();
            $table->string("lastname")->nullable();
            $table->string("gender")->nullable();
            $table->string("occupation")->nullable();
            $table->string("phone")->nullable();
            $table->string("email")->nullable();
            $table->date("birthdate")->nullable();
            $table->string("address")->nullable();
            $table->string('image')->nullable();
            $table->boolean("active")->nullable();
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
        Schema::dropIfExists('profiles');
    }
}
