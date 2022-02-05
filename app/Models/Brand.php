<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Brand extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;

    protected $fillable = [
        'name',
        'kh_name',
        'description',
       
    ];
    protected static $logAttributes = [
        'name',
        'kh_name',
        'description',
    ];
    
    /**
     * Get the products that owns the brand
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function products()
    {
        return $this->belongsToMany(Product::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }
}
