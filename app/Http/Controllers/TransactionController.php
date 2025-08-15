<?php

namespace App\Http\Controllers;

use App\Models\Cms;
use App\Helper\Helper;
use App\Models\Order;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class TransactionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Order::select('id', 'user_id', 'razorpay_payment_id', 'status', 'payment_status', 'created_at');

            return Datatables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset('storage/' . $row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->addColumn('user_email', function ($row) {
                    return optional($row->appUser)->email ?? 'N/A';
                })

                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })

                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(105, 'can_delete')) {
                        $btn .= '<button class="dropdown-item text-danger delete" data-id="' . $row['id'] . '">Delete</button>';
                    }
                    if (Helper::userAllowed(104)) {
                        return $btn;
                    } else {
                        return '';
                    }
                })
                ->orderColumn('created_at', function ($query, $order) {
                    $query->orderBy('created_at', $order);
                })
                ->rawColumns(['action', 'image','user_email'])
                ->make(true);
        }
        return view('transaction.index');
    }
    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Order, $request->id);
    }
}
