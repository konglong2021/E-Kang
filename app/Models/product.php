<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory;

    use softDeletes;

    protected $fillable = [
        'categorie_id',
        'code',
        'en_name',
        'kh_name',
        'description',
        'image',
    ];

    public function categories()
    {
        return $this->belongsTo(Categorie::class,'categorie_id', 'id');
    }

    public function brands()
    {
        return $this->belongsToMany(Brand::class);
    }

 
}
