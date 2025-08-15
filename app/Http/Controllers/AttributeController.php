<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use App\Helper\Helper;
use Illuminate\View\View;
use Illuminate\Http\Request;
use \Yajra\Datatables\Datatables;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;

class AttributeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request): View|JsonResponse
    {
        if ($request->ajax()) {
            $data = Attribute::select('id', 'color', 'name', 'created_at');
            return Datatables::of($data)
                
                ->editColumn('color', function ($row) {
                    return '<div id="colorBox" style="width: 30px; height: 30px; display: inline-block; border: 1px solid #ccc; margin-left: 10px; vertical-align: middle; background-color: '. $row['color'] .'"></div>'. $row['color'];
					
					$row['created_at']->format('d M, Y');
                })
               ->editColumn('created_at', function ($row) {
                    return $row['created_at']->format('d M, Y');
                })
              
                ->addColumn('action', function ($row) {

                    $btn = '<button class="text-600 btn-reveal dropdown-toggle btn btn-link btn-sm" id="drop" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button><div class="dropdown-menu" aria-labelledby="drop">';
                    if (Helper::userCan(104, 'can_edit')) {
                        $btn .= '<a class="dropdown-item" href="' . route('attribute.edit', $row['id']) . '">Edit</a>';
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
                ->rawColumns(['action', 'color', 'name'])
                ->make(true);
        }
        return view('attributes.index');
    }

    public function add(): View
    {
        return view('attributes.add');
    }

    public function save(Request $request): RedirectResponse
    {
     
		$data = $request->validate([
            'color'  => ['required'],
            'name'   => ['required'],
        ]);
       
        Attribute::create($data);
        return to_route('attribute')->withSuccess('Attribute Added Successfully..!!');
    }

    public function edit($id): View|RedirectResponse
    {
        $attribute = Attribute::find($id);
        if (!$attribute) {
            return to_route('attribute')->withError('Attribute Not Found..!!');
        }
        return view('attributes.edit', compact('attribute'));
    }

    public function update(Request $request, $id): RedirectResponse
    {
        $attribute = Attribute::find($id);
        if (!$attribute) {
            return to_route('attribute')->withError('Attribute Not Found..!!');
        }

        $data = $request->validate([
            'color'         => ['required'],
            'name'   => ['required'],
        ]);

      

        $attribute->update($data);
        return to_route('attribute')->withSuccess('Attribute Updated Successfully..!!');
    }

    public function delete(Request $request): JsonResponse
    {
        return Helper::deleteRecord(new Attribute, $request->id);
    }
}
