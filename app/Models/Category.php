<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
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
     * Get all of the categorie for the product
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    /**
     * The brands that belong to the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    
    public function brands()
    {
        return $this->belongsToMany(Brand::class);
    }

  
}
