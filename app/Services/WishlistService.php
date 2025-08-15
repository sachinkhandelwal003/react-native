<?php 
namespace App\Services;

use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Auth;

class WishlistService
{
    protected $cookieName = 'wishlist_items';

    public function getWishlist()
    {
        if (Auth::guard('appuser')->check()) {
            return Wishlist::with('product')
                ->where('user_id', Auth::guard('appuser')->id())
                ->get()
                ->pluck('product');
        } else {
            $wishlist = json_decode(Cookie::get($this->cookieName, '[]'), true);
            return Product::whereIn('id', $wishlist)->get();
        }
    }

    public function toggle($productId)
    {
        if (Auth::guard('appuser')->check()) {
            $exists = Wishlist::where('user_id', Auth::guard('appuser')->id())
                ->where('product_id', $productId)->exists();

            if ($exists) {
                Wishlist::where('user_id', Auth::guard('appuser')->id())
                    ->where('product_id', $productId)->delete();
                return 'removed';
            } else {
                Wishlist::create([
                    'user_id' => Auth::guard('appuser')->id(),
                    'product_id' => $productId
                ]);
                return 'added';
            }
        } else {
            $wishlist = json_decode(Cookie::get($this->cookieName, '[]'), true);
            if (in_array($productId, $wishlist)) {
                $wishlist = array_diff($wishlist, [$productId]);
                Cookie::queue($this->cookieName, json_encode(array_values($wishlist)), 60 * 24 * 30);
                return 'removed';
            } else {
                $wishlist[] = $productId;
                Cookie::queue($this->cookieName, json_encode($wishlist), 60 * 24 * 30);
                return 'added';
            }
        }
    }

    public function count()
    {
        return count($this->getWishlist());
    }
}
