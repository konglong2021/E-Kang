<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{
    use HasFactory,LogsActivity;

    protected $fillable = [

        'digit',
        'negative'
    ];
    protected static $logAttributes = [
        'digit',
        'negative'
    ];
}
