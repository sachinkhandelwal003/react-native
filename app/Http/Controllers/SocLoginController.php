<?php

use Laravel\Socialite\Facades\Socialite; // ✅ this is correct
use App\Models\AppUser;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class SocLoginController extends Controller
{
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        $user = Socialite::driver('google')->user();
        return $this->loginOrCreateUser($user, 'google');
    }

    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }

    public function handleFacebookCallback()
    {
        $user = Socialite::driver('facebook')->user();
        return $this->loginOrCreateUser($user, 'facebook');
    }

    private function loginOrCreateUser($socialUser, $provider)
    {
        $user = AppUser::updateOrCreate(
            ['email' => $socialUser->getEmail()],
            [
                'first_name' => $socialUser->getName(),
                'image' => $socialUser->getAvatar(),
                'status' => 1
            ]
        );

        Auth::login($user);

        return redirect()->route('dashboard'); // Change to your route
    }
}
