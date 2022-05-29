<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;
   

    protected $fillable = [
        'warehouse_id',
        'customer_id',
        'user_id',
        'subtotal',
        'vat',
        'discount',
        'grandtotal',
        'kh_grandtotal',
    ];

    protected static $logAttributes = [
        'warehouse_id',
        'customer_id',
        'user_id',
        'subtotal',
        'vat',
        'discount',
        'grandtotal',
        'kh_grandtotal',
        
    ];

    public function orderdetails()
    {
        return $this->hasMany(OrderDetail::class);
    }

  
    
    public function customers()
    {
        return $this->belongsTo(Customer::class,'customer_id');
    }

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class,'warehouse_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    public function transaction()
    {
        return $this.hasMany(Transaction::class);
    }

    public function products()
    {   
        return $this.belongsToMany(Product::class);
    }
}
