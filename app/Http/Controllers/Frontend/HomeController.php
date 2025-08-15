<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Review;
use App\Models\Category;
use App\Models\Product;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\FaqFormMail;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::where('status', 1)
            ->whereIn('is_type', [1, 2, 3])
            ->get();
        $categories = Category::where('status', 1)->get();
        $reviews = Review::where('status', 1)
            ->with('product:id,name')
            ->get();
        $banners = Banner::where('status', 1)->get();
        $blogs = \App\Models\Blog::latest()
            ->take(10)
            ->get();

        $coupon = Coupon::where('status', '1')
            ->whereDate('valid_from', '<=', now())
            ->whereDate('valid_to', '>=', now())
            ->inRandomOrder()
            ->first();

        return view('frontend.pages.index', compact('products', 'categories', 'blogs', 'banners', 'reviews', 'coupon'));
    }

    public function aboutUs(Request $request)
    {
        $reviews = Review::where('status', 1)->latest()->take(10)->get(); // only active reviews
        return view('frontend.pages.about-us', compact('reviews'));
    }
    public function contactUs()
    {
        return view('frontend.pages.contact');
    }

    public function ourStore()
    {
        return view('frontend.pages.store-list');
    }

    public function termsCondition()
    {
        return view('frontend.pages.term-condition');
    }

    public function returnRefund()
    {
        return view('frontend.pages.return-refund');
    }

    public function FAQs()
    {
        return view('frontend.pages.faqs');
    }

    public function submitFaq(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'topic' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        Mail::to('poshhpalatecare@gmail.com')->send(new FaqFormMail($data));

        return back()->with('success', 'Your request has been sent successfully!');
    }
}