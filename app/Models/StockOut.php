<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockOut extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = [

        'from_warehouse',
        'product_id',
        'to_warehouse',
        'quantity',
        'user_id',

    ];
}
