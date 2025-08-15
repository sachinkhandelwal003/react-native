<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Cms;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class BannerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Banner::whereNull('deleted_at');
            return Datatables::of($data)
                ->editColumn('image', function ($row) {
                    $btn = '<div class="img-group"><img class="" src="' . asset($row['image']) . '" alt=""></div>';
                    return $btn;
                })
                ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })
                ->editColumn('button_link', function ($row) {
                    if ($row->button_link) {
                        return '<a href="' . $row->button_link . '" target="_blank" class="btn btn-sm btn-primary">
                                    <i class="fa fa-link me-1"></i> Visit
                                </a>';
                    }
                    return '<span class="text-muted">N/A</span>';
                })

                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route('banners.edit', $row['id']) . '">Edit</a>';
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
                ->rawColumns(['action', 'image', 'button_link', 'status'])
                ->make(true);
        }
        return view('banners.index');
    }

    public function add(): View
    {
        return view('banners.add');
    }

    public function save(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'title' => ['required'],
            'subtitle' => ['required'],
            'short_description' => ['required'],
            'button_text' => ['required'],
            'button_link' => ['required'],
            'status' => ['required'],
            'image' => ['image', 'mimes:jpg,png,jpeg', 'max:5048']
        ]);

        $data = $validated;

        if ($request->hasFile('image')) {
            $data['image'] = Helper::saveFile($request->file('image'), 'banner');
        } else {
            $data['image'] = null; // or whatever default you want
        }

        Banner::create($data);
        return to_route('banners')->withSuccess('Banner Added Successfully..!!');
    }

    public function edit($id): View|RedirectResponse
    {
        $banner = Banner::find($id);
        if (!$banner) {
            return to_route('banners')->withError('Banner Not Found..!!');
        }
        return view('banners.edit', compact('banner'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $banner = Banner::find($id);
        if (!$banner) {
            return to_route('banner')->withError('Banner Not Found..!!');
        }

        $data = $request->validate([
            'title' => ['required', 'string', 'max:200'],
            // 'description'   => ['required', 'string', 'max:10000'],
            // 'status'        => ['required', 'integer'],
            // 'image'         => ['image', 'mimes:jpg,png,jpeg', 'max:5048']
            'subtitle' => ['required'],
            'short_description' => ['required'],
            'button_text' => ['required'],
            'button_link' => ['required'],
            'status' => ['required'],
            // 'image'         => ['required']
        ]);

        if ($request->file('image')) {
            Helper::deleteFile($banner->image);
            $data['image'] = Helper::saveFile($request->file('image'), 'banner');
        }

        $banner->update($data);
        return to_route('banners')->withSuccess('Banner Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Banner, $request->id);
    }
}
