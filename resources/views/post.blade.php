@extends('layouts.guest')

@section('title', $setting->title)

@section('content')

    <div id="data">

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
            <!-- border-left: inset 5px #5b4542 !important; -->
                padding-left: 10px;
            }
        </style>

        <div class="main_container box-shadow">
            <div class="header">
                <div class="header_left">{{ $post['title'] }}</div>
                <div class="header_right">
                </div>
                <div class="clear"></div>
            </div>
            <div class="global_container">
                <div id="news" class="sub_container">
                    <div id="notice_new"></div>
                    <div class="post-page" style="padding: 10px 0px 20px 20px;">
                        <div class="publish_info">
                            <div class="publish_by">Bởi <span style="color: #fff; font-weight: 700;">Shaiya-Max</span> - {{ $post['publish_at'] }}</div>
                        </div>
                        <div style="margin-bottom: 20px;">
                            <img src="{{ $post->image->getUrl() }}">
                        </div>
                        <div class="news-text" style="padding-right: 20px;">
                            {!! html_entity_decode($post['content']) !!}
                        </div>
                    </div>
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

@endsection
