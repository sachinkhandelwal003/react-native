<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AppUser; 
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function __construct()
    {
        // Ensure user is authenticated for all methods
        $this->middleware('ensure.logged.in')->except([]);
    }

    public function index()
    {
        // echo auth()->user()->id; die;
         $myAccount = AppUser::find(auth()->guard('appuser')->user()->id);
         //dd($myAccount);
        return view('frontend.pages.my-account', compact('myAccount'));
    }

    public function myAccount()
    {
        $myAccount = AppUser::find(auth()->guard('appuser')->user()->id);
        return view('frontend.pages.my-account', compact('myAccount'));
    }

    public function myAccountOrder(){
        // Get orders for the authenticated user
        $orders = Order::where('user_id', Auth::guard('appuser')->id())
                      ->with('items.product')
                      ->orderBy('created_at', 'desc')
                      ->get();
        
        return view('frontend.pages.my-account-order', compact('orders'));
    }

    public function myAccountOrderDetail($orderId)
    {
        // Get specific order with items for the authenticated user
        $order = Order::where('user_id', Auth::guard('appuser')->id())
                     ->where('id', $orderId)
                     ->with(['items.product'])
                     ->firstOrFail();
        
        return view('frontend.pages.my-account-order-detail', compact('order'));
    }

    public function myAccountAddress()
    {
        return view('frontend.pages.my-account-address');
    }
}
