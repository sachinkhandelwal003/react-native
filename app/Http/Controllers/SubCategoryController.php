<?php

namespace App\Http\Controllers;

use App\Models\Cms;
use App\Helper\Helper;
use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class SubCategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Subcategory::whereNull('deleted_at');
            return Datatables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset('storage/' . $row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })

                ->addColumn('category_name', function ($row) {
                    return $row->category->name;
                })
                ->editColumn('status', function ($row) {
                    return $row['status'] == 1 ? '<small class="badge fw-semi-bold rounded-pill status badge-light-success"> Active</small>' : '<small class="badge fw-semi-bold rounded-pill status badge-light-danger"> Inactive</small>';
                })
                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route('sub-category.edit', $row['id']) . '">Edit</a>';
                    }
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
                ->rawColumns(['action', 'image', 'category_name','status'])
                ->make(true);
        }
        return view('subcategories.index');
    }

    public function add(): View
    {
        $categories = Category::active()->get();
        return view('subcategories.add', compact('categories'));
    }

    public function save(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name'        => ['required'],
            'slug'        => ['required'],
            'category_id' => ['required'],
            'status'      => ['required'],
        ]);

        Subcategory::create($validated);
        return to_route('sub-category')->withSuccess('Sub Category Added Successfully..!!');
    }


    public function edit($id): View|RedirectResponse
    {
        $cms = Subcategory::find($id);
        $categories = Category::active()->get();
        if (!$cms) {
            return to_route('sub-category')->withError('Sub Category Not Found..!!');
        }
        return view('subcategories.edit', compact('cms','categories'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $cms = Subcategory::find($id);
        if (!$cms) {
            return to_route('sub-category')->withError('Sub Category Not Found..!!');
        }

        $data = $request->validate([
            'name'        => ['required'],
            'slug'        => ['required'],
            'category_id' => ['required'],
            'status'      => ['required'],
        ]);

        $cms->update($data);
        return to_route('sub-category')->withSuccess('Sub Category Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Category(), $request->id);
    }
}
