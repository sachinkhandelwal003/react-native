<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Order::select([
                'id',
                'user_id',
                'order_number',
                'firstname',
                'lastname',
                'email',
                'mobile_number',
                'country',
                'state',
                'city',
                'street',
                'postal_code',
                'coupon_code',
                'notes',
                'total_amount',
                'discount_amount',
                'payment_status',
                'razorpay_order_id',
                'razorpay_payment_id',
                'status',
                'created_at'
            ])->latest()->get();

            return DataTables::of($data)
                ->editColumn('created_at', fn($row) => $row->created_at->format('d M, Y'))
                ->editColumn('status', function ($row) {
                    $statuses = [
                        'pending' => 'Pending',
                        'processing' => 'In Progress',
                        'delivered' => 'Delivered',
                        'completed' => 'Completed',
                        'cancel' => 'Cancelled'
                    ];
                    $select = '<select class="status-select form-select form-select-sm custom-select-box" data-id="' . $row->id . '" data-original-status="' . $row->status . '">';
                    foreach ($statuses as $value => $label) {
                        $selected = $row->status === $value ? 'selected' : '';
                        $select .= '<option value="' . $value . '" ' . $selected . '>' . $label . '</option>';
                    }
                    $select .= '</select>';
                    return $select;
                })
                ->addColumn('total_amount', fn($row) => '₹' . number_format($row->total_amount, 2))
                ->addColumn('discount_amount', fn($row) => '₹' . number_format($row->discount_amount, 2))
                ->addColumn('payment_status', fn($row) => ucfirst($row->payment_status ?? '-'))
                ->addColumn('razorpay_order_id', fn($row) => $row->razorpay_order_id ?? '-')
                ->addColumn('razorpay_payment_id', fn($row) => $row->razorpay_payment_id ?? '-')
                ->addColumn('notes', fn($row) => Str::limit($row->notes ?? '-', 40))
                ->addColumn('action', function ($row) {
                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fas fa-ellipsis-h fs--1"></span></button>
                            <div class="dropdown-menu" aria-labelledby="drop">';
                    
                    $btn .= '<a class="dropdown-item logistic-order-btn" href="#" data-id="' . $row->id . '">Logistic Order</a>';
                    $btn .= '<a class="dropdown-item add-logistic-btn" href="#" data-id="' . $row->id . '">Add Logistic</a>';

                    $btn .= '</div>';
                    return $btn;
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }

        return view('orders.index');
    }

    public function updateStatus(Request $request): JsonResponse
    {
        try {
            \Log::channel('stack')->info('Update Status Request:', $request->all());

            $request->validate([
                'order_id' => 'required|exists:orders,id',
                'status' => 'required|in:pending,processing,delivered,completed,cancel'
            ]);

            $order = Order::find($request->order_id);
            if ($order) {
                $order->status = $request->status;
                $saved = $order->save();
                \Log::channel('stack')->info('Order Update Result:', ['id' => $order->id, 'status' => $order->status, 'saved' => $saved]);

                return response()->json([
                    'status' => $saved,
                    'message' => $saved ? 'Order status updated successfully' : 'Failed to update order status'
                ]);
            }

            return response()->json([
                'status' => false,
                'message' => 'Order not found'
            ], 404);
        } catch (\Exception $e) {
            \Log::channel('stack')->error('Update Status Error:', ['message' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return response()->json([
                'status' => false,
                'message' => 'An error occurred: ' . $e->getMessage()
            ], 500);
        }
    }
    public function logisticOrder(Request $request)
    {

        $request->validate([
            'order_id' => 'required|exists:orders,id',
        ]);

        $order = Order::find($request->order_id);

        $order->update([
            'status' => 'logistic_confirmed'
        ]);

        return response()->json(['message' => 'Logistic order confirmed successfully!']);
    }
    public function pendingorder(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Order::where('status', 'pending')
                ->select([
                    'id',
                    'user_id',
                    'order_number',
                    'firstname',
                    'lastname',
                    'email',
                    'mobile_number',
                    'country',
                    'state',
                    'city',
                    'street',
                    'postal_code',
                    'coupon_code',
                    'notes',
                    'total_amount',
                    'discount_amount',
                    'payment_status',
                    'razorpay_order_id',
                    'razorpay_payment_id',
                    'status',
                    'created_at'
                ])
                ->latest()
                ->get();

            return DataTables::of($data)
                ->addColumn('id', fn($row) => $row->id)
                ->editColumn('created_at', fn($row) => $row->created_at->format('d M, Y'))
                ->editColumn('status', function ($row) {
                    $statuses = [
                        'pending' => 'Pending',
                        'processing' => 'In Progress',
                        'delivered' => 'Delivered',
                        'completed' => 'completed',
                        'cancel' => 'Cancelled'
                    ];
                    $select = '<select class="status-select form-select form-select-sm custom-select-box" data-id="' . $row->id . '" data-original-status="' . $row->status . '">';
                    foreach ($statuses as $value => $label) {
                        $selected = $row->status === $value ? 'selected' : '';
                        $select .= '<option value="' . $value . '" ' . $selected . '>' . $label . '</option>';
                    }
                    $select .= '</select>';
                    return $select;
                })
                ->addColumn('user_id', fn($row) => $row->user_id)
                ->addColumn('order_number', fn($row) => $row->order_number)
                ->addColumn('total_amount', fn($row) => '₹' . number_format($row->total_amount, 2))
                ->addColumn('discount_amount', fn($row) => '₹' . number_format($row->discount_amount, 2))
                ->addColumn('payment_status', fn($row) => ucfirst($row->payment_status ?? '-'))
                ->addColumn('razorpay_order_id', fn($row) => $row->razorpay_order_id ?? '-')
                ->addColumn('razorpay_payment_id', fn($row) => $row->razorpay_payment_id ?? '-')
                ->addColumn('firstname', fn($row) => $row->firstname ?? '-')
                ->addColumn('lastname', fn($row) => $row->lastname ?? '-')
                ->addColumn('email', fn($row) => $row->email ?? '-')
                ->addColumn('mobile_number', fn($row) => $row->mobile_number ?? '-')
                ->addColumn('country', fn($row) => $row->country ?? '-')
                ->addColumn('state', fn($row) => $row->state ?? '-')
                ->addColumn('city', fn($row) => $row->city ?? '-')
                ->addColumn('street', fn($row) => $row->street ?? '-')
                ->addColumn('postal_code', fn($row) => $row->postal_code ?? '-')
                ->addColumn('notes', fn($row) => Str::limit($row->notes ?? '-', 40))
                ->addColumn('coupon_code', fn($row) => $row->coupon_code ?? '-')
                ->addColumn('action', function ($row) {
                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';

                    if (Helper::userCan(104, 'can_create')) {
                        $btn .= '<a class="dropdown-item logistic-order-btn" href="#" data-id="' . $row->id . '">Logistic Order</a>';
                    }

                    $btn .= '</div>';
                    return $btn;
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }

        return view('orders.pending');
    }
    public function completeorder(Request $request)
    {
        if ($request->ajax()) {
            $data = Order::where('status', 'completed')
                ->select([
                    'id',
                    'user_id',
                    'order_number',
                    'firstname',
                    'lastname',
                    'email',
                    'mobile_number',
                    'country',
                    'state',
                    'city',
                    'street',
                    'postal_code',
                    'coupon_code',
                    'notes',
                    'total_amount',
                    'discount_amount',
                    'payment_status',
                    'razorpay_order_id',
                    'razorpay_payment_id',
                    'status',
                    'created_at'
                ])
                ->latest()
                ->get();

            return DataTables::of($data)
                ->addColumn('id', fn($row) => $row->id)
                ->editColumn('created_at', fn($row) => $row->created_at->format('d M, Y'))
                ->editColumn('status', function ($row) {
                    $statuses = [
                        'pending' => 'Pending',
                        'processing' => 'In Progress',
                        'delivered' => 'Delivered',
                        'completed' => 'completed',
                        'cancel' => 'Cancelled'
                    ];
                    $select = '<select class="status-select form-select form-select-sm custom-select-box" data-id="' . $row->id . '" data-original-status="' . $row->status . '">';
                    foreach ($statuses as $value => $label) {
                        $selected = $row->status === $value ? 'selected' : '';
                        $select .= '<option value="' . $value . '" ' . $selected . '>' . $label . '</option>';
                    }
                    $select .= '</select>';
                    return $select;
                })
                ->addColumn('user_id', fn($row) => $row->user_id)
                ->addColumn('order_number', fn($row) => $row->order_number)
                ->addColumn('total_amount', fn($row) => '₹' . number_format($row->total_amount, 2))
                ->addColumn('discount_amount', fn($row) => '₹' . number_format($row->discount_amount, 2))
                ->addColumn('payment_status', fn($row) => ucfirst($row->payment_status ?? '-'))
                ->addColumn('razorpay_order_id', fn($row) => $row->razorpay_order_id ?? '-')
                ->addColumn('razorpay_payment_id', fn($row) => $row->razorpay_payment_id ?? '-')
                ->addColumn('firstname', fn($row) => $row->firstname ?? '-')
                ->addColumn('lastname', fn($row) => $row->lastname ?? '-')
                ->addColumn('email', fn($row) => $row->email ?? '-')
                ->addColumn('mobile_number', fn($row) => $row->mobile_number ?? '-')
                ->addColumn('country', fn($row) => $row->country ?? '-')
                ->addColumn('state', fn($row) => $row->state ?? '-')
                ->addColumn('city', fn($row) => $row->city ?? '-')
                ->addColumn('street', fn($row) => $row->street ?? '-')
                ->addColumn('postal_code', fn($row) => $row->postal_code ?? '-')
                ->addColumn('notes', fn($row) => Str::limit($row->notes ?? '-', 40))
                ->addColumn('coupon_code', fn($row) => $row->coupon_code ?? '-')
                ->addColumn('action', function ($row) {
                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';

                    if (Helper::userCan(104, 'can_create')) {
                        $btn .= '<a class="dropdown-item logistic-order-btn" href="#" data-id="' . $row->id . '">Logistic Order</a>';
                    }

                    $btn .= '</div>';
                    return $btn;
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }

        return view('orders.complete');
    }

}
