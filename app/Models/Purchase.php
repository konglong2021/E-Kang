<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Purchase extends Model
{
    use HasFactory,LogsActivity;
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
    protected static $logAttributes = [
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
