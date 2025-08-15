<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use App\Models\ProductVariant;
use App\Helper\Helper;
use App\Models\Category;
use App\Models\Gallery;
use App\Models\Product;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ProductsExport;
use App\Imports\ProductsImport;
use App\Models\Subcategory;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Product::select('id', 'name', 'photo', 'reguler_price', 'is_type', 'status', 'created_at');
            return Datatables::of($data)
                ->editColumn('photo', function ($row) {
                    $photoUrl = $row['photo'] ? asset('storage/' . $row['photo']) : asset('assets/img/no-image.png');
                    $btn = '<div class="img-group"><img class="" src="' . $photoUrl . '" alt="" style="width: 50px; height: 50px; object-fit: cover;"></div>';
                    return $btn;
                })
                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })
                ->editColumn('status', function ($row) {
                    if ($row['status'] == 1) {
                        return '<small class="badge fw-semi-bold rounded-pill status badge-light-success">Publish</small>';
                    } else {
                        return '<small class="badge fw-semi-bold rounded-pill status badge-light-danger">Unpublish</small>';
                    }
                })
                ->editColumn('is_type', function ($row) {
                    if ($row['is_type'] == 1) {
                        return '<small class="badge fw-semi-bold rounded-pill badge-light-primary">New Arrival</small>';
                    }
                    if ($row['is_type'] == 2) {
                        return '<small class="badge fw-semi-bold rounded-pill badge-light-warning">Best Seller</small>';
                    }
                    if ($row['is_type'] == 3) {
                        return '<small class="badge fw-semi-bold rounded-pill badge-light-info">On Sale</small>';
                    }
                })
                ->addColumn('action', function ($row) {
                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route(name: 'product.edit', parameters: $row['id']) . '">Edit</a>';
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
                ->rawColumns(['action', 'photo', 'is_type', 'status'])
                ->make(true);
        }
        return view('product.index');
    }

    public function export()
    {
        return Excel::download(new ProductsExport, 'products.xlsx');
    }

    public function import(Request $request)
    {
        $request->validate([
            'excel_file' => 'required|mimes:xlsx,xls',
        ]);

        try {
            Excel::import(new ProductsImport, $request->file('excel_file'));
            return redirect()->route('product')->with('success', 'Products imported successfully.');
        } catch (\Exception $e) {
            return redirect()->route('product')->with('error', 'Error importing products: ' . $e->getMessage());
        }
    }
    public function show($slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        return view('frontend.pages.product-detail', compact('product'));
    }

    public function getSubcategoriesByCategory(Request $request)
    {
        $subcategories = Subcategory::where('category_id', $request->category_id)
            ->active()
            ->get();
        return response()->json($subcategories);
    }

    public function add(): View
    {
        $categories = Category::active()->get();
        $subcategories = Subcategory::active()->get();
        //  $product = Product::findOrFail($id);

        $colors = DB::table('attributes')->select('name')->distinct()->pluck('name')->filter(fn($color) => !empty($name))->values();


        return view('product.add', compact('categories', 'subcategories', 'colors'));
    }







    public function save(Request $request): RedirectResponse
    {
        // dd($request->all());
        $validated = $request->validate([
            'name' => ['required'],
            'slug' => ['nullable'], // Make slug optional since we'll auto-generate
            'sale_price' => ['required'],
            'reguler_price' => ['nullable'],
            'stock' => ['required'],
            'sku' => ['required'],
            'tags' => ['nullable'],
            'details' => ['required'],
            'meta_keywords' => ['nullable'],
            'meta_description' => ['nullable'],
            'category_id' => ['required'],
            'subcategory_id' => ['nullable'],
            'photo' => ['nullable'], // Max 2MB
            'back_photo' => ['nullable'], // Max 2MB
            'galleries' => ['nullable'], // Max 10 images
            'galleries.*' => ['nullable'], // Each max 2MB
            'status' => ['required'],
            'is_type' => ['required'],
        ]);

        // Auto-generate slug if not provided
        if (empty($validated['slug'])) {
            $validated['slug'] = Product::generateUniqueSlug($validated['name']);
        } else {
            $validated['slug'] = Product::generateUniqueSlug($validated['slug']);
        }

        $featuredImage = $request->hasFile('photo')
            ? Helper::saveFile($request->file('photo'), 'products')
            : null;

        $backImage = $request->hasFile('back_photo')
            ? Helper::saveFile($request->file('back_photo'), 'back_photo')
            : null;

        $product = Product::create([
            'name' => $validated['name'] ?? null,
            'slug' => $validated['slug'] ?? null,
            'sale_price' => $validated['sale_price'] ?? null,
            'reguler_price' => $validated['reguler_price'] ?? null,
            'stock' => $validated['stock'] ?? null,
            'sku' => $validated['sku'] ?? null,
            'tags' => $validated['tags'] ?? null,
            'details' => $validated['details'] ?? null,
            'meta_keywords' => $validated['meta_keywords'] ?? null,
            'meta_description' => $validated['meta_description'] ?? null,
            'category_id' => $validated['category_id'] ?? null,
            'subcategory_id' => $validated['subcategory_id'] ?? null,
            'photo' => $featuredImage ?? null,
            'back_photo' => $backImage ?? null,
            'status' => $validated['status'] ?? null,
            'is_type' => $validated['is_type'] ?? null,
        ]);

        if ($request->hasFile('galleries')) {
            foreach ($request->file('galleries') as $galleryImage) {
                $galleryPath = Helper::saveFile($galleryImage, 'product-gallery');
                Gallery::create([
                    'product_id' => $product->id,
                    'photo' => $galleryPath,
                ]);
            }
        }
        // echo 'ccsccsccscsdssssssssssssssssss';die;

        if ($request->variants) {
            foreach ($request->variants as $variantData) {
                $variant = new ProductVariant();
                $variant->product_id = $product->id;
                $variant->color = $variantData['color'];
                $variant->size = $variantData['size'];
                $variant->stock = $variantData['stock'];
                $variant->price = $variantData['price'];

                if (isset($variantData['image']) && $variantData['image'] instanceof \Illuminate\Http\UploadedFile) {
                    $variant->image = Helper::saveFile($variantData['image'], 'variant-images');
                }

                $variant->save();
            }
        }

        // echo 'ccscs';die;


        return redirect()->route('product')->with('success', 'Product added successfully!');
    }

    public function edit($id)
    {
        $categories = Category::active()->get();
        $subcategories = Subcategory::active()->get();
        $product = Product::findOrFail($id);
        // $categories = Category::all();
        $galleries = Gallery::where('product_id', $id)->get();
        // $product = Product::find($id);
        if (!$product) {
            return to_route('product')->withError('Product Not Found..!!');
        }

        $variantData = ProductVariant::where('product_id', $id)->get();
        $variants = $variantData ?? '';
        $colors = DB::table('attributes')->select('name')->distinct()->pluck('name')->filter(fn($name) => !empty($name))->values();

        return view('product.edit', compact('product', 'categories', 'subcategories', 'galleries', 'variants', 'colors'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $product = Product::find($id);
        if (!$product) {
            return to_route('product')->withError('Product Not Found..!!');
        }

        $validated = $request->validate([
            'name' => ['required'],
            'slug' => ['nullable'], // Make slug optional since we'll auto-generate
            'sale_price' => ['required'],
            'reguler_price' => ['nullable'],
            'stock' => ['required'],
            'sku' => ['required'],
            'tags' => ['nullable'],
            'details' => ['required'],
            'meta_keywords' => ['nullable'],
            'meta_description' => ['nullable'],
            'category_id' => ['required'],
            'subcategory_id' => ['nullable'],
            'photo' => ['nullable', 'image', 'max:2048'], // Max 2MB
            'back_photo' => ['nullable', 'image', 'max:2048'], // Max 2MB
            'galleries' => ['nullable', 'array', 'max:10'], // Max 10 images
            'galleries.*' => ['nullable', 'image', 'max:2048'], // Each max 2MB
            'status' => ['required'],
            'is_type' => ['required'],
        ]);

        // Auto-generate slug if not provided or if name changed
        if (empty($validated['slug']) || $product->name !== $validated['name']) {
            $validated['slug'] = Product::generateUniqueSlug($validated['name'], $product->id);
        } else {
            $validated['slug'] = Product::generateUniqueSlug($validated['slug'], $product->id);
        }


        // Save photo
        if ($request->hasFile('photo')) {
            Helper::deleteFile($product->photo);
            $validated['photo'] = Helper::saveFile($request->file('photo'), 'products');
        }

        if ($request->hasFile('back_photo')) {
            Helper::deleteFile($product->back_photo);
            $validated['back_photo'] = Helper::saveFile($request->file('back_photo'), 'back_photo');
        }

        $product->update($validated);

        // Optional: Handle new gallery uploads (you may also want to delete old galleries first)
        if ($request->hasFile('galleries')) {
            foreach ($request->file('galleries') as $galleryImage) {
                $galleryPath = Helper::saveFile($galleryImage, 'product-gallery');
                Gallery::create([
                    'product_id' => $product->id,
                    'photo' => $galleryPath,
                ]);
            }
        }
        if ($request->variants) {
            foreach ($request->variants as $variantData) {
                // Check if variant_id exists (update)
                if (!empty($variantData['id'])) {
                    $variant = ProductVariant::find($variantData['id']);

                    // If not found, skip this one (optional: log warning)
                    if (!$variant) {
                        continue;
                    }
                } else {
                    // If no ID, create new instance (insert)
                    $variant = new ProductVariant();
                    $variant->product_id = $product->id; // Make sure to assign required foreign key
                }

                // Assign fields
                $variant->color = $variantData['color'];
                $variant->size = $variantData['size'];
                $variant->stock = $variantData['stock'];
                $variant->price = $variantData['price'];

                // Handle image upload if provided
                if (
                    isset($variantData['image']) &&
                    $variantData['image'] instanceof \Illuminate\Http\UploadedFile
                ) {
                    $variant->image = Helper::saveFile($variantData['image'], 'variant-images');
                } else if (isset($variantData['existing_image']) && !empty($variantData['existing_image'])) {
                    // Keep the existing image if no new image is uploaded
                    $variant->image = $variantData['existing_image'];
                }

                // Save to DB
                $variant->save();
            }
        }
        return redirect()->route('product')->withSuccess('Product Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Product, $request->id);
    }


    public function variantdestroy($id)
    {
        $variant = ProductVariant::find($id);

        if (!$variant) {
            return response()->json(['message' => 'Variant not found.'], 404);
        }

        $variant->delete();

        return response()->json(['message' => 'Variant deleted successfully.']);
    }

    /**
     * Generate unique slug for product
     */
    public function slug(Request $request): JsonResponse
    {
        $slug = '';
        if (!empty($request->title)) {
            $excludeId = $request->input('product_id', null);
            $slug = Product::generateUniqueSlug($request->title, $excludeId);
        }

        return response()->json([
            'slug' => $slug
        ]);
    }



}
