<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Services\CartService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShoppingCartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function index()
    {
        $miniCartItems = $this->cartService->getCart();
        return view('frontend.pages.shopping-cart', compact('miniCartItems'));
    }

    public function checkOut()
    {
        if (!Auth::guard('appuser')->check()) {
            return redirect()->route('user.login')
                ->with('error', 'Please log in to proceed with checkout.')
                ->with('intended_url', route('shopping.checkout'));
        }

        $miniCartItems = $this->cartService->getCart();
        $total = $miniCartItems->sum('subtotal');

        if ($miniCartItems->isEmpty()) {
            return redirect()->route('shopping.cart')
                ->with('error', 'Your cart is empty. Please add some products before checkout.');
        }

        return view('frontend.pages.checkout', compact('miniCartItems', 'total'));
    }
}
