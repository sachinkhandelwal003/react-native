<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Newsletter;
use App\Mail\NewsletterSubscriptionMail;
use Illuminate\Support\Facades\Mail;


class NewsletterController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        Newsletter::create([
            'email' => $request->email,
        ]);
        Mail::to('poshhpalatecare@gmail.com')->send(
            new NewsletterSubscriptionMail($request->email)
        );

        return redirect()->back()->with('success', 'Thank you for subscribing!');
    }
}
