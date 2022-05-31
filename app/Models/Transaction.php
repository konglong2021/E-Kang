<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;

class Transaction extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;



    protected $fillable = [
        'order_id',
        'paid',
        'pay_method',
       
    ];
    protected static $logAttributes = [
        'order_id',
        'paid',
        'pay_method',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class,'order_id');
    }

    public function customers()
    {
        return $this->hasOneThrough(Customer::class,Order::class,'customer_id','id','id','customer_id');
    }
}
