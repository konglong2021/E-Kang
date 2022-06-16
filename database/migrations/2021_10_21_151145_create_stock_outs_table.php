<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockOutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_outs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->onUpdate('cascade');
            $table->unsignedBigInteger('from_warehouse');
            $table->foreign('from_warehouse')->references('id')->on('warehouses');
            $table->unsignedBigInteger('to_warehouse');
            $table->foreign('to_warehouse')->references('id')->on('warehouses');
            $table->string('ref')->nullable();
            $table->decimal('quantity');
            $table->foreignId('user_id')->constrained()->onUpdate('cascade');
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
        Schema::dropIfExists('stock_outs');
    }
}
