<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderDetail extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;

    protected $table = 'order_details';

    protected $fillable = [
        'order_id',
        'product_id',
        'sellprice',
        'quantity',
       
    ];
    protected static $logAttributes = [
        'order_id',
        'product_id',
        'sellprice',
        'quantity',
    ];

    public function order()
    {
        // return $this->belongsToMany(Order::class);
        return $this->hasMany(Order::class,'id','order_id');
    }
}
