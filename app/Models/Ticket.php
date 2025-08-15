<?php

namespace App\Models;

use App\Traits\CustomScopes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends Model
{
    use HasFactory, SoftDeletes, CustomScopes;

    protected $fillable = [
        'subject',
        'message',
        'user_id',
        'status',
        'image'
    ];
    
    public function appUser()
    {
        return $this->belongsTo(AppUser::class, 'user_id');
    }
}
