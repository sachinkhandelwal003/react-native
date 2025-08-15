<?php 

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Logistics;

class LogisticsController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'order_id' => 'required|integer',
            'awb_number' => 'required|string|max:100',
            'url' => 'required|url|max:255',
        ]);

        Logistics::create([
            'order_id' => $request->order_id,
            'awb_number' => $request->awb_number,
            'url' => $request->url,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Logistic data added successfully.'
        ]);
    }
}
