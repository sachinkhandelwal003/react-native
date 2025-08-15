<?php

namespace App\Http\Controllers;

use App\Models\Cms;
use App\Helper\Helper;
use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function categoryDetail($slug)
    {

        $category = Category::where('slug', $slug)->where('status', 1)->firstOrFail();
        $products = Product::where('status', 1)
        ->whereIn('category_id', [1,2,3,4])
        ->get();

        $subcategories = $category->subcategories()->where('status', 1)->get();


        return view('frontend.pages.category-detail', compact('category', 'products', 'subcategories'));
    }



    public function index(Request $request): View|JsonResponse
    {
        // $categories = Category::with('children')->get(); // eager load subcategories
        if ($request->ajax()) {
             $data = Category::with('parent')->whereNull('deleted_at');

            // $data = Category::whereNull('deleted_at');
            return Datatables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset( '/storage/'.$row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })
                ->editColumn('status', function ($row) {
                    return $row['status'] == 1 ? '<small class="badge fw-semi-bold rounded-pill status badge-light-success"> Active</small>' : '<small class="badge fw-semi-bold rounded-pill status badge-light-danger"> Inactive</small>';
                })

                ->addColumn('parent_id', fn($row) => $row->parent?->name ?? '<em>None</em>')

                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route('category.edit', $row['id']) . '">Edit</a>';
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
               ->rawColumns(['image', 'status', 'action', 'parent_id'])
                ->make(true);
        }
        return view('categories.index');
    }

    public function add(): View
    {
        $categories = Category::all();
        return view('categories.add', compact('categories'));
    }

    public function save(Request $request): RedirectResponse
    {
       //dd($request->all());
        $validated = $request->validate([
            'name'         => ['required'],
            'slug'   => ['required'],
            // 'meta_keywords'        => ['required'],
            // 'meta_descriptions'        => ['required'],
            'status'        => ['required'],
            'serial'        => ['required'],
            'image' => ['image', 'mimes:jpg,png,jpeg', 'max:5048'],
            'parent_id' => ['nullable'],
        ]);

        $data = [...$validated, 'image' => 'category/image.png'];
        // Cast "empty" parent_id to null
        $data['parent_id'] = $request->parent_id ?: null;

        if ($request->file('image')) {
            $data['image'] = Helper::saveFile($request->file('image'), 'category');
        }

        Category::create($data);
        return to_route('category')->withSuccess('Category Added Successfully..!!');
    }

    public function edit($id): View|RedirectResponse
    {
        $categories = Category::all();
        $cms = Category::find($id);
        if (!$cms) {
            return to_route('category')->withError('Category Not Found..!!');
        }
        return view('categories.edit', compact('cms', 'categories'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $cms = Category::find($id);
        if (!$cms) {
            return to_route('category')->withError('Category Not Found..!!');
        }

        $data = $request->validate([
            'name'         => ['required'],
            'slug'   => ['required'],
            // 'meta_keywords'   => ['required'],
            // 'meta_descriptions'   => ['required'],
            'serial'   => ['required'],
            'status'        => ['required'],
            'image'         => ['image'],
            'parent_id' => ['nullable'],
        ]);

        if ($request->file('image')) {
            Helper::deleteFile($cms->image);
            $data['image'] = Helper::saveFile($request->file('image'), 'category');
        }

        $cms->update($data);
        return to_route('category')->withSuccess('Category Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Category(), $request->id);
    }
}
