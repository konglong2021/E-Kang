<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PurchaseDetail extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;

    protected $table = 'purchase_details';

    protected $fillable = [
        'purchase_id',
        'product_id',
        'unitprice',
        'quantity',
       
    ];
    protected static $logAttributes = [
        'purchase_id',
        'product_id',
        'unitprice',
        'quantity',
    ];

    public function purchases()
    {
        return $this->belongsToMany(Purchase::class);
    }
    public function products()
    {
        return $this->belongsToMany(Product::class);
    }
}
