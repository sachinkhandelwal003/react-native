<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Category;
use App\Models\Product;
use function Ramsey\Uuid\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShopController extends Controller
{
    public function index($categorySlug = null, $subcategorySlug = null)
    {
        $categories = Category::all();
        $category = null;
        $subcategory = null;
        $products = Product::where('status', 1);
        if ($subcategorySlug) {
            $subcategory = Category::where('slug', $subcategorySlug)->first();
            if ($subcategory) {
                $products->where('category_id', $subcategory->id);
            }
        } elseif ($categorySlug) {
            $category = Category::where('slug', $categorySlug)->first();
            if ($category) {
                $childrenIds = $category->children->pluck('id')->toArray();
                $products->whereIn('category_id', array_merge([$category->id], $childrenIds));
            }
        }
        $products = $products->latest()->get();
        return view('frontend.pages.shop-page', compact('products', 'category', 'subcategory', 'categories'));
    }


    public function productDetail(Request $request, $id)
    {
        $product = Product::with(['variants', 'category', 'wishlistedBy', 'gallery'])->findOrFail($id);

        $relatedProducts = Product::with('gallery')
            ->where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)
            ->latest()
            ->take(10)
            ->get();
        $recentlyViewedProducts = Product::with('gallery')
            ->orderby('id', 'desc')
            ->take(10)
            ->get();

        return view('frontend.pages.product-detail', compact('product', 'relatedProducts', 'recentlyViewedProducts'))->render();
    }



    public function compareProducts()
    {
        return view('frontend.pages.compare-products');
    }

    public function categoryDetail($slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();
        $subcategories = Category::where('parent_id', $category->id)->get();
        $products = Product::where('category_id', $category->id)->where('is_type', 1)->paginate(12); // Paginate with 12 products per page

        return view('frontend.pages.category-collection', compact('category', 'subcategories', 'products'));
    }
    public function quickView($id)
    {
        $product = Product::findOrFail($id);

        $html = view('partials.quick_view_modal', compact('product'))->render();

        return response()->json(['html' => $html]);
    }


}
