<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class product extends Model
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
}
