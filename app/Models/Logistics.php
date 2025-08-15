<?php

namespace App\Models;

use App\Traits\CustomScopes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Logistics extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'awb_number',
        'url',
        'order_id'
    ];
}
