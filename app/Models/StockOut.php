<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class StockOut extends Model
{
    use HasFactory,LogsActivity;


    protected $fillable = [

        'from_warehouse',
        'product_id',
        'to_warehouse',
        'quantity',
        'user_id',
        'ref',

    ];
    protected static $logAttributes = [
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
    public function fromWarehouse()
    {
        return $this->belongsTo(Warehouse::class,'from_warehouse');
    }

    public function toWarehouse()
    {
        return $this->belongsTo(Warehouse::class,'to_warehouse');
    }
}
