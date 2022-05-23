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
        'user_id',
        'order_id',
        'paid',
        'balance',
        'pay_method',
        'amount'
       
    ];
    protected static $logAttributes = [
        'user_id',
        'order_id',
        'paid',
        'balance',
        'pay_method',
        'amount'
    ];

    public function order()
    {
        return $this->belongsToMany(Order::class);
    }
}
