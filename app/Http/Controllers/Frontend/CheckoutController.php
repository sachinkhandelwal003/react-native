<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Razorpay\Api\Api;
use Illuminate\Support\Facades\Log;
use App\Mail\OrderCreatedMail;
use Illuminate\Support\Facades\Mail;


class CheckoutController extends Controller
{
    private $razorpay;

    public function __construct()
    {
        $this->razorpay = new Api(
            config('services.razorpay.key'),
            config('services.razorpay.secret')
        );
    }

    public function applyCoupon(Request $request)
    {
        // Check authentication
        if (!Auth::guard('appuser')->check()) {
            return response()->json([
                'success' => false,
                'message' => 'Please log in to apply coupon'
            ], 401);
        }

        $coupon = Coupon::where('code', $request->coupon_code)->first();

        ;
        if (!$coupon || !$coupon->isValid()) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid or expired coupon code'
            ]);
        }
        $cartTotal = $request->cart_total; // Implement your cart total logic
        $discount = $coupon->type === 'fixed'
            ? $coupon->discount
            : ($cartTotal * $coupon->discount / 100);

        return response()->json([
            'success' => true,
            'message' => 'Coupon applied successfully',
            'discount' => $discount
        ]);
    }

    public function createOrder(Request $request)
    {
        if (!Auth::guard('appuser')->check()) {
            return response()->json([
                'success' => false,
                'message' => 'Please log in to place an order'
            ], 401);
        }
        try {
            $validated = $request->validate([
                'firstname' => 'required',
                'lastname' => 'required',
                'email' => 'required|email',
                'mobile_number' => 'required',
                'country' => 'required',
                'city' => 'required',
                'street' => 'required',
                'postal_code' => 'required'
            ]);

            $cartItems = $request->cart_items;
            $total = $request->total_amount;
            $discount = $this->calculateDiscount($request->coupon_code, $total);

            $amount = ($total - $discount) * 100;

            $razorpayOrder = $this->razorpay->order->create([
                'amount' => $amount,
                'currency' => 'INR',
                'receipt' => 'order_' . time() . '_' . rand(1000, 9999),
            ]);

            $order = Order::create([
                'user_id' => Auth::guard('appuser')->id(),
                'order_number' => 'ORD-' . time(),
                'total_amount' => $total,
                'discount_amount' => $discount,
                'status' => 'pending',
                'payment_status' => 'pending',
                'razorpay_order_id' => $razorpayOrder->id,
                'coupon_code' => $request->coupon_code,
                'firstname' => $request->firstname,
                'lastname' => $request->lastname,
                'email' => $request->email,
                'mobile_number' => $request->mobile_number,
                'country' => $request->country,
                'state' => $request->state,
                'city' => $request->city,
                'street' => $request->street,
                'postal_code' => $request->postal_code,
                'notes' => $request->notes
            ]);
            foreach ($cartItems as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'name' => $item['name'],
                    'price' => $item['price'],
                    'quantity' => $item['quantity'],
                    'subtotal' => $item['subtotal'],
                    'size' => $item['size'] ?? '',
                    'color' => $item['color'] ?? ''
                ]);
            }
            Mail::to('poshhpalatecare@gmail.com')
                ->cc($order->email)
                ->send(new OrderCreatedMail($order));

            $this->clearCart();

            return response()->json([
                'success' => true,
                'order_id' => $order->id,
                'razorpay_order_id' => $razorpayOrder->id,
                'message' => 'Order created successfully'
            ]);

        } catch (\Exception $e) {
            Log::error('Order creation error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Error creating order: ' . $e->getMessage()
            ], 500);
        }
    }

    public function verifyPayment(Request $request)
    {
        // Check authentication
        if (!Auth::guard('appuser')->check()) {
            return response()->json([
                'success' => false,
                'message' => 'Please log in to verify payment'
            ], 401);
        }

        try {
            $attributes = [
                'razorpay_order_id' => $request->razorpay_order_id,
                'razorpay_payment_id' => $request->razorpay_payment_id,
                'razorpay_signature' => $request->razorpay_signature
            ];

            // Verify payment signature
            $this->razorpay->utility->verifyPaymentSignature($attributes);

            $order = Order::where('id', $request->order_id)
                ->where('user_id', Auth::guard('appuser')->id())
                ->firstOrFail();
            $order->update([
                'payment_status' => 'completed',
                'status' => 'processing',
                'razorpay_payment_id' => $request->razorpay_payment_id
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Payment verified successfully',
                'order_id' => $order->id
            ]);
        } catch (\Razorpay\Api\Errors\SignatureVerificationError $e) {
            Log::error('Payment signature verification failed: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Payment signature verification failed'
            ], 400);
        } catch (\Exception $e) {
            Log::error('Payment verification error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Payment verification failed'
            ], 400);
        }
    }

    private function calculateDiscount($couponCode, $total)
    {
        if (!$couponCode)
            return 0;

        $coupon = Coupon::where('code', $couponCode)->first();
        if (!$coupon || !$coupon->isValid())
            return 0;

        return $coupon->type === 'fixed'
            ? $coupon->discount
            : ($total * $coupon->discount / 100);
    }


    public function clearCart()
    {
        if (Auth::guard('appuser')->check()) {
            \App\Models\Cart::where('user_id', Auth::guard('appuser')->id())->delete();
        } else {
            // For guest users, clear cart cookie
            Cookie::queue(Cookie::forget('guest_cart'));
        }
    }


}