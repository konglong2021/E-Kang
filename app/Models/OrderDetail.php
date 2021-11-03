<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderDetail extends Model
{
    use HasFactory;
    use softDeletes;

    protected $table = 'order_details';

    protected $fillable = [
        'order_id',
        'product_id',
        'sellprice',
        'quantity',
       
    ];

    public function order()
    {
        return $this->belongsToMany(Order::class);
    }
}
