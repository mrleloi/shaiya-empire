

<div class="main_container box-shadow">
    <div class="header">
        <div class="header_left">
            Tạo tài khoản
            <span class="title_overlay"></span>
        </div>
    </div>
</div>

<div class="global_container">
    <div class="sub_container">
        <div class="main_content">
            <div class="form-holder register">
                <div style="padding: 10px; font-size: 13px;">
                    <p>Đảm bảo bạn không sử dụng cùng ID và Mật khẩu như trong các máy chủ khác.
                        Có rất nhiều trường hợp bị đánh cắp tài khoản do thông tin đăng nhập giống nhau.</p>
                </div>

                <form method="post" name="register_form" id="register_form">
                    <input type="hidden" id="register_recaptcha_response" name="register_recaptcha_response">
                    <label class="styled-row" for="realname"><p>Họ và Tên</p><input type="text" maxlength="20" value="" name="realname" id="realname" required autocomplete="off"></label>
                    <label class="styled-row" for="username"><p>Tên đăng nhập</p><input type="text" maxlength="20" value="" name="username" id="username" required autocomplete="off"></label>
                    <label class="styled-row" for="email"><p>Email</p><input type="text" maxlength="64" value="" name="email" id="email" required autocomplete="off"></label>

                    <label class="styled-row" for="password1"><p>Mật khẩu cấp 1</p><input type="password" maxlength="20" value="" name="password1" id="password1" required autocomplete="off"></label>
                    <label class="styled-row" for="repassword1"><p>Lặp lại mật khẩu cấp 1</p><input type="password" maxlength="20" value="" name="repassword1" id="repassword1" required autocomplete="off"></label>

                    <label class="styled-row" for="password2"><p>Mật khẩu cấp 2</p><input type="password" maxlength="20" value="" name="password2" id="password2" required autocomplete="off"></label>
                    <label class="styled-row" for="repassword2"><p>Lặp lại mật khẩu cấp 2</p><input type="password" maxlength="20" value="" name="repassword2" id="repassword2" required autocomplete="off"></label>

                    <input type="submit" value="Tạo tài khoản" name="submit">
                    <div class="clear"></div>
                </form>
            </div>
        </div>
    </div>
    <div id="register_result"></div>
</div>

<script type="text/javascript">
    $("#username").focus();

    $('#register_form').submit(function () {
        // Sử dụng hàm loadUpForm với URL đúng của Laravel
        loadUpForm('#register_result', '/pages/do_register.php', '#register_form');
        return false;
    });

    // Reset các thông báo lỗi khi người dùng nhập lại
    $('#register_form input').on('input', function() {
        $(this).removeClass('input-error');
        if ($(this).closest('label').find('.error-message').length) {
            $(this).closest('label').find('.error-message').remove();
        }
    });
</script>
