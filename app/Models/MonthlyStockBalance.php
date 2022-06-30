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


    /**
     * Get the stockBalanceDate that owns the MonthlyStockBalance
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function stockBalanceDate(){
        return $this->hasMany(StockBalanceDate::class,'id','stock_balance_dates_id');
    }
}

