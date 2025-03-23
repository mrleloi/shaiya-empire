@extends('layouts.guest')

@section('title', $setting->title)

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title ?? 'Trang chủ' }} | <i>{{ $setting->header }}</i></span>

        <div class="filter" style="text-align: center; margin-bottom: 15px;">
            <form id="filter-form" action="javascript:void(0);" method="GET">
                <div style="display: inline-flex; gap: 10px; margin-bottom: 10px;">
                    <select name="lm" id="lm" style="min-width: 200px;">
                        <option value="0">-- Lọc theo Liên Minh --</option>
                        <option value="1" {{ request('lm') == '1' ? 'selected' : '' }}>Liên Minh Ánh Sáng</option>
                        <option value="2" {{ request('lm') == '2' ? 'selected' : '' }}>Liên Minh Phẫn Nộ</option>
                    </select>
                    <select name="class" id="class" style="min-width: 200px;">
                        <option value="0">-- Tất cả --</option>
                        <option value="fighter" {{ request('class') == 'fighter' ? 'selected' : '' }}>Chiến binh</option>
                        <option value="defender" {{ request('class') == 'defender' ? 'selected' : '' }}>Vệ binh</option>
                        <option value="archer" {{ request('class') == 'archer' ? 'selected' : '' }}>Cung thủ</option>
                        <option value="ranger" {{ request('class') == 'ranger' ? 'selected' : '' }}>Sát thủ</option>
                        <option value="mage" {{ request('class') == 'mage' ? 'selected' : '' }}>Pháp sư</option>
                        <option value="priest" {{ request('class') == 'priest' ? 'selected' : '' }}>Tu sĩ</option>
                        <option value="warrior" {{ request('class') == 'warrior' ? 'selected' : '' }}>Đấu sĩ</option>
                        <option value="guardian" {{ request('class') == 'guardian' ? 'selected' : '' }}>Giáp sĩ</option>
                        <option value="assassin" {{ request('class') == 'assassin' ? 'selected' : '' }}>Thích khách</option>
                        <option value="hunter" {{ request('class') == 'hunter' ? 'selected' : '' }}>Thợ săn</option>
                        <option value="pagan" {{ request('class') == 'pagan' ? 'selected' : '' }}>Thầy pháp</option>
                        <option value="oracle" {{ request('class') == 'oracle' ? 'selected' : '' }}>Tiên tri</option>
                    </select>
                    <input type="submit" value="Lọc" style="min-width: 70px;">
                </div>
            </form>
        </div>

        <div id="ranking-content">
            @include('rankings-pvp-ajax')
        </div>

        <div class="clear"></div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            // Handle filter form submission
            $('#filter-form').submit(function(e) {
                e.preventDefault();
                loadRankingData(1);
            });

            // Handle pagination clicks
            $(document).on('click', '.pvp-paginate', function() {
                var page = $(this).data('page');
                loadRankingData(page);
            });

            function loadRankingData(page) {
                var lm = $('#lm').val();
                var character_class = $('#class').val();

                $('.loading-body').fadeIn();

                $.ajax({
                    url: '{{ route('rankings-pvp') }}',
                    type: 'GET',
                    data: {
                        lm: lm,
                        class: character_class,
                        page: page,
                        ajax: 1
                    },
                    success: function(data) {
                        $('.loading-body').fadeOut();
                        $('#ranking-content').html(data);
                    },
                    error: function() {
                        $('.loading-body').fadeOut();
                        alert('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    }
                });
            }
        });
    </script>
@endsection
