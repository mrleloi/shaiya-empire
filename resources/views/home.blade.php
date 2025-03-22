@extends('layouts.guest')

@section('title', $setting->title)

@section('content')

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
                                    <a href="{{ route('post', ['id' => $article['id'] ]) }}" title="{{ $article['title'] }}"><h5>{{ $article['title'] }}</h5></a>

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
                                    <a href="{{ route('post', ['id' => $article['id'] ]) }}" title="{{ $article['title'] }}"><h5>{{ $article['title'] }}</h5></a>

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

@endsection
