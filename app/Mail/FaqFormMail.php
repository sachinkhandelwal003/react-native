<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class FaqFormMail extends Mailable
{
    use Queueable, SerializesModels;

  public function __construct(public array $data) {}

    public function build(): static
    {
        return $this->subject('New FAQ Request')
                    ->view('email.faq-form');
    }
   
}
