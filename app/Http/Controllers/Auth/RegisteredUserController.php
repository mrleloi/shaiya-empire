<?php

namespace App\Http\Controllers\Auth;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Models\GameUser;
use App\Models\GameUserDetail;
use App\Providers\RouteServiceProvider;
use GuzzleHttp\Client;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        /*$client = new Client([
          'verify' => storage_path('app/cacert.pem') // Chỉ đường dẫn tới tập tin cacert.pem
       ]);

        $response = $client->post('https://www.google.com/recaptcha/api/siteverify', [
            'form_params' => [
                'secret' => '6LcS3s0pAAAAAGHUemSdj6BuyJ1-32Kj5P5lxeQS',
                'response' => $request->input('register_recaptcha_response'),
                'remoteip' => $request->ip()
            ]
        ]);

        $body = json_decode((string) $response->getBody());

        if (!$body->success) {
            throw ValidationException::withMessages([
                'username' => trans('ReCaptcha Error'),
            ]);
        }*/

        try {
            $request->validate([
                'username' => ['required', 'string', 'max:20', 'unique:'.GameUser::class.',UserID'],
                'email' => ['required', 'string', 'lowercase', 'email', 'max:64', 'unique:'.GameUserDetail::class],
                'realname' => ['required', 'string', 'max:20'],
                'password1' => ['required', 'string', 'min:6', 'max:20'],
                'repassword1' => ['required', 'same:password1'],
                'password2' => ['required', 'string', 'min:6', 'max:20'],
                'repassword2' => ['required', 'same:password2']
            ]);

            DB::beginTransaction();

            try {
                $user = GameUser::create([
                    'UserID' => Helper::clearXSS($request->username),
                    'Pw' => Helper::clearXSS($request->password1),
                    'JoinDate' => now(),
                    'Admin' => 0,
                    'AdminLevel' => 0,
                    'UseQueue' => 0,
                    'Status' => 0,
                    'Leave' => 0,
                    'UserType' => 'U',
                    'UserIp' => $request->ip(),
                    'Point' => 0,
                ]);

                $userDetail = GameUserDetail::create([
                    'UserUID' => $user->UserUID,
                    'UserID' => $user->UserID,
                    'Email' => Helper::clearXSS($request->email),
                    'PwAnswer' => Helper::clearXSS($request->password2),
                    'PwQuestion' => Helper::clearXSS($request->realname),
                    'NewsLetter' => '',
                    'Sms' => '',
                    'AdultAuth' => '',
                    'EmailAuth' => '',
                ]);

                DB::commit();

                event(new Registered($user));

                Auth::login($user);

                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => true,
                        'redirect' => route('home'),
                        'message' => 'Đăng ký thành công!'
                    ]);
                }

                return redirect(route('home'));
            } catch (\Exception $e) {
                DB::rollBack();
                throw $e;
            }
        } catch (ValidationException $e) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $e->errors()
                ], 422);
            }

            throw $e;
        } catch (\Exception $e) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Đã xảy ra lỗi trong quá trình đăng ký. Vui lòng thử lại sau.',
                    'error' => $e->getMessage()
                ], 500);
            }

            throw $e;
        }
    }
}
