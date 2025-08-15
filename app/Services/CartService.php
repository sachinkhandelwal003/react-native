<?php 
namespace App\Services;

use Illuminate\Support\Facades\Cookie;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
class CartService
{
    protected $cookieName = 'guest_cart';

    public function add($productId, $quantity)
    {
        $product = Product::findOrFail($productId);
        $price = $product->sale_price ?? $product->reguler_price;
        
        if (Auth::guard('appuser')->check()) {
            // Logged-in user
           /*  Cart::updateOrCreate(
                ['user_id' => Auth::guard('appuser')->id(), 'product_id' => $productId],
                ['quantity' => \DB::raw('quantity + ?', [$quantity])],
            ); */
			
			$cart = Cart::where('user_id', Auth::guard('appuser')->id())
				->where('product_id', $productId)
				->first();

			if ($cart) {
				$cart->increment('quantity', $quantity); // increments safely
			} else {
				Cart::create([
					'user_id' => Auth::guard('appuser')->id(),
					'product_id' => $productId,
					'quantity' => $quantity,
                    'price' => $price,
				]);
			}
			
			
        } else {
            // Guest user (session + cookie for persistence)
            $cart = session('guest_cart', json_decode(Cookie::get($this->cookieName, '[]'), true));
            $existing = collect($cart)->firstWhere('product_id', $productId);

            if ($existing) {
                foreach ($cart as &$item) {
                    if ($item['product_id'] == $productId) {
                        $item['quantity'] += $quantity;
                        break;
                    }
                }
            } else {
                $cart[] = ['product_id' => $productId, 'quantity' => $quantity, 'price' => $price];
            }

            // Store in session for immediate availability
            session(['guest_cart' => $cart]);
            
            // Also queue cookie for persistence
            Cookie::queue($this->cookieName, json_encode($cart), 60 * 24 * 7); // 7 days
        }
    }

	
	public function remove($productId)
	{
		if (Auth::guard('appuser')->check()) {
			Cart::where('user_id', Auth::guard('appuser')->id())
				->where('product_id', $productId)
				->delete();
		} else {
			// Guest user - use session + cookie
			$cart = session('guest_cart', json_decode(Cookie::get($this->cookieName, '[]'), true));
			
			// Filter out the item to remove
			$cart = array_filter($cart, function ($item) use ($productId) {
				return $item['product_id'] != $productId;
			});
			$cart = array_values($cart); // Re-index array
			
			// Store in session for immediate availability
			session(['guest_cart' => $cart]);
			
			// Also queue cookie for persistence
			Cookie::queue($this->cookieName, json_encode($cart), 60 * 24 * 7);
			
			// Force session to save immediately
			session()->save();
		}
	}
	

    public function getCart()
    {
       /* if (auth()->check()) {
            return Cart::where('user_id', auth()->id())->get();
        } else {
            return json_decode(Cookie::get($this->cookieName, '[]'), true);
        } */
	
		if (Auth::guard('appuser')->check()) {
			return Cart::with('product')
				->where('user_id', Auth::guard('appuser')->id())
				->get()
				 ->map(function ($item) {
					 $price = $item->price ?? $item->product->sale_price ?? $item->product->reguler_price ?? $item->product->regular_price;
					return [
						'product_id' => $item->product_id,
						'photo' => $item->product->photo,
						'slug' => $item->product->slug,
						'name' => $item->product->name,
						'price' => $price,
						'quantity' => $item->quantity,
						'subtotal' => $item->quantity * $price
					];
				}); 
		} else {
			// Guest user - check session first, then cookie as fallback
			$cart = session('guest_cart', json_decode(Cookie::get($this->cookieName, '[]'), true));
			
			// If session is empty but cookie exists, populate session from cookie
			if (empty($cart) && Cookie::get($this->cookieName)) {
				$cart = json_decode(Cookie::get($this->cookieName, '[]'), true);
				session(['guest_cart' => $cart]);
			}
			
			$productIds = collect($cart)->pluck('product_id')->toArray();
			$products = Product::whereIn('id', $productIds)->get()->keyBy('id');

			return collect($cart)->map(function ($item) use ($products) {
				$product = $products[$item['product_id']] ?? null;
				$price = $item['price'] ?? $product?->sale_price ?? $product?->reguler_price ?? $product?->regular_price ?? 0;
				return [
					'product_id' => $item['product_id'],
					'photo' => $product?->photo,
					'slug' => $product?->slug,
					'name' => $product?->name,
					'price' => $price,
					'quantity' => $item['quantity'],
					'subtotal' => $item['quantity'] * $price,
				];
			});
		}
	}
	

    public function clearGuestCart()
    {
        // Clear both session and cookie
        session()->forget('guest_cart');
        Cookie::queue(Cookie::forget($this->cookieName));
    }

    public function syncGuestCartToUser()
    {
        // Get cart from session first, then cookie as fallback
        $guestCart = session('guest_cart', json_decode(Cookie::get($this->cookieName, '[]'), true));

        if (!empty($guestCart)) {
            foreach ($guestCart as $item) {
                $existingCart = Cart::where('user_id', Auth::guard('appuser')->id())
                    ->where('product_id', $item['product_id'])
                    ->first();
                    
                if ($existingCart) {
                    // If item already exists in user cart, add the quantities
                    $existingCart->increment('quantity', $item['quantity']);
                } else {
                    // Create new cart item for user
                    Cart::create([
                        'user_id' => Auth::guard('appuser')->id(),
                        'product_id' => $item['product_id'],
                        'quantity' => $item['quantity'],
                        'price' => $item['price'] ?? null
                    ]);
                }
            }

            // Clear guest cart after sync
            $this->clearGuestCart();
        }
    }

    public function syncCartOnLogin()
    {
        // This method is called when user logs in
        $this->syncGuestCartToUser();
    }
	
	public function getCartCount()
	{
		if (Auth::guard('appuser')->check()) {
			return \App\Models\Cart::where('user_id', Auth::guard('appuser')->id())->sum('quantity');
		}

		// Guest user - check session first, then cookie as fallback
		$cart = session('guest_cart', json_decode(Cookie::get($this->cookieName, '[]'), true));
		return collect($cart)->sum('quantity');
	}
	
	public function initializeGuestCart()
	{
		if (!Auth::guard('appuser')->check() && !session()->has('guest_cart')) {
			$cookieCart = json_decode(Cookie::get($this->cookieName, '[]'), true);
			session(['guest_cart' => $cookieCart]);
		}
	}
}