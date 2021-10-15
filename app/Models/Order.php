<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = [
        'warehouse_id',
        'customer_id',
        'user_id',
        'subtotal',
        'vat',
        'discount',
        'grandtotal',
    ];

    public function orderdetails()
    {
        return $this->hasMany(OrderDetail::class);
    }
}