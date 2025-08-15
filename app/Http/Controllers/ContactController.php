<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use App\Mail\ContactFormMail;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'message' => 'required|string',
        ]);

        $validated['status'] = 'new';

        Contact::create($validated);

        // Send Email
        Mail::to('poshhpalatecare@gmail.com')->send(new ContactFormMail($validated));

        return redirect()->back()->with('success', 'Thank you for contacting us!');
    }
}
