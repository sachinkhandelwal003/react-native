<?php

// app/Providers/ViewServiceProvider.php
namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Category;

class ViewServiceProvider extends ServiceProvider
{
    public function boot()
    {
        view()->composer('partials.header', function ($view) {
            $categories = Category::whereNull('parent_id') 
                ->select('name', 'slug')
                ->orderBy('serial', 'asc')
                ->get();

            $view->with('headerCategories', $categories);
        });
    }
}
