<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\WishlistService;

class WishlistController extends Controller
{
    protected $wishlist;

    public function __construct(WishlistService $wishlist)
    {
        $this->wishlist = $wishlist;
    }

	
    public function toggle(Request $request)
    {
        $result = $this->wishlist->toggle($request->product_id);
        return response()->json(['status' => $result]);
    }

    public function index()
    {
        $wishlist = $this->wishlist->getWishlist();
		
        return view('frontend.pages.wish-list', compact('wishlist'));
    }

   
}
