<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Support\Str;
use App\Models\Product;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class ReviewController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Review::with('product:id,id,name')
                ->select('id', 'title', 'description', 'product_id', 'status', 'created_at');

            return Datatables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset('storage/' . $row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->editColumn('description', function ($row) {
                    return Str::limit(strip_tags($row['description']), 100); // Optional: limit to 100 chars
                })

                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })
                ->addColumn('product_name', function ($row) {
                    return $row->product?->name ?? '-';
                })

                ->editColumn('description', function ($row) {
                    return Str::limit(strip_tags($row['description']), 100); // Optional: limit to 100 chars
                })


                ->editColumn('status', function ($row) {
                    return $row['status'] == 1 ? '<small class="badge fw-semi-bold rounded-pill status badge-light-success"> Active</small>' : '<small class="badge fw-semi-bold rounded-pill status badge-light-danger"> Inactive</small>';
                })
                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route('review.edit', $row['id']) . '">Edit</a>';
                    }
                    if (Helper::userCan(104, 'can_delete')) {
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
                ->rawColumns(['action', 'image', 'product_name', 'status'])
                ->make(true);
        }
        return view('review.index');
    }
    public function add(): View
    {
        $products = Product::where('status', 1)->orderBy('name')->get(); // Optional: only active products
        return view('review.add', compact('products'));
    }


    public function save(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:200'],
            'description' => ['required', 'string', 'max:10000'],
            'status' => ['required', 'integer'],
            'product_id' => ['required']
        ]);


        Review::create($validated);
        return to_route('review')->withSuccess('Review Added Successfully..!!');
    }

    public function edit($id): View|RedirectResponse
    {
        $cms = Review::find($id);
        if (!$cms) {
            return to_route('review')->withError('Review Not Found..!!');
        }

        $products = Product::where('status', 1)->orderBy('name')->get();

        return view('review.edit', compact('cms', 'products'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $cms = Review::find($id);
        if (!$cms) {
            return to_route('review')->withError('Review Not Found..!!');
        }

        $data = $request->validate([
            'title' => ['required', 'string', 'max:200'],
            'description' => ['required', 'string', 'max:10000'],
            'status' => ['required', 'integer'],
            'product_id' => ['required']
        ]);
        $cms->update($data);
        return to_route('review')->withSuccess('Review Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Review, $request->id);
    }
}
