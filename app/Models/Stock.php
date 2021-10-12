<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Stock extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = [

        'warehouse_id',
        'product_id',
        'alert',
        'balance',

    ];
}
