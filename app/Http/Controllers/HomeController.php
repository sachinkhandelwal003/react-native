<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\Order;
use App\Models\Review;
use App\Models\Ticket;
use App\Models\Blog;
use App\Models\Category;
use App\Models\AppUser;
use App\Models\Newsletter;
use Illuminate\Support\Carbon;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View
    {
        $months = collect(range(0, 5))->map(fn($i) => Carbon::now()->subMonths($i)->format('F'))->reverse();
        $monthlyOrderCounts = $months->map(function ($month) {
            return Order::whereMonth('created_at', Carbon::parse($month)->month)->count();
        });

        $statusCounts = Order::select('status')
            ->get()
            ->groupBy('status')
            ->map(fn($orders) => $orders->count());

        $userStatusCounts = AppUser::select('status')
            ->get()
            ->groupBy('status')
            ->map(fn($users) => $users->count());

        $subscriberMonths = collect(range(0, 5))->map(function ($i) {
            return Carbon::now()->subMonths($i)->format('M Y');
        })->reverse();

        $subscriberCounts = $subscriberMonths->map(function ($month) {
            return Newsletter::whereMonth('created_at', Carbon::parse($month)->month)
                ->whereYear('created_at', Carbon::parse($month)->year)
                ->count();
        });

        $recentOrders = Order::with('appUser')
            ->latest()
            ->paginate(10);
        $totalProductSales = Order::where('status', 'completed')
            ->with('items')
            ->get()
            ->sum(function ($order) {
                return $order->items->sum('quantity');
            });
        $totalPendingProducts = Order::where('status', 'pending')
            ->with('items')
            ->get()
            ->sum(function ($order) {
                return $order->items->sum('quantity');
            });
        $todayProductOrders = Order::whereDate('created_at', Carbon::today())
            ->with('items')
            ->get()
            ->sum(function ($order) {
                return $order->items->sum('quantity');
            });
        $totalCustomers = AppUser::count();
        $totalCategories = Category::count();
        $totalticket = Ticket::count();
        $totalreview = Review::count();
        $totalblog = Blog::count();
        return view('home', [
            'totalOrders' => Order::count(),
            'completedOrders' => Order::where('status', 'completed')->count(),
            'pendingOrders' => Order::where('status', 'pending')->count(),
            'cancelledOrders' => Order::where('status', 'cancelled')->count(),
            'monthlyOrderCounts' => $monthlyOrderCounts,
            'monthLabels' => $months,
            'statusCounts' => $statusCounts,
            'userStatusCounts' => $userStatusCounts,
            'subscriberLabels' => $subscriberMonths,
            'subscriberData' => $subscriberCounts,
            'recentOrders' => $recentOrders,
            'totalPendingProducts' => $totalPendingProducts,
            'totalProductSales' => $totalProductSales,
            'todayProductOrders' => $todayProductOrders,
            'totalreview' => $totalreview,
            'totalCustomers' => $totalCustomers,
            'totalCategories' => $totalCategories,
            'totalticket' => $totalticket,
            'totalblog' => $totalblog,
        ]);
    }
}