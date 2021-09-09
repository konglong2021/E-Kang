<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends Model
{
    use HasFactory;
    use softDeletes;
    protected $fillable = [
        
        'title',
       
    ];


    public function customers()
    {
        return $this->hasMany(Customer::class);
    }

}
