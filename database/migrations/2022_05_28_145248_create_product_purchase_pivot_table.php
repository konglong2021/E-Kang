<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductPurchasePivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_purchase', function (Blueprint $table) {
            $table->id();
            $table->foreignId('purchase_id')->constrained()->onUpdate('cascade');
            $table->foreignId('product_id')->constrained()->onUpdate('cascade');
            $table->decimal('unitprice');
            $table->decimal('quantity');
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
        Schema::dropIfExists('product_purchase');
    }
}
