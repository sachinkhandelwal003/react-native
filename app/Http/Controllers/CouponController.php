<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use Illuminate\Support\Str;
use \Yajra\Datatables\Datatables;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class CouponController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth');
	}


	public function index(Request $request)
	{
		if ($request->ajax()) {
			$data = Coupon::select('id', 'code', 'discount', 'type', 'valid_from', 'valid_to', 'status', 'created_at');
			return Datatables::of($data)
				->editColumn('image', function ($row) {
					$btn = '<div class="img-group"><img class="" src="' . asset('storage/' . $row['image']) . '" alt=""></div>';
					return $btn;
				})
				->editColumn('created_at', function ($row) {
					return $row['created_at']->format('d M, Y');
				})
				->editColumn('status', function ($row) {
					return $row['status'] == 1 ? '<small class="badge fw-semi-bold rounded-pill status badge-light-success"> Active</small>' : '<small class="badge fw-semi-bold rounded-pill status badge-light-danger"> Inactive</small>';
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
				->rawColumns(['action', 'image', 'status'])
				->make(true);
		}
		return view('coupons.index');
	}

	public function add(): View
	{
		return view('coupons.add');
	}


	public function generateCoupon(Request $request)
	{
		$code = strtoupper(Str::random(8)); // Example: 8-char code like "D8KF2LZP"

		$validated = $request->validate([
			'discount' => 'required',
			'type' => 'required',
			'valid_from' => 'required',
			'valid_to' => 'required',
			'status' => 'required',
		]);
		$coupon = Coupon::create([
			'code' => strtoupper(Str::random(8)),
			'discount' => $validated['discount'],
			'type' => $validated['type'],
			'valid_from' => $validated['valid_from'],
			'valid_to' => $validated['valid_to'],
			'status' => $validated['status'],
		]);


		return to_route('coupons')->with('success', 'Coupon generated successfully!');
	}

	public function delete(Request $request)
	{
		return Helper::deleteRecord(new Coupon, $request->id);
	}


}
