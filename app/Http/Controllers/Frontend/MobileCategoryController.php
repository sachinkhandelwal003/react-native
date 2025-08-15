<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;

class MobileCategoryController extends Controller
{
    public function belts()
    {
        $category = Category::where('slug', 'belts')->first();

        $products = collect(); // empty collection if no category found
        if ($category) {
            $products = Product::where('category_id', $category->id)
                ->where('status', 1)
                ->latest()
                ->get();
        }

        return view('frontend.menucategory.belts', compact('products'));
    }

    public function begs()
    {
        $category = Category::where('slug', 'bags')->first();

        $products = collect();
        if ($category) {
            $products = Product::where('category_id', $category->id)
                ->where('status', 1)
                ->latest()
                ->get();
        }

        return view('frontend.menucategory.begs', compact('products'));
    }
    public function stoles()
    {
        $category = Category::where('slug', 'stoles')->first();

        $products = collect();
        if ($category) {
            $products = Product::where('category_id', $category->id)
                ->where('status', 1)
                ->latest()
                ->get();
        }

        return view('frontend.menucategory.stoles', compact('products'));
    }

}
