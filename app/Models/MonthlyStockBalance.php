<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MonthlyStockBalance extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'warehouse_id',
        'product_id',
        'stock_balance_dates_id',
        'total'
    ];
}

