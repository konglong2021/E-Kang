<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;
    protected $fillable = [
        
        'title',
        'discount'
       
    ];
    protected static $logAttributes = [
        'title',
        "discount"
    ];


    public function customers()
    {
        return $this->hasMany(Customer::class);
    }

}
