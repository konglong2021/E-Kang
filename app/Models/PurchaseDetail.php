<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PurchaseDetail extends Model
{
    use HasFactory;
    use softDeletes;

    protected $table = 'purchase_details';

    protected $fillable = [
        'purchase_id',
        'product_id',
        'unitprice',
        'quantity',
       
    ];

    public function purchases()
    {
        return $this->belongsToMany(Purchase::class);
    }
}
