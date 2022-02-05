<?php

namespace App\Models;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Warehouse extends Model
{
    use HasFactory,LogsActivity;
    use softDeletes;
    protected $fillable = [
        'name',
        'address',
    ];
    protected static $logAttributes = [
        'name',
        'address',
    ];

    public function stock()
    {
        return $this->hasMany(Stock::class);
    }
}
