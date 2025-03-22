// function to calculate local time
// in a different city
// given the city's UTC offset
function calcTime(city, offset, date = null) {
  // create Date object for current location
  if (date) {
    var d = new Date(date);
  } else {
    var d = new Date();
  }
  // get UTC time in msec
  var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
  // using supplied offset
  var nd = new Date(utc + (3600000 * parseInt(offset)));
  // return time as a string
  return nd.toString();
}

//Server time Cloack
function ServerTimeCloack() {
  // var currentTime = new Date(calcTime($TIMEZONE, $TIMEZONEOFFSET));
  var currentTime = new Date(calcTime($TIMEZONE, 1));
  var h = currentTime.getHours();
  var m = currentTime.getMinutes();
  var s = currentTime.getSeconds();
  setTimeout(function() {
    ServerTimeCloack();
  }, 1000);
  if (h < 10) {
    h = "0" + h;
  }
  if (m < 10) {
    m = "0" + m;
  }
  if (s < 10) {
    s = "0" + s;
  }
  var myClock = document.getElementById('server-time-cloack');
  if (myClock) {
    myClock.textContent = h + ":" + m + ":" + s;
    myClock.innerText = h + ":" + m + ":" + s;
  }
}
function loadUp(where, what) {
    $('html, body').css({ 'overflow': 'hidden', 'height': '100%' });
    $('#loginbox').modal('hide');
    $('.loading-body').fadeIn();

    // Get CSRF token from meta tag
    var csrf = $('#csrf').attr('content');

    $.ajax({
        url: what,
        type: 'POST',
        headers: {
            'X-CSRF-TOKEN': csrf
        },
        success: function(data) {
            $('.loading-body').fadeOut();

            if (data.redirect) {
                // Hiển thị thông báo thành công trước khi chuyển hướng
                $(where).html('<div class="message message-success"><p><span class="glyphicon glyphicon-ok"></span>' +
                    (data.message || 'Thành công!') + '</p></div>');

                // Chuyển hướng sau 2 giây
                setTimeout(function() {
                    window.location.href = data.redirect;
                }, 2000);
                return;
            }

            $(where).hide();
            $(where).html(data);
            $(where).fadeIn(0);
        }
    });

    $('html, body').removeAttr('style');
}
function loadUpForm(where, what, formId) {
    // Reset styling trước khi submit
    $(formId + ' input').removeClass('input-error');
    $(formId + ' .error-message').remove();

    $('html, body').css({ 'overflow': 'hidden', 'height': '100%' });
    $('.loading-body').fadeIn();

    // Get CSRF token from meta tag
    var csrf = $('#csrf').attr('content');

    // Add CSRF token to form data
    var formData = $(formId).serialize();
    formData += '&_token=' + csrf;

    $.ajax({
        url: what,
        type: 'POST',
        data: formData,
        headers: {
            'X-CSRF-TOKEN': csrf,
            'Accept': 'application/json'
        },
        success: function(data) {
            $('.loading-body').fadeOut();

            // Handle json response
            if (data.success) {
                if (data.redirect) {
                    // Hiển thị thông báo thành công trước khi chuyển hướng
                    $(where).html('<div class="message message-success"><p><span class="glyphicon glyphicon-ok"></span>' +
                        (data.message || 'Thành công! Đang chuyển hướng, vui lòng đợi..') + '</p></div>');
                    // Chuyển hướng sau 2 giây
                    setTimeout(function () {
                        window.location.href = data.redirect;
                    }, 2000);
                    return;
                }
                else if (data.message) {
                    // Hiển thị thông báo thành công
                    $(where).html('<div class="message message-success"><p><span class="glyphicon glyphicon-ok"></span>' +
                        (data.message || 'Thành công!') + '</p></div>');
                }
            } else { // just response html
                $(where).html(data);
            }
            // $(where).fadeIn(0);
        },
        error: function(xhr) {
            $('.loading-body').fadeOut();

            // Xử lý lỗi validation
            if ((xhr.status === 422 || xhr.status === 400) && xhr.responseJSON) {
                var errorHtml = '';

                // Thêm script để hiệu ứng mờ dần
                errorHtml += '<script type="text/javascript">';
                errorHtml += '$(document).ready(function() {';
                errorHtml += '  var delay = 8000;'; // Thời gian dài hơn cho form đăng ký
                errorHtml += '  $(\'.fading-notification\').each(function() {';
                errorHtml += '    $(this).delay(delay).fadeOut(500);';
                errorHtml += '    delay = delay + 500;';
                errorHtml += '  });';
                errorHtml += '});';
                errorHtml += '</script>';

                if (xhr.responseJSON.errors) {
                    var errors = xhr.responseJSON.errors;

                    // Hiển thị lỗi chung
                    errorHtml += '<div class="message message-error fading-notification">';
                    errorHtml += '<p><span class="glyphicon glyphicon-remove"></span>Vui lòng kiểm tra lại thông tin đăng ký</p>';
                    errorHtml += '</div>';

                    // Hiển thị lỗi cho từng trường
                    $.each(errors, function(field, messages) {
                        // Đánh dấu input lỗi
                        $(formId + ' [name="' + field + '"]').addClass('input-error');

                        // Thêm thông báo lỗi bên dưới trường
                        if (Array.isArray(messages)) {
                            var fieldError = $('<div class="error-message">' + messages[0] + '</div>');
                            $(formId + ' [name="' + field + '"]').closest('label').append(fieldError);
                        } else {
                            var fieldError = $('<div class="error-message">' + messages + '</div>');
                            $(formId + ' [name="' + field + '"]').closest('label').append(fieldError);
                        }
                    });
                } else if (xhr.responseJSON.message) {
                    // Nếu chỉ có message chung
                    errorHtml += '<div class="message message-error fading-notification">';
                    errorHtml += '<p><span class="glyphicon glyphicon-remove"></span>' + xhr.responseJSON.message + '</p>';
                    errorHtml += '</div>';
                }

                $(where).html(errorHtml);
            } else {
                // Lỗi khác (500, 404, ...)
                var errorHtml = '<script type="text/javascript">';
                errorHtml += '$(document).ready(function() {';
                errorHtml += '  var delay = 5000;';
                errorHtml += '  $(\'.fading-notification\').each(function() {';
                errorHtml += '    $(this).delay(delay).fadeOut(500);';
                errorHtml += '  });';
                errorHtml += '});';
                errorHtml += '</script>';
                errorHtml += '<div class="message message-error fading-notification">';
                errorHtml += '<p><span class="glyphicon glyphicon-remove"></span>Có lỗi xảy ra trên máy chủ. Vui lòng thử lại sau.</p>';
                errorHtml += '</div>';

                $(where).html(errorHtml);
            }
        }
    });

    $('html, body').removeAttr('style');
}
