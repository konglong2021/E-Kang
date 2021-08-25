<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    use HasFactory;

    protected $fillable = [
        'categorie_id',
        'code',
        'en_name',
        'kh_name',
        'description',
        'image',
    ];
}
