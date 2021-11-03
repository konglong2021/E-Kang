<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class StockOut extends Model
{
    use HasFactory;


    protected $fillable = [

        'from_warehouse',
        'product_id',
        'to_warehouse',
        'quantity',
        'user_id',

    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }
}
