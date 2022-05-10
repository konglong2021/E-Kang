<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory,LogsActivity;

    use softDeletes;

    protected $fillable = [
        'category_id',
        'code',
        'en_name',
        'kh_name',
        'description',
        'image',
        'sale_price',
    ];
    protected static $logAttributes = [
        'category_id',
        'code',
        'en_name',
        'kh_name',
        'description',
        'image',
        'sale_price',
    ];



    public function categories()
    {
        return $this->belongsTo(Category::class,'category_id', 'id');
    }

    public function brands()
    {
        return $this->belongsToMany(Brand::class);
    }
    public function stock()
    {
        return $this->hasMany(Stock::class);
    }
    public function purchasedetails()
    {
        return $this->hasMany(PurchaseDetail::class);
    }

 
}
