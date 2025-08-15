<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactFormMail extends Mailable
{
  use Queueable, SerializesModels;

  public $contactData;

  public function __construct($contactData)
  {
    $this->contactData = $contactData;
  }

  public function build()
  {
    return $this->subject('New Contact Form Submission')
      ->replyTo($this->contactData['email']) // 👈 add this line
      ->view('email.contact');
  }

}
