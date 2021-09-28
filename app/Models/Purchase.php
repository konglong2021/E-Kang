<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Purchase extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = [
        'warehouse_id',
        'supplier_id',
        'user_id',
        'batch',
        'subtotal',
        'vat',
        'grandtotal',
    ];

    public function purchasedetails()
    {
        return $this->hasMany(PurchaseDetail::class);
    }
}
