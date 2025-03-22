@extends('layouts.guest')

@section('title', 'Login')

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>LOGIN</i></span><br><br>

        <section id="sidebox_info_login" class="sidebox" style="">
            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif
            <h3 class="sidebox_title border_box"><strong>Vui lòng đăng nhập để tiếp tục.</strong></h3><br>
        </section>

        {{--<section id="sidebox_info_login" class="sidebox" style="margin-left: 7px;"><br>
            <h1 class="sidebox_title border_box"><strong>Login</strong></h1><br>
            <form class="form-login" action="../action/login.php" method="POST">
                <div class="item">
                    <p class="login-in"> <input class="input-validation-error text-box single-line" id="login_input" data-val="true" type="text" name="ID" placeholder="UserID" maxlength="15" required=""></p><br>
                </div>
                <div class="item">
                    <p class="password-in">  <input class="input-validation-error text-box single-line password" data-val="true" id="password_input" type="password" name="Password" placeholder="Password" maxlength="12" required=""></p>
                </div><br>
                <div class="text-center">
                    <div style="transform:scale(0.75);-webkit-transform:scale(0.75);" class="g-recaptcha" data-theme="dark" data-sitekey="6Lej7qYpAAAAANsI5FewdAbM8MBsdPdcHSO0uNSI"><div style="width: 304px; height: 78px;"><div><iframe title="reCAPTCHA" width="304" height="78" role="presentation" name="a-vr7lrm5j6rjv" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lej7qYpAAAAANsI5FewdAbM8MBsdPdcHSO0uNSI&amp;co=aHR0cHM6Ly9zaGFpeWFnaG9zdHdpcmUuY29tOjQ0Mw..&amp;hl=vi&amp;v=V6_85qpc2Xf2sbe3xTnRte7m&amp;theme=dark&amp;size=normal&amp;cb=kwrzvqw53lox"></iframe></div><textarea id="g-recaptcha-response-1" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;"></iframe></div>
                </div>
                <center><button style="cursor: pointer;" class="nice_button" name="login"><span><i class="fas fa-sign-in-alt" aria-hidden="true"></i> LOG IN</span></button><br><br>
                    <a href="../page/register.php" class="link">Don't have an account? Create now!</a><br>
                    <a href="../page/resetpass.php" class="link">Forgotten password?</a></center>
            </form>
        </section>--}}
    </div>
@endsection
