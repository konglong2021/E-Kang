<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'warehouse_id',
        'firstname',
        'lastname',
        'gender',
        'occupation',
        'phone',
        'address',
        'email',
        'birthdate',
        'active'
       
    ];

    protected static $logAttributes = [
        'user_id',
        'warehouse_id',
        'firstname',
        'lastname',
        'gender',
        'occupation',
        'phone',
        'address',
        'email',
        'birthdate',
        'active'
    ];

    public function users()
    {
        return $this->hasOne(User::class);
    }
}
