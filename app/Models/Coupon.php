<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $fillable = ['code', 'discount', 'type', 'valid_from', 'valid_to', 'status'];

    public function isValid()
    {
        return $this->status == 'active' &&
            now()->between($this->valid_from, $this->valid_to);
    }
}