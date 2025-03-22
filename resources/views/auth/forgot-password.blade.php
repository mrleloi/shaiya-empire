@extends('layouts.guest')

@section('title', __('FORGOT PASSWORD'))

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>{{ __('FORGOT PASSWORD') }}</i></span><br><br>
        <center>
            <!-- Session Status -->
            <x-auth-session-status class="mb-4" :status="session('status')" />

            <div class="text-sm text-gray-600" style="padding-right: 20px;">
                {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
            </div><br/>
            <div style="width: 300px;">
                <form class="register-form" role="form" method="POST" action="{{ route('password.email') }}">
                    @csrf
                    <!-- User ID (Not usually required for password reset, so I'll comment it out. Adjust as necessary) -->
                    <!-- <input type="text" name="ID" value="" placeholder="Kullanıcı Adı" maxlength="15" required=""><br><br> -->

                    <!-- Email Address -->
                    <input type="text" name="email" placeholder="Email" maxlength="40" required value="{{ old('email') }}"><br><br>
                    <x-input-error :messages="$errors->get('email')" class="mt-2" />

                    <!-- New Password Fields (Remove these unless it's a reset form post-verification) -->
                    <!-- <input type="password" name="NewPassword" placeholder="Yeni Şifre" maxlength="12" required=""><br><br>
                    <input type="password" name="NewConfirmPassword" placeholder="Yeni Şifre Tekrar" maxlength="12" required=""><br><br> -->

                    {{--<div class="g-recaptcha" data-sitekey="6LcS3s0pAAAAAKP7NACt0jy4PGUAKP9cEDLKBu4b"></div>
                    <script src='https://www.google.com/recaptcha/api.js'></script>
                    <br>--}}

                    <button style="cursor: pointer;" class="nice_button" name="submit">
                        <i class="fas fa-exchange-alt" aria-hidden="true"></i> {{ __('Email Password Reset Link') }}
                    </button>
                </form>
            </div>
        </center>

    </div>
@endsection
