<?php

namespace App\Providers;

use App\Http\Kernel;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use App\Services\CartService;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(Kernel $kernel,  CartService $cartService): void
    {
        Paginator::useBootstrapFive();
        Schema::defaultStringLength(191);
		
		// ✅ Share cart count and items globally (for header + mini cart)
		View::composer('*', function ($view) use ($cartService) {
			// Initialize guest cart session from cookie if needed
			$cartService->initializeGuestCart();
		
			$view->with('headerCartCount', $cartService->getCartCount());
			$view->with('miniCartItems', $cartService->getCart());
		});

    }
}
