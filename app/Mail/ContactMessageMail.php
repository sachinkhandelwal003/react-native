<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactMessageMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
     public function __construct(public array $data) {}

    public function build(): static
    {
         return $this->subject('New Contact Form Submission - ' . $this->data['name'])
            ->view('email.contact-message')
            ->with('data', $this->data);
    }

    
}
