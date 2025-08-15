<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'user_id',
        'order_number',
        'total_amount',
        'discount_amount',
        'status',
        'payment_status',
        'razorpay_order_id',
        'razorpay_payment_id',
        'firstname',
        'lastname',
        'email',
        'mobile_number',
        'country',
        'state',
        'city',
        'street',
        'postal_code',
        'notes',
        'coupon_code'
    ];

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function appUser()
    {
        return $this->belongsTo(AppUser::class, 'user_id');
    }
}