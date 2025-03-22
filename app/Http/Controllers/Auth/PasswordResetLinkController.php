<?php

namespace App\Http\Controllers\Auth;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Models\GameUserDetail;
use GuzzleHttp\Client;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class PasswordResetLinkController extends Controller
{
    /**
     * Display the password reset link request view.
     */
    public function create(): View
    {
        return view('auth.forgot-password');
    }

    /**
     * Handle an incoming password reset link request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        /*$client = new Client([
			'verify' => storage_path('app/cacert.pem') // Chỉ đường dẫn tới tập tin cacert.pem
		]);

        $response = $client->post('https://www.google.com/recaptcha/api/siteverify', [
            'form_params' => [
                'secret' => '6LcS3s0pAAAAAGHUemSdj6BuyJ1-32Kj5P5lxeQS',
                'response' => $request->input('g-recaptcha-response'),
                'remoteip' => $request->ip()
            ]
        ]);

        $body = json_decode((string) $response->getBody());

        if (!$body->success) {
            throw ValidationException::withMessages([
                'email' => trans('ReCaptcha Error'),
            ]);
        }*/

        $request->validate([
            'email' => ['required', 'email'],
        ]);

        $email = Helper::clearXSS($request->input('email'));
        if (!($user = GameUserDetail::query()->where('Email', '=', $email)->first())) {
            return back()->withInput($request->only('email'))
                ->withErrors(['email' => 'Email không tồn tại.']);
        }

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $status = Password::sendResetLink(
            $request->only('email')
        );

        return $status == Password::RESET_LINK_SENT
                    ? back()->with('status', __($status))
                    : back()->withInput($request->only('email'))
                            ->withErrors(['email' => __($status)]);
    }
}
