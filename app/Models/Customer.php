<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;
    protected $fillable = [
        'member_id',
        'name',
        'address',
        'phone',

    ];
    protected static $logAttributes = [
        'member_id',
        'name',
        'address',
        'phone',
    ];



    public function members()
    {
        return $this->belongsTo(Member::class);
    }

   
    public function orders()
    {
        return $this->hasMany(Order::class);
    }

   
}
