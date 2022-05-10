<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_id')->unique();
            $table->foreignId('customer_id')->constrained();
            $table->foreignId('warehouse_id')->constrained();
            $table->foreignId('user_id')->constrained()->onUpdate('cascade');
            $table->double('subtotal');
            $table->double('vat')->nullable(); //default 10%
            $table->double('discount')->nullable();
            $table->double('grandtotal');
            $table->double('kh_grandtotal')->nullable();
            $table->double('receive')->nullable(); //receive money
            $table->tinyInteger('status')->nullable(); // 0 is default for pending , 1 is mean money has been clear
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
