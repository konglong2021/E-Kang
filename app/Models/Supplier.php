<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Supplier extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;
    protected $fillable = [
        'name',
        'address',
        'email',
        'phone',
       
    ];
    protected static $logAttributes = [
        'name',
        'address',
        'email',
        'phone',
    ];
}
