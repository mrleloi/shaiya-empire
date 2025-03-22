<script type="text/javascript">
    $(document).ready(function() {
        var delay = 5000;
        $('.fading-notification').each(function() {
            $(this).delay(delay).fadeOut(500);
            delay = delay + 500;
        });
    });
</script>

<div class="main_container box-shadow">
    <div class="header">
        <div class="header_left">
            Đổi mật khẩu cấp 2
            <span class="title_overlay"></span>
        </div>
    </div>
</div>
<div id="password_change_result"></div>

<div class="global_container">
    <div class="sub_container">
        <div class="main_content">
            <div class="form-holder register">
                <form action="" method="post" name="password_change" id="password_change">
                    <label class="styled-row" for="old_password"><p>Mật khẩu cấp 2 cũ</p><input type="password" maxlength="32" value="" name="old_password" id="old_password" required></label>
                    <label class="styled-row" for="new_password"><p>Mật khẩu cấp 2  mới</p><input type="password" maxlength="64" value="" name="new_password" id="new_password" required></label>
                    <label class="styled-row" for="new_password_confirmation"><p>Lặp lại Mật khẩu cấp 2 mới</p><input type="password" maxlength="64" value="" name="new_password_confirmation" id="new_password_confirmation" required></label>
                    {{--<label class="styled-row" for="captcha"><p>Mã bảo mật</p><input type="text" maxlength="20" value="" name="Captcha" id="Captcha"  required autocomplete="off"><br /><br />
                        <img src="captcha/CaptchaSecurityImages.php" id="captcha" class="captcha_image" />
                        <img src="images/refresh.png" style="position: relative; left: 10px; top: 0px; cursor: pointer;" onclick="
                                                document.getElementById('captcha').src='captcha/CaptchaSecurityImages.php?'+Math.random();"/></label>--}}
                    <br>
                    <input type="submit" value="Thay đổi" name="submit">
                    <div class="clear"></div>
                </form>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#old_password").focus();
    $('#password_change').submit(function () {
        loadUpForm('#password_change_result', './pages/do-change-password2.php', '#password_change' );
        return false;
    });
</script>
