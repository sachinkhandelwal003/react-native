<?php
namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Faq;

class FaqController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'help_you' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        Faq::create([
            'name' => $request->name,
            'help_you' => $request->help_you,
            'message' => $request->message,
        ]);

        return redirect()->back()->with('success', 'Your request has been submitted successfully!');
    }
}
