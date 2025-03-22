@extends('layouts.guest')

@section('title', 'Reset Password')

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>RESET PASSWORD</i></span><br><br>
        <center>
            <!-- Session Status -->
            <x-auth-session-status class="mb-4" :status="session('status')" />

            <div class="text-sm text-gray-600" style="padding-right: 20px;">
                {{ __('Enter email and new password.') }}
            </div><br/>
            <div style="width: 300px;">
                <form class="register-form" role="form" method="POST" action="{{ route('password.store') }}">
                    @csrf

                    <!-- Password Reset Token -->
                    <input type="hidden" name="token" value="{{ $request->route('token') }}">

                    <!-- Email Address -->
                    <input type="text" name="email" placeholder="Email" maxlength="40" required value="{{ old('email') }}"><br><br>
                    <x-input-error :messages="$errors->get('email')" class="mt-2" />

                    <!-- Password -->
                    <input type="password" name="password" placeholder="New Password" maxlength="40" required value="{{ old('password') }}"><br><br>
                    <x-input-error :messages="$errors->get('password')" class="mt-2" />

                    <!-- Confirm Password -->
                    <input type="password" name="password_confirmation" placeholder="New Password Confirmation" maxlength="40" required value="{{ old('password_confirmation') }}"><br><br>
                    <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />

                    <!-- Password 2 -->
                    <input type="password" name="password2" placeholder="New Password 2" maxlength="40" required value="{{ old('password2') }}"><br><br>
                    <x-input-error :messages="$errors->get('password2')" class="mt-2" />

                    <!-- Confirm Password 2 -->
                    <input type="password" name="password2_confirmation" placeholder="New Password 2 Confirmation" maxlength="40" required value="{{ old('password2_confirmation') }}"><br><br>
                    <x-input-error :messages="$errors->get('password2_confirmation')" class="mt-2" />

                    <div class="item-2">
                        {{--{!! NoCaptcha::renderJs() !!}
                        {!! NoCaptcha::display() !!}--}}
                    </div>

                    <button style="cursor: pointer;" class="nice_button" name="submit">
                        <i class="fas fa-exchange-alt" aria-hidden="true"></i> {{ __('Reset Password') }}
                    </button>
                </form>
            </div>
        </center>

    </div>
@endsection
