<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AppUser extends Authenticatable
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'image',
        'first_name',
        'last_name',
        'email',
        'phone_number',
        'password',
        'status'
    ];
    public function getFullNameAttribute()
    {
        return trim($this->first_name . ' ' . $this->last_name);
    }
    protected $hidden = ['password'];
}
