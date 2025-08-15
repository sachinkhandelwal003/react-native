<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\CartService;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\Cart; 
class CartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    // 🛒 Add to cart
    public function add(Request $request)
    {
        // Handle JSON input
        if ($request->isJson()) {
            $data = $request->json()->all();
            $request->merge($data);
        }
        
        try {
            $request->validate([
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1'
            ]);

            $this->cartService->add($request->product_id, $request->quantity);
            
            $cartCount = $this->cartService->getCartCount();
            
            $miniCartHtml = view('frontend.common.mini_cart', [
                'cartItems' => $this->cartService->getCart()
            ])->render();

            return response()->json([
                'success' => true,
                'cart_count' => $cartCount,
                'mini_cart_html' => $miniCartHtml,
                'message' => 'Item added to cart',
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error: ' . implode(', ', $e->validator->errors()->all())
            ], 422);
        } catch (\Exception $e) {
            Log::error('Cart add error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Error adding item to cart: ' . $e->getMessage()
            ], 500);
        }
    }
	
public function remove(Request $request)
{
    // Handle JSON input
    if ($request->isJson()) {
        $data = $request->json()->all();
        $request->merge($data);
    }
    
    $request->validate([
        'product_id' => 'required|exists:products,id'
    ]);

    try {
        // ✅ Remove from cart
        $this->cartService->remove($request->product_id);

        // ✅ Get updated cart count
        $cartCount = $this->cartService->getCartCount();

        // ✅ Re-render mini cart HTML
        $miniCartHtml = view('frontend.common.mini_cart', [
            'cartItems' => $this->cartService->getCart()
        ])->render();

        // ✅ Send JSON response
        return response()->json([
            'success' => true,
            'cart_count' => $cartCount,
            'mini_cart_html' => $miniCartHtml,
            'message' => 'Item removed from cart'
        ]);
    } catch (\Exception $e) {
        Log::error('Cart remove error: ' . $e->getMessage());
        return response()->json([
            'success' => false,
            'message' => 'Error removing item from cart: ' . $e->getMessage()
        ], 500);
    }
}


	
    // 📦 Get current cart
    public function index()
    {
        $cartItems = $this->cartService->getCart();
        return response()->json($cartItems);
    }

    // ❌ Clear guest cart (if needed)
    public function clearGuest()
    {
        $this->cartService->clearGuestCart();
        return response()->json(['message' => 'Guest cart cleared']);
    }
	
	
	
	public function productdatils(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
            'size' => 'nullable|string|max:50',
            'color' => 'nullable|string|max:50',
        ]);

        $product = Product::findOrFail($request->product_id);
        if ($product->stock < $request->quantity) {
            return response()->json(['message' => 'Insufficient stock'], 400);
        }

        $price = $product->sale_price ?? $product->reguler_price;

        $cartItem = Cart::where([
            'user_id' => Auth::guard('appuser')->id() ?? null,
            'product_id' => $request->product_id,
            'size' => $request->size,
            'color' => $request->color,
        ])->first();

        if ($cartItem) {
            $cartItem->quantity += $request->quantity;
            $cartItem->save();
        } else {
            Cart::create([
                'user_id' => Auth::guard('appuser')->id() ?? null,
                'product_id' => $request->product_id,
                'quantity' => $request->quantity,
                'size' => $request->size,
                'color' => $request->color,
                'price' => $price,
            ]);
        }

        return response()->json(['message' => 'Item added to cart successfully']);
    }
	
	// 📦 Get current cart for AJAX requests
    public function getCartData()
    {
        try {
            $cartItems = $this->cartService->getCart();
            $cartCount = $this->cartService->getCartCount();
            
            $miniCartHtml = view('frontend.common.mini_cart', [
                'cartItems' => $cartItems
            ])->render();

            return response()->json([
                'success' => true,
                'cart_count' => $cartCount,
                'mini_cart_html' => $miniCartHtml,
                'cart_items' => $cartItems
            ]);
        } catch (\Exception $e) {
            Log::error('Cart data fetch error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Error fetching cart data'
            ], 500);
        }
    }
}
