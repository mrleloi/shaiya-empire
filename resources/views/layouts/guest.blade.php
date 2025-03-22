<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="{{ $settingGeneral->icon ? $settingGeneral->icon->url : '/assets/images/favicon.ico' }}" />
    <meta name="csrf" content="{{ csrf_token() }}" id="csrf">
    <meta name="title" content="{{ $settingGeneral->title ? $settingGeneral->title : '' }}">
    <meta name="Description" content="{{ $settingGeneral->meta_des ? $settingGeneral->meta_des : '' }}">
    <meta name="Keywords" content="{{ $settingGeneral->meta_keyword ? $settingGeneral->meta_keyword : '' }}">
    <meta name="distribution" content="all">
    <meta name="robots" content="all">
    <meta name="revisit" content="3 days">
    <link href="css/css.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/fonts.css">
    <link rel="stylesheet" type="text/css" href="js/bootstrap-3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/loginbox.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/shop.css">
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.jqpagination.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/jquery.easing.compatibility.js"></script>
    <link rel="stylesheet" href="js/lightview-3.4.0/css/lightview/lightview.css" />
    <script type="text/javascript" src="js/lightview-3.4.0/js/lightview/lightview.js"></script>
    <script type="text/javascript" src="js/jquery.countdown-2.2.0/jquery.countdown.js"></script>

    <link rel="stylesheet" href="js/bootstrap-progressbar/css/bootstrap-progressbar-3.1.1.min.css" />
    <script type="text/javascript" src="js/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/fixes.css" />

    <script type="text/javascript" src="js/scrollintoview.js"></script>

    <script type="text/javascript" src="js/custom.js"></script>



    <script type="text/javascript" src="js/moment/moment.min.js"></script>
    <script type="text/javascript" src="js/moment/moment-timezone-with-data.min.js"></script>

    <link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.min.css">
    <script src="js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="js/datatables/datatables.min.css" />
    <script type="text/javascript" src="js/datatables/datatables.min.js"></script>


    <link rel="stylesheet" href="js/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="js/owl-carousel/assets/owl.theme.default.min.css">
    <script src="js/owl-carousel/owl.carousel.min.js"></script>

    <script type="text/javascript" language="javascript">
        var $TIMEZONE = 'Asia/Ho_Chi_Minh';

        $(document).ready(function() {
            $('a[title]').tooltip();
        });
    </script>
    {{--<script type="text/javascript">
        if (location.protocol !== 'https:') {
            location.replace(`https:${location.href.substring(location.protocol.length)}`);
        }
    </script>--}}
    <script src="js/ckeditor51/build/ckeditor.js"></script>
    <script src="js/ckeditor51/build/translations/en-gb.js"></script>

    <link type="text/css" rel="stylesheet" media="screen" charset="utf-8" href="js/snow/mysnow.css" />
    <script type="text/javascript" src="js/snow/mysnow.js"></script>
    <script src="js/snow/snow.js"></script>


    <style>BODY, HTML { background: #0c0706 url('{{ $settingGeneral->background->getUrl() ? $settingGeneral->background->getUrl() : 'images/header_halloween.jpg' }}') no-repeat top center; }</style>
    <title>{{ $settingGeneral->title ? $settingGeneral->title : 'Shaiya Game' }} | @yield('title')</title>
    <!-- Scripts -->
{{--    @vite(['resources/css/app.css', 'resources/js/app.js'])--}}
    @yield('styles')
</head>
<body  onload="init();">
{{--@include('partials.header')--}}
<div id="snow" style="position: fixed; left: 0px; top: 0px; right: 0px; bottom: 0px; pointer-events: none; z-index: 9999999; opacity: 1;"><canvas width="1659" height="571"></canvas></div>


<section id="header"></section>
<div id="image_header" align="center">
    <div class="slider" id="warcry-slider" align="center"></div>
</div>

<div class="main_a_holder" align="center">
    <div class="main_b_holder" align="center">
        <div class="membership-holder" id="view">
            <div class="membership-bar">

                @guest
                <div class="member-side-left">
                    <ul class="not-logged-menu">
                        <li class="login-home"><a href="#" class="loginbox" data-toggle="modal" data-target="#loginbox">
                                <p></p><span></span>
                            </a></li>
                        <li class="register-home"><a class="register" href="#">
                                <p></p><span></span>
                            </a></li>
                    </ul>
                </div>

                @else
                <div class="logged_in_bar member-side-left">
                    <div class="logged_in_bar_bg">
                        <div class="logout-btn-cont">
                            <a data-toggle="tooltip" data-placement="top" title="Thoát" href="#" id="logout" class="logout"><span></span>
                                <p></p>
                            </a>
                        </div>
                        <div class="avatar"><span></span><a class="account" href="#"></a></div>
                        <div class="info">
                            <p><a class="username account" href="#">{{ Auth::user()->UserID }}</a></p>
                            <div class="coints">
                                <span class="balance"><strong>Đang có </strong>: <b><span id="coins">{{ Auth::user()->Point }}</span></b> Ecoin</span>
                            </div>
                        </div>
                        <ul class="acc-menu">
                            <li id="dropdown" class="dropdown">
                                <a href="#" id="acc-panel" class="dropdown-toggle" data-toggle="dropdown"><span></span>
                                    <p></p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="divider"></li>
{{--                                    <li><a href="#" class="userinfo"><span class="glyphicon glyphicon-play-circle"></span> Thông tin tài khoản</a></li>--}}
                                    <li><a href="#" class="password1"><span class="glyphicon glyphicon-play-circle"></span> Đổi mật khẩu cấp 1</a></li>
                                    <li><a href="#" class="password2"><span class="glyphicon glyphicon-play-circle"></span> Đổi mật khẩu cấp 2</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#" class="donate"><span class="glyphicon glyphicon-heart"></span> Nạp Ecoin</a></li>
{{--                                    <li><a href="#" class="giftcode"><span class="glyphicon glyphicon-heart"></span> Giftcode tân thủ</a></li>--}}

{{--                                    <li class="divider"></li>--}}
{{--                                    <li><a href="#" class="doiloai"><span class="glyphicon glyphicon-play-circle"></span> Đổi loại trang bị</a></li>--}}
{{--                                    <li><a href="#" class="nangcapaochoang"><span class="glyphicon glyphicon-play-circle"></span> Nâng cấp áo choàng</a></li>--}}
{{--                                    <li><a href="#" class="nangcaptrangbi"><span class="glyphicon glyphicon-play-circle"></span> Nâng cấp trang bị</a></li>--}}
{{--                                    <li><a href="#" class="nhiemvu"><span class="glyphicon glyphicon-play-circle"></span> Nhiệm vụ</a></li>--}}
{{--                                    <li class="divider"></li>--}}
{{--                                    <li><a href="#" class="resurrect"><span class="glyphicon glyphicon-plus"></span> Phục hồi nhân vật</a></li>--}}
{{--                                    <li><a href="#" class="kickoff"><span class="glyphicon glyphicon-plus"></span> Tài khoản bị treo</a></li>--}}
{{--                                    <li class="divider"></li>--}}
                                    <li class="divider"></li>
                                    <li><a href="#" class="logout"><span class="glyphicon glyphicon-log-out"></span> Thoát</a></li>
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li><a href="#" id="buy-coins" class="donate"><span></span>
                                    <p></p>
                                </a></li>
                            <li class="donate-effect">
                                <div></div>
                            </li>
                        </ul>
                    </div>
                </div>
                @endguest

                <div class="memeber-side-right">
                    <ul>
                        <li><a href="./" target="_self">Trang chủ</a></li>
                        <li><a href="#" class="download  active">Tải game</a></li>
                        <li><a href="#" class="ranking">Thống kê</a></li>
                        <li><a href="{{ $settingGeneral->url_facebook }}" target="_blank">CỘNG ĐỒNG</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="sec_b_holder" align="center">
            <div id="body" align="left">

                <div class="content_holder">
                    <div id="container" class="main_side">


                        <div id="data">
                            <div style="margin-bottom: 10px; display: inline-block; margin-right: 6px;"><a href="#"  class="register"><img src="images/joindiscord.jpg" border="0"></a></div>
                            <div style="margin-bottom: 10px; display: inline-block;"><a href="#" class="serverinfo"><img src="images/serverinfo.jpg" border="0"></a></div>

                            {{-- Phần Slider --}}
                            <div class="sliders-main box-shadow">
                                <div id="carousel-banners" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        @if($settingGeneral && $settingGeneral->slides && $settingGeneral->slides->count() > 0)
                                            @foreach($settingGeneral->slides as $index => $slide)
                                                <li data-target="#carousel-banners" data-slide-to="{{ $index }}" class="{{ $index == 0 ? 'active' : '' }}"></li>
                                            @endforeach
                                        @else
                                            <li data-target="#carousel-banners" data-slide-to="0" class="active"></li>
                                        @endif
                                    </ol>
                                    <div class="carousel-inner">
                                        @if($settingGeneral && $settingGeneral->slides && $settingGeneral->slides->count() > 0)
                                            @foreach($settingGeneral->slides as $index => $slide)
                                                <div class="item {{ $index == 0 ? 'active' : '' }}">
                                                    <a href="{{ $slide->custom_properties['link'] ?? '#' }}" {{ isset($slide->custom_properties['target']) ? 'target="' . $slide->custom_properties['target'] . '"' : '' }}>
                                                        <img src="{{ $slide->getUrl() }}" border="0" alt="{{ $slide->name }}">
                                                    </a>
                                                </div>
                                            @endforeach
                                        @else
                                            <div class="item active">
                                                <img src="/images/slides/slide-default.jpg" border="0" alt="Default Slide">
                                            </div>
                                        @endif
                                    </div>
                                    <a class="left carousel-control" href="#carousel-banners" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-banners" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div>

                            {{-- Phần Video Carousel --}}
                            <div class="owl-carousel owl-theme" style="margin-bottom: 10px;">
                                @if($settingGeneral && $settingGeneral->carousel_videos && is_array($settingGeneral->carousel_videos))
                                    @foreach($settingGeneral->getCarouselVideosWithInfo() as $video)
                                        <div class="item">
                                            <a id="video" href="{{ $video['embed_url'] }}" data-lightview-options="width: 1820, height: 1080, viewport: 'scale'" data-lightview-type="iframe" class="lightview" data-toggle="lightbox" data-lightview-group="youtube">
                                                <div class="image-thumb-preview" style="background-image:url('{{ $video['thumbnail'] }}'); background-position: center center; background-repeat: no-repeat; background-size:98%; height: 120px; width: 213px;">
                                                    <div style="position: absolute; width: 100%; display: inline-block; bottom: 4px; padding: 0 7px; background-color: rgba(0,0,0,0.8);font-size: 11px;overflow: hidden;height: 25px;line-height: 25px;">{{ $video['title'] }}</div>
                                                </div>
                                                <div class="play-button-small"></div>
                                            </a>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="item">
                                        @if($settingGeneral && $settingGeneral->video_url)
                                            <a id="video" href="{{ $settingGeneral->getVideoEmbedUrl() }}" data-lightview-options="width: 1820, height: 1080, viewport: 'scale'" data-lightview-type="iframe" class="lightview" data-toggle="lightbox" data-lightview-group="youtube">
                                                <div class="image-thumb-preview" style="background-image:url('{{ $settingGeneral->getVideoThumbnail() }}'); background-position: center center; background-repeat: no-repeat; background-size:98%; height: 120px; width: 213px;">
                                                    <div style="position: absolute; width: 100%; display: inline-block; bottom: 4px; padding: 0 7px; background-color: rgba(0,0,0,0.8);font-size: 11px;overflow: hidden;height: 25px;line-height: 25px;">Video mới nhất</div>
                                                </div>
                                                <div class="play-button-small"></div>
                                            </a>
                                        @endif
                                    </div>
                                @endif
                            </div>

                            <script type="text/javascript">
                                $('.owl-carousel').owlCarousel({
                                    loop: false,
                                    margin: 5,
                                    nav: false,
                                    dots: false,
                                    autoWidth: true,
                                })
                            </script>
                            <style type="text/css">
                                .news-html {
                                    font-size: 14px !important;
                                }
                                .news-icon-edit {
                                    position: absolute;
                                    right: 8px;
                                    top: 8px;
                                    font-size: 14px;
                                }
                                .sub_container .news-head {
                                <!-- border-left: inset 5px #5b4542 !important;
                                padding-left: 10px;
                                }
                            </style>

                            <div class="main_container box-shadow">
                                <div class="header">
                                    <div class="header_left">TIN TỨC</div>
                                    <div class="header_right">

                                        <!--
                                        <ul class="pagination">
                                          <li><a href="#" class="first" data-toggle="tooltip" data-placement="top" title="First" data-action="first"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
                                          <li><a href="#" class="previous" data-toggle="tooltip" data-placement="top" title="Prev" data-action="previous"><span class="glyphicon glyphicon-step-backward"></span></a></li>
                                          <li><input type="text" readonly="readonly" data-max-page="40" /></li>
                                          <li><a href="#" class="next" data-toggle="tooltip" data-placement="top" title="Next" data-action="next"><span class="glyphicon glyphicon-step-forward"></span></a></li>
                                          <li><a href="#" class="last" data-toggle="tooltip" data-placement="top" title="Last" data-action="last"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
                                        </ul>
                                        -->
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="global_container">
                                    <div id="news" class="sub_container">
                                        <div id="notice_new"></div>
                                        <ul id="news_page">

                                            @foreach ($articles as $key => $article)

                                            <li id="n{{ $key }}d" class="news-row">
                                                <div class="news-head">
                                                    <a href="href="{{ route('post', ['id' => $article['id'] ]) }}" title="{{ $article['title'] }}"><h5>{{ $article['title'] }}</h5></a>

                                                    <div class="date"> Ngày đăng: {{ \Carbon\Carbon::parse($article['publish_at'])->format('d/m/Y') }}</div>

                                                </div>


                                            </li>

                                            @endforeach

                                        </ul>

                                    </div>
                                </div>
                            </div>

                            <div class="main_container box-shadow">
                                <div class="header">
                                    <div class="header_left">SỰ KIỆN</div>
                                    <div class="header_right">

                                        <!--
                                        <ul class="pagination">
                                          <li><a href="#" class="first" data-toggle="tooltip" data-placement="top" title="First" data-action="first"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
                                          <li><a href="#" class="previous" data-toggle="tooltip" data-placement="top" title="Prev" data-action="previous"><span class="glyphicon glyphicon-step-backward"></span></a></li>
                                          <li><input type="text" readonly="readonly" data-max-page="40" /></li>
                                          <li><a href="#" class="next" data-toggle="tooltip" data-placement="top" title="Next" data-action="next"><span class="glyphicon glyphicon-step-forward"></span></a></li>
                                          <li><a href="#" class="last" data-toggle="tooltip" data-placement="top" title="Last" data-action="last"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
                                        </ul>
                                        -->
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="global_container">
                                    <div id="news" class="sub_container">
                                        <div id="notice_new"></div>
                                        <ul id="news_page">


                                            @foreach ($events as $key => $event)

                                                <li id="n{{ $key }}d" class="news-row">
                                                    <div class="news-head">
                                                        <a href="href="{{ route('post', ['id' => $event['id'] ]) }}" title="{{ $event['title'] }}"><h5>{{ $event['title'] }}</h5></a>

                                                        <div class="date"> Ngày đăng: {{ \Carbon\Carbon::parse($event['publish_at'])->format('d/m/Y') }}</div>

                                                    </div>


                                                </li>

                                            @endforeach


                                        </ul>

                                    </div>
                                </div>
                            </div>

                            <script type="text/javascript">
                                $(document).ready(function() {
                                    $('#news ul#news_page:not(:first)').hide();
                                    $('.pagination').jqPagination({
                                        page_string: '{current_page}/{max_page}',
                                        max_page: $('#news ul#news_page').length,
                                        paged: function(page) {
                                            $('#news ul#news_page').fadeOut(100);
                                            $($('#news ul#news_page')[page - 1]).fadeIn(500);
                                        }
                                    });
                                });
                            </script>

                        </div>

                        <section id="media">
                            <div class="home_media home_container box-shadow">
                                <div class="new_trailer">
                                    <div class="sub_header">
                                        <h1>Video mới nhất</h1>
                                        <a href="#" class="videos">Xem thêm</a>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="new_video_thumb">
                                        @if($settingGeneral && $settingGeneral->video_url)
                                            <a id="video" href="{{ $settingGeneral->getVideoEmbedUrl() }}" data-lightview-title="" data-lightview-caption="" data-lightview-options="width: 1820, height: 1080, viewport: 'scale'" data-lightview-type="iframe" class="lightview" data-toggle="lightbox" data-lightview-group="youtube" title="">
                                                <div class="image-thumb-preview" style="background-image:url('{{ $settingGeneral->getVideoThumbnail() }}'); background-position: center center; background-repeat: no-repeat; background-size:98%;"></div>
                                                <div class="play-button-small"></div>
                                            </a>
                                        @endif
                                    </div>
                                    <div class="sub_header sreenshots">
                                        <h1>Ảnh mới nhất</h1>
                                        <a href="#" class="screenshots">Xem thêm</a>
                                        <div class="clear"></div>
                                    </div>
                                    <ul class="screanshots home_scr">
                                        @if($settingGeneral && $settingGeneral->screenshots && $settingGeneral->screenshots->count() > 0)
                                            @php
                                                $visibleImages = $settingGeneral->screenshots->take(3);
                                            @endphp

                                            @foreach($visibleImages as $image)
                                                <li>
                                                    <a class="container_frame lightview" data-lightview-group="screenshots" rel="gallery[mygallery]" href="{{ $image->getUrl() }}">
                                                        <span class="cframe_inner" style="background-image:url({{ $image->getUrl() }}); background-repeat: no-repeat; background-size:100%;"></span>
                                                    </a>
                                                </li>
                                            @endforeach
                                        @endif
                                        <div class="clear"></div>
                                    </ul>
                                </div>
                            </div>
                            <div class="top_voters home_container box-shadow">
                                <div class="sub_header">
                                    <h1>Ảnh nổi bật</h1>
                                    @if($settingGeneral && $settingGeneral->screenshots && $settingGeneral->screenshots->count() > 6)
                                        <a href="#" class="screenshots" id="show-more-screenshots">Xem tất cả</a>
                                    @else
                                        <a href="#" class="screenshots">Xem tất cả</a>
                                    @endif
                                    <div class="clear"></div>
                                </div>
                                <div class="cont_container">
                                    <ul class="screenshots_grid">
                                        @if($settingGeneral && $settingGeneral->screenshots && $settingGeneral->screenshots->count() > 0)
                                            @foreach($settingGeneral->screenshots->take(6) as $index => $image)
                                                <div class="screenshot_item{{ $index > 5 ? ' hidden-screenshot' : '' }}">
                                                    <a class="lightview" data-lightview-group="screenshots" rel="gallery[mygallery]" href="{{ $image->getUrl() }}">
                                                        <img src="{{ $image->getUrl() }}" class="img-fluid" alt="Screenshot">
                                                    </a>
                                                </div>
                                            @endforeach

                                            <!-- Ảnh ẩn sẽ hiển thị khi click "Xem tất cả" -->
                                            @if($settingGeneral->screenshots->count() > 6)
                                                <div id="additional-screenshots" style="display: none; width: 100%;">
                                                    @foreach($settingGeneral->screenshots->slice(6) as $image)
                                                        <div class="screenshot_item">
                                                            <a class="lightview" data-lightview-group="screenshots" rel="gallery[mygallery]" href="{{ $image->getUrl() }}">
                                                                <img src="{{ $image->getUrl() }}" class="img-fluid" alt="Screenshot">
                                                            </a>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endif
                                        @endif
                                    </ul>
                                </div>
                            </div>

                            <script>
                                document.addEventListener('DOMContentLoaded', function() {
                                    const showMoreBtn = document.getElementById('show-more-screenshots');
                                    if (showMoreBtn) {
                                        showMoreBtn.addEventListener('click', function(e) {
                                            e.preventDefault();
                                            const additionalScreenshots = document.getElementById('additional-screenshots');
                                            if (additionalScreenshots) {
                                                if (additionalScreenshots.style.display === 'none') {
                                                    additionalScreenshots.style.display = 'flex';
                                                    showMoreBtn.textContent = 'Thu gọn';
                                                } else {
                                                    additionalScreenshots.style.display = 'none';
                                                    showMoreBtn.textContent = 'Xem tất cả';
                                                }
                                            }
                                        });
                                    }
                                });
                            </script>
                        </section>


                        <style>
                            .screenshots_grid {
                                display: flex;
                                flex-wrap: wrap;
                                margin: 0 -5px;
                            }

                            .screenshot_item {
                                flex: 0 0 50%; /* 2 cột */
                                padding: 5px;
                                box-sizing: border-box;
                                margin-bottom: 10px;
                            }

                            .screenshot_item img {
                                width: 100%;
                                height: auto;
                                object-fit: cover;
                                border: 2px solid rgba(0,0,0,0.3);
                                transition: all 0.3s ease;
                            }

                            .screenshot_item img:hover {
                                border-color: rgba(255,255,255,0.5);
                                transform: scale(1.02);
                            }

                            @media (max-width: 768px) {
                                .screenshot_item {
                                    flex: 0 0 100%; /* 1 cột khi màn hình nhỏ */
                                }
                            }
                        </style>
                    </div>

                    <div class="sidebar">

                        <div class="box dark">
                            <div class="box-content">
                                <div class="server-time">
                                    <span><b>Giờ máy chủ</b> :: </span>
                                    <span id="server-time-clock">00:00:00</span>
                                    <script type="text/javascript">
                                        function servertime() {
                                            var time = moment().tz('Asia/Ho_Chi_Minh').format('D, MMMM YYYY :: H:mm:ss');
                                            $('#server-time-clock').html(time);
                                        }
                                        setInterval(servertime, 1000);
                                    </script>
                                </div>
                            </div>
                        </div>

                        <div class="myButtons">
                            <a href="#" class="bosstime">
                                <p>Boss time</p><span>Hệ thống thời gian boss</span>
                            </a>

                            <a href="#" class="quydinh">
                                <p>Quy định</p><span>Hãy chắc chắn đọc các quy tắc của chúng tôi!</span>
                            </a>

                            <a href="#" class="huongdan tos">
                                <p>Hướng dẫn</p><span>Xem các hướng dẫn của chúng tôi!</span>
                            </a>

                        </div>

                        <?php
                        use App\Http\Controllers\DAO\RankDAO;
                        use Illuminate\Support\Facades\DB;
                        use Illuminate\Support\Facades\Cache;

// Function to get online stats with caching for performance
                        function getOnlineStats()
                        {
                            // Cache online statistics for 5 minutes to reduce database load
                            return Cache::remember('online_stats', 300, function () {
                                $stats = [
                                    'dark' => 0,
                                    'light' => 0,
                                    'total' => 0,
                                    'dark_percent' => 0,
                                    'light_percent' => 0
                                ];

                                // Query for AoL faction (Country = 1)
                                $sql_online_light = 'SELECT
            COUNT(*) OVER() AS TotalCount
            FROM PS_GameData.dbo.Chars c
            INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
            INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
            WHERE um.Status >= 0
            AND c.Del = 0
            AND um.Leave = 1
            AND umg.Country = 1;';

                                try {
                                    $results = DB::connection('sqlsrv_gamedata')->select($sql_online_light);
                                    $stats['light'] = !empty($results) ? $results[0]->TotalCount : 0;
                                } catch (\Exception $e) {
                                    $stats['light'] = 0;
                                }

                                // Query for UoF faction (Country = 0)
                                $sql_online_dark = 'SELECT
            COUNT(*) OVER() AS TotalCount
            FROM PS_GameData.dbo.Chars c
            INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
            INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
            WHERE um.Status >= 0
            AND c.Del = 0
            AND um.Leave = 1
            AND umg.Country = 0;';

                                try {
                                    $results = DB::connection('sqlsrv_gamedata')->select($sql_online_dark);
                                    $stats['dark'] = !empty($results) ? $results[0]->TotalCount : 0;
                                } catch (\Exception $e) {
                                    $stats['dark'] = 0;
                                }

                                // Calculate total and percentages
                                $stats['total'] = $stats['dark'] + $stats['light'];

                                if ($stats['total'] > 0) {
                                    $stats['dark_percent'] = (int)($stats['dark'] / $stats['total'] * 100);
                                    $stats['light_percent'] = 100 - $stats['dark_percent'];
                                } else {
                                    $stats['dark_percent'] = 50;
                                    $stats['light_percent'] = 50;
                                }

                                return $stats;
                            });
                        }

// Function to get top players for both factions
                        function getTopPlayers($limit = 5)
                        {
                            // Cache top players for 15 minutes
                            return Cache::remember('top_players', 900, function () use ($limit) {
                                $rank_DAO = new RankDAO();

                                // Get AoL top players
                                $aol_criteria = [
                                    'level' => 0,
                                    'class' => 0,
                                    'faction' => 1,
                                    'page' => 0,
                                    'pageSize' => $limit,
                                    'pageOrder' => 'K1',
                                    'pageDirection' => 'DESC'
                                ];

                                $aol_players = $rank_DAO->getCharacterRanks($aol_criteria);

                                // Get UoF top players
                                $uof_criteria = [
                                    'level' => 0,
                                    'class' => 0,
                                    'faction' => 2,
                                    'page' => 0,
                                    'pageSize' => $limit,
                                    'pageOrder' => 'K1',
                                    'pageDirection' => 'DESC'
                                ];

                                $uof_players = $rank_DAO->getCharacterRanks($uof_criteria);

                                return [
                                    'aol' => $aol_players,
                                    'uof' => $uof_players
                                ];
                            });
                        }

// Get the stats
                        $onlineStats = getOnlineStats();
                        $topPlayers = getTopPlayers(5);
                        ?>

                        <div class="box box-shadow">
                            <div class="box-header">
                                <h1>Thống Kê Online</h1>
                            </div>
                            <div class="box-content population" style="padding: 5px;">
                                <div>
                                    <div class="progress" style="width: {{ $onlineStats['light_percent'] }}%;">
                                        <div class="progress-bar progress-bar-aol" role="progressbar" style="width: 100%;"
                                             aria-valuenow="{{ $onlineStats['light_percent'] }}"
                                             aria-valuemin="0"
                                             aria-valuemax="{{ $onlineStats['light_percent'] }}">
                                            Ánh Sáng {{ $onlineStats['light_percent'] }}%
                                        </div>
                                    </div>
                                    <div class="progress" style="width: {{ $onlineStats['dark_percent'] }}%;">
                                        <div class="progress-bar progress-bar-uof" role="progressbar" style="width: 100%;"
                                             aria-valuenow="{{ $onlineStats['dark_percent'] }}"
                                             aria-valuemin="0"
                                             aria-valuemax="{{ $onlineStats['dark_percent'] }}">
                                            Phẫn Nộ {{ $onlineStats['dark_percent'] }}%
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>

                        <div class="box box-shadow">
                            <div class="box-header">
                                <h1>TOP PLAYER</h1>
                                <h2><a href="{{ route('rankings-pvp') }}" class="ranking">Xem chi tiết</a></h2>
                            </div>
                            <div class="box-content">
                                <div class="subtitle">Liên minh Ánh Sáng</div>
                                <ul class="top_ranking_list">
                                    @forelse($topPlayers['aol'] as $index => $player)
                                        <li>
                                            <p>{{ $index + 1 }}</p>
                                            <div>{{ \App\Helpers\Helper::decodeText($player->CharName) }}</div>
                                            <span>{{ $player->K1 }}</span>
                                        </li>
                                    @empty
                                        <li>
                                            <div>Không có dữ liệu</div>
                                        </li>
                                    @endforelse
                                </ul>

                                <div class="subtitle">Liên minh Phẫn Nộ</div>
                                <ul class="top_ranking_list">
                                    @forelse($topPlayers['uof'] as $index => $player)
                                        <li>
                                            <p>{{ $index + 1 }}</p>
                                            <div>{{ \App\Helpers\Helper::decodeText($player->CharName) }}</div>
                                            <span>{{ $player->K1 }}</span>
                                        </li>
                                    @empty
                                        <li>
                                            <div>Không có dữ liệu</div>
                                        </li>
                                    @endforelse
                                </ul>
                            </div>
                        </div>

                    </div>

                    <div class="clear"></div>
                </div>

                <div id="fb-root"></div>

            </div>
        </div>
    </div>
</div>

<div class="footer-holder">
    <div id="footer">
        <a href="#" class="back-to-top" onclick="$('#header').scrollintoview();">
            <p></p><span></span>
        </a>
        <div class="left-side">
            {{ $settingGeneral->title }}- Free MMORPG Games<br />
            CopyRight © {{ $settingGeneral->title }} - Rights Reserved.<br/>
            Email：shaiyaempire2025@gmail.com
        </div>
        <div class="right-side">
            <!--<a title="Join our Discord Channel" href="https://discord.gg/s5BBRJm" target="Discord" class="social-slide discord"><img src="images/dot.gif" border="0" /></a> -->
            <a title="Join us on Facebook" href="{{ $settingGeneral->url_facebook }}" target="_blank" class="social-slide facebook"><img src="images/dot.gif" border="0" /></a>
            <!--  <a title="Follow us on Twitter" href="#" target="_blank" class="social-slide twitter"><img src="images/dot.gif" border="0" /></a> -->
            <a title="Check out our Discord" href="{{ $settingGeneral->url_discord }}" target="_blank" class="social-slide discord"><img src="images/dot.gif" border="0" /></a>
        </div>
    </div>



    <div class="bot-foot-border"></div>
</div>


@guest
<div id="loginbox" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="login-box" align="left">
                    <form id="form_login" name="form_login" method="post">
                        <p>Tài khoản</p>
                        <input type="text" id="username" name="username" autocomplete="on"> <br>
                        <p>Mật khẩu cấp 2</p>
                        <input type="password" id="password" name="password" autocomplete="on"><br>
                        <input type="hidden" id="recaptcha_response" name="recaptcha_response">
                        <div class="login-box-row">
                            <input type="submit" value="Đăng Nhập">
                        </div>
                    </form>
                    <div class="login-box-options">
                        <!-- <p><a href="#" class="retrieve">Forgot your password ?</a></p>-->
                        <p><span>Chưa có tài khoản ? <a href="#" class="register">Đăng ký!</a></span></p>
                    </div>
                    <div id="login_response"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endguest
<script type="text/javascript">
    $('#form_login').submit(function() {
        loadUpForm('#login_response', '/pages/login.php', '#form_login');
        return false;
    });

    $(document).ready(function() {
        $('#loginbox').on('shown.bs.modal', function() {
            $('#username').focus();
        });
    });
</script>
<script type="text/javascript">
    @guest

    $('.register').click(function(e) {
        loadUp('#data', './pages/register.php');
        $('#view').scrollintoview();
        return false;
    });

    @else

    $('.logout').click(function(e) {
        loadUp('#data', './pages/logout.php');
        return false;
    });
    $('.password1').click(function(e) {
        loadUp('#data', './pages/password1.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.password2').click(function(e) {
        loadUp('#data', './pages/password2.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.account').click(function(e) {
        return false;
    });

    @endguest

    $('.download').click(function(e) {
        loadUp('#data', './pages/download.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.donate').click(function(e) {
        loadUp('#data', './pages/donate.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.ranking').click(function(e) {
        loadUp('#data', './rank/ranking.php');
        $('#view').scrollintoview();
        return false;
    });

    $('.items').click(function(e) {
        loadUp('#data', './pages/items.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.shop').click(function(e) {
        loadUp('#data', './pages/shop.php');
        loadUp('#shop-menu', './pages/shop_menu.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.view-ranking').click(function(e) {
        loadUp('#data', './pages/ranking.php');
        $('#view').scrollintoview();
        return false;
    });

    $('.bosstime').click(function(e) {
        loadUp('#data', './pages/bosstime.php');
        $('#view').scrollintoview();
        return false;
    });

    $('.quydinh').click(function(e) {
        loadUp('#data', './pages/quydinh.php');
        $('#view').scrollintoview();
        return false;
    });
    $('.serverinfo').click(function(e) {
        loadUp('#data', './pages/info.php');
        $('#view').scrollintoview();
        return false;
    });

    $('.huongdan').click(function(e) {
        loadUp('#data', './pages/huongdan.php');
        $('#view').scrollintoview();
        return false;
    });

</script>
<div id="overlay" name="overlay" class="fading-notification"></div>
<div class='loading-body'>
    <div class="spinner icon-spinner-2" aria-hidden="true"></div>
</div>

{{--<div class="main_b_holder" style="margin-top: -30px;">
    <div class="body_content" style="background-color: #211f1e;min-height: 1120px;">
        <div class="body_effects">
            <div class="body-border top-left-to-right"></div>
            <div class="body-border left-top-to-bottom"></div>
            <div class="body-border right-top-to-bottom"></div>
            <div class="body-border bottom-left-to-right"></div>
            <div class="mainside-bg border_box"></div>
            <div class="sidebar-bg border_box"></div>
        </div>
        <div class="main_content">
            <aside id="right" class="mainside">
                <div id="page-character" class="mainbox page page-character" style="
    padding-left: 10px;
    padding-right: 10px;">
                    <div id="content_ajax" style="">
                    </div>
                </div>
            </aside>
            <aside id="left" class="sidebar border_box" style="">
                @guest
                <section id="sidebox_info_login" class="sidebox" style="width: 300px;margin: 0 auto;margin-left: 10px;margin-top: 20px;">
                    <h4 class="border_box" style="margin-top: 10px;margin-bottom: 0px;padding: 0 15px; height: 40px; overflow: hidden; background-image: url('/images/block-front-right.jpg'); line-height: 40px; font-size: 14px; text-transform: uppercase;">
                        {{ __('Login') }}</h4>
                    <div class="border_box" style="background-image: url('/images/block-front-right.jpg'); background-repeat: repeat-y; background-position: -300px -40px;">
                        <form method="post" accept-charset="utf-8" action="{{ route('login') }}" >
                            @csrf
                            <center id="sidebox_login" style="padding-top: 10px;height: 210px;background-image: url(/images/block-front-right.jpg);
    background-position: 0 205px;
    background-repeat: no-repeat;">
                                <input class="usernameleft" type="text" id="login_username" name="userid" placeholder="{{ __('UserID') }}" value="{{ old('userid') }}" style="color: #979797;
    padding: 6px 8px;
    font-size: 12px;
    width: 80%;
    height: auto;
    margin: 5px;
    border-width: 2px;
    border-style: solid;
    border-color: #3e3e3e;
    border-radius: 0;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    background-color: #191919;
    font: 11px / 16px Arial, Helvetica, sans-serif;">
                                <x-input-error :messages="$errors->get('userid')" class="mt-2" />
                                <input class="passwordleft" type="password"  name="password" placeholder="{{ __('Password2') }}" id="login_password" style="color: #979797;
    padding: 6px 8px;
    font-size: 12px;
    width: 80%;
    height: auto;
    margin: 5px;
    border-width: 2px;
    border-style: solid;
    border-color: #3e3e3e;
    border-radius: 0;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    background-color: #191919;
    font: 11px / 16px Arial, Helvetica, sans-serif;">
                                <x-input-error :messages="$errors->get('password')" class="mt-2" />
                                <input type="submit" name="login_submit" value="Đăng Nhập!">
                                <section id="forgot"><a href="{{ route('password.request') }}">Quên mật khẩu?</a></section>
                                <section id="register"><a href="{{ route('register') }}">Đăng ký tài khoản</a></section>
                            </center>
                        </form>
                    </div>

                    <?php
						// $sql_online_dark = 'SELECT
						//         COUNT(*) OVER() AS TotalCount
						//         FROM PS_GameData.dbo.Chars c
						//         INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
						//         INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
						//         WHERE um.Status >= 0
						//         AND c.Del = 0
						//         AND um.Leave = 1
						//         AND umg.Country = 0;';
						// $results = DB::connection('sqlsrv_gamedata')->select($sql_online_dark);
						$results = [];
						$numOnDark = 0;
						if ($results && !empty($results)) $numOnDark = $results[0]->TotalCount;
						// $sql_online_light = 'SELECT
						//     COUNT(*) OVER() AS TotalCount
						//     FROM PS_GameData.dbo.Chars c
						//     INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
						//     INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
						//     WHERE um.Status >= 0
						//     AND c.Del = 0
						//     AND um.Leave = 1
						//     AND umg.Country = 1;';
						// $results = DB::connection('sqlsrv_gamedata')->select($sql_online_light);
						$results = [];
						$numOnLight = 0;
						if ($results && !empty($results)) $numOnLight = $results[0]->TotalCount;
						$numOnTotal = $numOnDark + $numOnLight;
					?>
					<section id="faction-bar" class="sidebox" style="
			background-image: url('/images/faction-bar.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			background-position: 0px -20px;
			position: relative;
			margin: 15px 0 15px 0px;">
						<div class="faction-bar-body border_box">
							<div id="realm_1" class="realm_1 realm_holder wotlk online lastrow">
								<h4 class="faction-bar-title border_box" style="
			width: 100%;
			height: auto;
			color: #ffeee4;
			text-shadow: 1px 1px 2px black, 0 0 1em #ff5e00;
			padding: 15px 0;
			margin: 0px;
			font-size: 14px;
			text-align: center;
			font-family: 'Lora';
			letter-spacing: .5px;
			text-transform: uppercase;
			background-color: transparent;
			background-repeat: no-repeat;
			background-position: bottom center;">Ánh Sáng - Phẫn Nộ</h4>
								<div class="realm_row row-2 border_box">
									<div class="r_bar border_box">
										<div class="r_bar-inner">
											<div class="r_bar-fill bar-h " data-tip="AoL" style="min-width: 50px; width: 55%; text-align: left;"><span>{{ $numOnTotal == 0 ? 0 : (100 - (int) ($numOnDark/$numOnTotal*100)) }} %</span></div>
											<div class="r_bar-fill bar-a index" data-tip="UoF" style="min-width: 50px; width: 44%; text-align: right;"><span>{{ $numOnTotal == 0 ? 0 : (int) ($numOnDark/$numOnTotal*100) }} %</span></div>
										</div>
									</div>
								</div>

			--}}{{--                            <br><center> <p>Người chơi mới tham gia <span style="color:orange; font-weight: bold;" ;="">Liên Minh Phẫn Nộ</span>  </p> </center>--}}{{--
								<!--</br><center> <p>Người chơi mới tham gia <span style="color:red">Liên Minh Ánh Sáng</span>  </p> </center>
								</br><center> <p>Người chơi mới tham gia <span style="color:red">Liên Minh Phẫn Nộ</span>  </p> </center>	-->

							</div>
						</div>
					</section>
					--}}{{--<section id="sidebox_status" class="">
						<div class="sidebox_body border_box">
							<div id="realm_1" class="realm_1 realm_holder">
								<center><div class="onlinecount"><span>{{ $numOnTotal }}</span> {{ __('Players Online') }}</div></center>
								<div class="realm_row row-2 border_box">
									<div class="r_bar border_box">
										<div class="r_bar-inner">
											<div class="r_bar-fill bar-h index" style="width:54%"><span>{{ __('Dark') }} %{{ $numOnTotal == 0 ? 0 : (int) ($numOnDark/$numOnTotal*100) }} </span></div>
											<div class="r_bar-fill bar-a " style="width:46%"><span>%{{ $numOnTotal == 0 ? 0 : (100 - (int) ($numOnDark/$numOnTotal*100)) }} {{ __('Light') }}</span></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>--}}{{--
                    <div class="block-foot" style="clear:both;"></div>
                </section>

                @endguest

                @auth
                <section id="sidebox_info_login" class="sidebox" style="margin-left: 10px;margin-top: 10px;"><br>
					<div id="home_infor" class="sidebar border_box" style="
    float: none;
    padding: 0;">
						<section id="sidebox_status" class="sidebox" style="
				margin: 0 0 20px;
				width: 300px;
				position: relative;">
							<h4 class="sidebox_title border_box" style="
				padding: 0 15px;
				margin: 0;
				height: 40px;
				overflow: hidden;
				background-image: url('https://shaiyarenegade.com/images/block-front-right.jpg');
				background-position: 0 0;
				line-height: 40px;
				font-size: 14px;
				text-transform: uppercase;">
								<i>{{ __('Account') }}</i>
							</h4>
							<div class="sidebox_body border_box" style="
				padding: 16px 0;
				margin: 0;
				background-image: url('https://shaiyarenegade.com/images/block-front-right.jpg');
				background-repeat: repeat-y;
				background-position: -300px 0;">
								<div id="realm_1" class="realm_1 realm_holder wotlk online lastrow" style="margin: 0;
				width: 100%;
				height: auto;
				display: block;">
									<div class="realm_row row-1 border_box" style="
				height: auto;
				margin: 0 0 5px;
				padding: 0 16px;
				display: block;">
										<table class="nice_table">
											<tbody><tr>

												<td><div class="onlinecount"><span style="color:#aaa;"><i class="fas fa-user-circle fa-lg" aria-hidden="true"></i> <strong style="color:orange;"> | </strong> {{ Auth::user()->username }}</span></div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody><tr>
												<td width="175px;">{{ __('ACCOUNT STATUS') }}</td>
												<td><div class="onlinecount" style="color: #1bff00;">{{ __('NORMAL') }}</div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody><tr>
												<td width="175px;">{{ __('Point') }}</td>
												<td><div class="onlinecount"><span style="color:#aaa;">{{ (int)(Auth::user()->Point) }} {{ __('Point') }}--}}{{--<img style="width:28px;" src="../assets/images/ap_32x32.png">--}}{{--</span></div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody><tr>
												<td width="175px;">IP</td>
												<td><div class="onlinecount"><span style="color:#aaa;">{{ Auth::user()->UserIp }}</span></div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody>
											<tr>
												<td width="175px;">{{ __('CHANGE PASSWORD') }}</td>
												<td><div class="onlinecount"><a href="{{ route('change-password.edit') }}"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Nhấn để đổi mật khẩu</a></div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody>
											<tr>
												<td width="175px;">{{ __('CHANGE PASSWORD 2') }}</td>
												<td><div class="onlinecount"><a href="{{ route('change-password2.edit') }}"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Nhấn để đổi mật khẩu</a></div></td>
											</tr>
											</tbody></table>
										--}}{{--<table class="nice_table">
											<tbody><tr>
												<td width="175px;">PVP REWARDS</td>
												<td><div class="onlinecount"><a href="{{ route('rankings-pvp') }}"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Click</a></div></td>
											</tr>
											</tbody></table>--}}{{--
										--}}{{--<table class="nice_table">
											<tbody><tr>
												<td width="175px;">PROMO CODE</td>
												<td><div class="onlinecount"><a href="../page/promocode.php?cat=1"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Click</a></div></td>
											</tr>
											</tbody></table>
										<table class="nice_table">
											<tbody><tr>
												<td width="175px;">LUCKY BOX</td>
												<td><div class="onlinecount"><a href="../page/luckybox.php"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Click</a></div></td>
											</tr>
											</tbody></table>--}}{{--
										--}}{{--<table class="nice_table">
											<tbody><tr>
												<td width="175px;">SUPPORT REQUESTS</td>
												<td><div class="onlinecount"><a href="{{ route('support') }}"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Click</a></div></td>
											</tr>
											</tbody></table>--}}{{--
										--}}{{--<table class="nice_table">
											<tbody><tr>
												<td width="175px;">TIERED SPENDER</td>
												<td><div class="onlinecount"><a href="{{ route('tiered') }}"><i class="fas fa-mouse-pointer" aria-hidden="true"></i> Click</a></div></td>
											</tr>
											</tbody>
										</table>--}}{{--
										<br>
									</div>
								</div>
							</div>
							<div class="block-foot" style="margin: 0;
    background-image: url(https://shaiyarenegade.com/images/block-front-right.jpg);
    background-repeat: repeat-y;
    background-position: 0 6px;
    height: 10px;
    width: 300px;"></div>
						</section>
					</div>
					<?php
						$sql_online_dark = 'SELECT
						         COUNT(*) OVER() AS TotalCount
						         FROM PS_GameData.dbo.Chars c
						         INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
						         INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
						         WHERE um.Status >= 0
						         AND c.Del = 0
						         AND um.Leave = 1
						         AND umg.Country = 0;';
						$results = DB::connection('sqlsrv_gamedata')->select($sql_online_dark);
						$numOnDark = 0;
						if ($results && !empty($results)) $numOnDark = $results[0]->TotalCount;
						$sql_online_light = 'SELECT
						     COUNT(*) OVER() AS TotalCount
						     FROM PS_GameData.dbo.Chars c
						     INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
						     INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
						     WHERE um.Status >= 0
						     AND c.Del = 0
						     AND um.Leave = 1
						     AND umg.Country = 1;';
						$results = DB::connection('sqlsrv_gamedata')->select($sql_online_light);
						$numOnLight = 0;
						if ($results && !empty($results)) $numOnLight = $results[0]->TotalCount;
						$numOnTotal = $numOnDark + $numOnLight;
					?>
					<section id="faction-bar" class="sidebox" style="
			background-image: url('/images/faction-bar.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			background-position: 0px -20px;
			position: relative;
			margin: 15px 0 15px 0px;">
						<div class="faction-bar-body border_box">
							<div id="realm_1" class="realm_1 realm_holder wotlk online lastrow">
								<h4 class="faction-bar-title border_box" style="
			width: 100%;
			height: auto;
			color: #ffeee4;
			text-shadow: 1px 1px 2px black, 0 0 1em #ff5e00;
			padding: 15px 0;
			margin: 0px;
			font-size: 14px;
			text-align: center;
			font-family: 'Lora';
			letter-spacing: .5px;
			text-transform: uppercase;
			background-color: transparent;
			background-repeat: no-repeat;
			background-position: bottom center;">Ánh Sáng - Phẫn Nộ</h4>
								<div class="realm_row row-2 border_box">
									<div class="r_bar border_box">
										<div class="r_bar-inner">
											<div class="r_bar-fill bar-h " data-tip="AoL" style="min-width: 50px; width: 55%; text-align: left;"><span>{{ $numOnTotal == 0 ? 0 : (100 - (int) ($numOnDark/$numOnTotal*100)) }} %</span></div>
											<div class="r_bar-fill bar-a index" data-tip="UoF" style="min-width: 50px; width: 44%; text-align: right;"><span>{{ $numOnTotal == 0 ? 0 : (int) ($numOnDark/$numOnTotal*100) }} %</span></div>
										</div>
									</div>
								</div>

			--}}{{--                            <br><center> <p>Người chơi mới tham gia <span style="color:orange; font-weight: bold;" ;="">Liên Minh Phẫn Nộ</span>  </p> </center>--}}{{--
								<!--</br><center> <p>Người chơi mới tham gia <span style="color:red">Liên Minh Ánh Sáng</span>  </p> </center>
								</br><center> <p>Người chơi mới tham gia <span style="color:red">Liên Minh Phẫn Nộ</span>  </p> </center>	-->

							</div>
						</div>
					</section>
					--}}{{--<section id="sidebox_status" class="">
						<div class="sidebox_body border_box">
							<div id="realm_1" class="realm_1 realm_holder">
								<center><div class="onlinecount"><span>{{ $numOnTotal }}</span> {{ __('Players Online') }}</div></center>
								<div class="realm_row row-2 border_box">
									<div class="r_bar border_box">
										<div class="r_bar-inner">
											<div class="r_bar-fill bar-h index" style="width:54%"><span>{{ __('Dark') }} %{{ $numOnTotal == 0 ? 0 : (int) ($numOnDark/$numOnTotal*100) }} </span></div>
											<div class="r_bar-fill bar-a " style="width:46%"><span>%{{ $numOnTotal == 0 ? 0 : (100 - (int) ($numOnDark/$numOnTotal*100)) }} {{ __('Light') }}</span></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>--}}{{--
                    <div class="sidebtn sidebtn_2 border_box" style="background-image: none !important;
    margin-left: -5px;">
                        <a href="{{ route('donate') }}" class="border_box" title="">
                            <span>NẠP ECOIN</span>
                        </a>
                    </div>
                    <center>
                        <form method="POST" action="{{ route('logout') }}" id="logout-form">
                        @csrf <!-- CSRF Token is required for security -->
                            <a href="#" onclick="document.getElementById('logout-form').submit();">
                                <div class="nice_button">
                                    <i class="fas fa-sign-out-alt" aria-hidden="true"></i> {{ __('EXIT') }}
                                </div>
                            </a>
                        </form>
                    </center><br>
                </section>
                @endauth

				<section class="sidebox_topvoters topvoter sidebox" style="
    margin-left: 5px;
    width: 300px;
    height: auto;
    display: block;
    background-color: transparent;
    background-image: url(../../images/sidebox_foot.png);
    background-repeat: no-repeat;
    background-position: bottom center;
    position: relative;">
					<h4 class="sidebox_title border_box" style="
    padding: 0 15px;
    margin: 0px 0 0 5px;
    height: 40px;
    overflow: hidden;
    background-image: url(https://shaiyarenegade.com/images/block-front-right.jpg);
    background-position: 0 0;
    line-height: 40px;
    font-size: 14px;
    text-transform: uppercase;">
						<i>TOP XẾP HẠNG</i>
					</h4>
					<div class="sidebox_body border_box" style="
    padding: 16px 0;
    margin: 0px 0 0 5px;
    background-image: url(https://shaiyarenegade.com/images/block-front-right.jpg);
    background-repeat: repeat-y;
    background-position: -300px 0;">
						<?php
						use App\Http\Controllers\DAO\RankDAO;
						$rank_DAO = new RankDAO();
						$level = 0;
						$faction = 0;
						$class = 0;
						$type = 0;
						$defaultPageSize = 10;
						$defaultpage = 0;
						$pagingData = array();
						$pagingData['page'] = $defaultpage;
						$pagingData['pageSize'] = $defaultPageSize;
						$listType1 = $rank_DAO->getCharacterRanks($pagingData);
						?>
						@foreach($listType1 as $item)
							<div class="topvoter_row " style="
    width: 90%;
    margin: auto;
    height: 34px;
    display: block;
    background-color: transparent;
    background-image: url(../images/misc/line-sep.png);
    background-repeat: no-repeat;
    background-position: bottom center;">
								<div class="topvoter_col col_name" style="
    width: auto;
    height: 100%;
    display: inline-block;
    line-height: 29px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .4);
    letter-spacing: .5px;">
									<a style="
    font-size: 10px;
    color: #888787;">{!! \App\Helpers\Helper::decodeText($item->CharName) !!}</a>
								</div>
								<div class="topvoter_col col_vote" style="
    float: right;
    color: #83817c;
    font-size: 10px;
    font-family: Arial, helvetica neue, Helvetica, sans-serif;
    width: auto;
    height: 100%;
    display: inline-block;
    line-height: 29px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .4);
    letter-spacing: .5px;">
									 <i id="boss-timer-2480" style="color:#888787;
    font-size: 10px;
    font-style: inherit;
    font-weight: 700;"><i style="color:green;
    font-size: 10px;
    font-style: inherit;
    font-weight: 700;">{{ $item->K1 }}</i> Kill</i>
								</div>
							</div>
						@endforeach
						</div>

					<div class="block-foot" style="margin: 0px 0 0 5px;
		background-image: url(https://shaiyarenegade.com/images/block-front-right.jpg);
		background-repeat: repeat-y;
		background-position: 0 6px;
		height: 10px;
		width: 300px;"></div>
				</section>

                <br>
--}}{{--                <section style="margin-left: 7px;">--}}{{--
                    --}}{{--<div class="sidebtn sidebtn_1 border_box">
                        <a href="{{ route('support') }}" class="border_box overflow_ellipsis" title="">
                            <span><i class="fas fa-info-circle" aria-hidden="true"></i> | SUPPORT</span>
                        </a>
                    </div>--}}{{--
                    --}}{{--<div class="sidebtn sidebtn_3 border_box">
                        <a href="{{ route('boss-record') }}" class="border_box overflow_ellipsis" title="">
                            <span><i class="fas fa-boss" aria-hidden="true"></i> | {{ $settingBossRecord->header }}</span>
                        </a>
                    </div>--}}{{--
                    --}}{{--<a href="{{ route('vote') }}">
                        <div id="coupon_box" class="coupon_box border_box ">
                            <div class="coupon_text"><span>{{ $settingVote->header }} | </span> {{ __('Support us and win prizes!') }}</div>
                        </div>
                    </a>--}}{{--
--}}{{--                </section>--}}{{--
            </aside>
            <!-- <aside id="left" class="sidebar border_box">
                <div class="title">Kết nối với chúng tôi</div>
            </aside> -->
        </div>
    </div>
    <div class="slider" style="width: 1085px; margin: -20px auto; background-color: #1b1918;">
        @yield('slider')
    </div>
</div>--}}

{{--@include('partials.footer')--}}

<!-- Scripts -->

{{--<script src="../assets/js/jquery.validate.js"></script>
<script src="../assets/js/jquery.bootstrap-growl.js"></script>
<script src="../assets/js/tooltip.js"></script>
<script src="../assets/js/bootstrap.js"></script>
<script src="../assets/js/flux.min.js"></script>
<script src="../assets/js/jquery.tinyscrollbar.min.js"></script>
<script src="../assets/js/footer_include.js"></script>
<script src="../assets/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/dataTables.bootstrap.min.js"></script>
<script src="../assets/js/selectbox.js"></script>
<script src="../assets/js/custom.js"></script>
<script src="../assets/js/ajaxRouter.js"></script>--}}
@yield('scripts')
</body>
</html>
