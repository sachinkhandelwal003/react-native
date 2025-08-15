<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\Cms;
use App\Models\BlogCategory;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class BlogController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Blog::with('category')
                ->select('id', 'title', 'slug', 'details','short_description', 'image', 'category_id', 'tags', 'meta_keywords', 'meta_descriptions', 'status', 'created_at');
            return DataTables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset('storage/' . $row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->editColumn('status', function ($row) {
                    return $row->status == 1
                        ? '<span class="badge rounded-pill bg-success">Active</span>'
                        : '<span class="badge rounded-pill bg-danger">Inactive</span>';
                })
                ->editColumn('created_at', function ($row) {
                    return $row->created_at->format('d M, Y');
                })
                ->addColumn('category', function ($row) {
                    return $row->category->name ?? '-';
                })
                ->addColumn('action', function ($row) {
                    $btn = '<div class="dropdown">
                    <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        Actions
                    </button>
                    <ul class="dropdown-menu">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<li><a class="dropdown-item" href="' . route('blog.edit', $row->id) . '">Edit</a></li>';
                    }
                   
                    $btn .= '</ul></div>';
                    return $btn;
                })
                ->rawColumns(['image', 'status', 'category', 'action'])
                ->make(true);
        }

        return view('blogs.index');
    }
    public function add(): View
    {
        $categories = BlogCategory::where('status', 1)->get();
        return view('blogs.add', compact('categories'));
    }

    public function save(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:200'],
            'slug' => ['required', 'string', 'max:255', 'unique:blogs,slug'],
            'details' => ['required', 'string', 'max:10000'],
            'category_id' => ['required', 'integer', 'exists:blog_categories,id'],
            'tags' => ['nullable', 'string', 'max:255'],
            'meta_keywords' => ['nullable', 'string', 'max:255'],
            'meta_descriptions' => ['nullable', 'string', 'max:255'],
            'short_description' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'integer'],
            'image' => ['nullable', 'image', 'mimes:jpg,png,jpeg', 'max:5048'],
        ]);

        $data = [...$validated];

        if ($request->file('image')) {
            $data['image'] = Helper::saveFile($request->file('image'), 'blog');
            
        } else {
            $data['image'] = 'blog/image.png';
        }

        Blog::create($data);

        return to_route('blog')->withSuccess('Blog Added Successfully..!!');
    }

    public function edit($id): View|RedirectResponse
    {
        $blog = Blog::find($id);
        if (!$blog) {
            return to_route('blog.index')->withError('Blog not found!');
        }

        $categories = BlogCategory::all();
        return view('blogs.edit', compact('blog', 'categories'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $blog = Blog::find($id);
        if (!$blog) {
            return to_route('blog.index')->withError('Blog not found!');
        }

        $data = $request->validate([
            'title' => ['required', 'string', 'max:200'],
            'slug' => ['required', 'string', 'max:255', 'unique:blogs,slug,' . $blog->id],
            'details' => ['required', 'string', 'max:10000'],
            'image' => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:5048'],
            'category_id' => ['required', 'integer'],
            'tags' => ['nullable', 'string'],
            'meta_keywords' => ['nullable', 'string'],
            'short_description' => ['nullable', 'string'],
            'status' => ['required', 'integer'],
        ]);

        if ($request->hasFile('image')) {
            Helper::deleteFile($blog->image);
            $data['image'] = Helper::saveFile($request->file('image'), 'blog');
        }

        $blog->update($data);
        return to_route('blog')->withSuccess('Blog updated successfully!');
    }

    public function delete($id): JsonResponse
    {
        return Helper::deleteRecord(new Blog, $id);
    }

}
