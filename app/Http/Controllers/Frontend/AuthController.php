<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\AppUser;
use App\Http\Controllers\Controller;
use App\Services\CartService;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    // Show registration form
    public function register()
    {
        return view('frontend.pages.authentication.register');
    }

    // Handle registration submission
    public function registerStore(Request $request)
    {
        $validated = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'phone_number' => 'required|string|max:20',
            'email' => 'required|email|unique:app_users,email',
            'password' => 'required|confirmed|min:6',
            'agree_checkbox' => 'accepted',
        ]);

        AppUser::create([
            'first_name' => $validated['first_name'],
            'last_name' => $validated['last_name'],
            'phone_number' => $validated['phone_number'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
        ]);

		return redirect()->back()->with('success', 'Account registered successfully, please login.');

    }

    // Show login form
    public function login()
    {
        return view('frontend.pages.authentication.login');
    }

    // Handle login submission
	public function loginStore(Request $request)
	{
		$credentials = $request->validate([
			'email' => 'required|email',
			'password' => 'required|string',
		]);

		if (Auth::guard('appuser')->attempt($credentials)) {
			$request->session()->regenerate();
			
			// Sync guest cart to user account after successful login
			$cartService = app(CartService::class);
			$cartService->syncCartOnLogin();
			
			return redirect()->route('home'); // redirect to '/' route
		}

		return back()->withErrors([
			'email' => 'Invalid credentials.',
		])->onlyInput('email');
	}

    // Handle logout
    public function logout(Request $request)
    {
        // Auth::guard('appuser')->logout();
        Auth::guard('appuser')->logout(); // logout appuser guard
        Auth::logout(); // logout default guard
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('user.login')->with('success', 'Logged out successfully.');
    }
	
	
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

        // Auth::login($user);
        Auth::guard('appuser')->login($user);

        // Sync guest cart to user cart after login
        $this->cartService->syncGuestCartToUser();

        return redirect()->route('dashboard'); // Change to your route
    }
	
	
}
