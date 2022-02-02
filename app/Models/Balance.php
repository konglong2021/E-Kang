<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Balance extends Model
{
    use HasFactory,LogsActivity;
    protected $fillable = [
        'remain',
        'income',
        'withdraw',
        'balance',
        'balance_date',
        'warehouse_id',
        'user_id'
       
    ];
    protected static $logAttributes = [
        'remain',
        'income',
        'withdraw',
        'balance',
        'balance_date',
        'warehouse_id',
        'user_id'
    ];
    
}
