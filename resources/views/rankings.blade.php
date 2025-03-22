{{--
@extends('layouts.guest')

@section('title', $setting->title)

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>{{ $setting->header }}</i></span><br><br>

        <div class="filter" style="text-align: center; margin-bottom: 15px;">
            <form action="{{ route('rankings-pvp') }}" method="GET">
                <div style="display: inline-flex;">
                    <select name="lm" style="min-width: 200px;">
                        <option value="0">-- Lọc theo Liên Minh --</option>
                        <option value="1" {{ request('lm') == '1' ? 'selected' : '' }}>Liên Minh Ánh Sáng</option>
                        <option value="2" {{ request('lm') == '2' ? 'selected' : '' }}>Liên Minh Phẫn Nộ</option>
                    </select>
                    <select name="class" style="min-width: 200px;">
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
                </div>
                <div style="display: inline-flex;">
                    <input type="submit" value="Lọc" style="min-width: 70px;">
                </div>
            </form>
        </div>

        <table class="nice_table" style="margin-top: 10px;">
            <tbody><tr style="text-align:center;">
                <td scope="col">#</td>
                <td scope="col">{{ __('FACTION') }}</td>
                <td scope="col" style="text-align: left;">{{ __('CHARACTER') }}</td>
                <td scope="col">{{ __('CLASS') }}</td>
                <td scope="col">{{ __('LEVEL') }}</td>
                <td scope="col">{{ __('STATUS') }}</td>
                <td scope="col" style="text-align: left;">{{ __('GUILD') }}</td>
                <td scope="col">{{ __('KILL') }}</td>
--}}
{{--                <td scope="col">{{ __('OWN') }}</td>--}}{{--

--}}
{{--                <td scope="col">{{ __('RANK') }}</td>--}}{{--

            </tr>
            @foreach($listType1 as $item)
            <tr>
                <td style="color: #cccccc; "><center>{{ $item->RowIndex }}</center></td>
                <td><center><div class="{{ $item->Faction == 'AoL' ? 'faction_light' : 'faction_dark' }}"></div></center></td>
--}}
{{--                <td>{!! $item->CharName !!}</td>--}}{{--

                <td>{!! \App\Helpers\Helper::decodeText($item->CharName) !!}</td>
                <td><center><div class="class{{ \App\Helpers\Helper::convertGameClass($item->CharClassID) }}"></div></center></td>
                <td><center>{{ $item->Level }}</center></td>
                <td><center><div class="login{{ $item->Leave == 'Offline' ? 'off' : 'on' }}">{{ $item->Leave == 'Offline' ? 'Offline' : 'Online' }}</div></center></td>
                <td><center>{!! \App\Helpers\Helper::decodeText($item->GuildName) !!}</center></td>
                <td><center>{{ $item->K1 }}</center></td>
--}}
{{--                <td><center>{{ $item->K2 }}</center></td>--}}{{--

--}}
{{--                <td><center><div class="rank{{ $item->Rank + 1 }}"></div></center></td>--}}{{--

            </tr>
            @endforeach

            --}}
{{--<tr>
                <td style="color: #cccccc; "><center>20</center></td>
                <td><center><div class="faction_light"></div></center></td>
                <td>Leiram</td>
                <td><center><div class="class4"></div></center></td>
                <td><center>1</center></td>
                <td><center><div class="login_off"></div></center></td>
                <td><center></center></td>
                <td><center>10528</center></td>
                <td><center>377</center></td>
                <td><center><div class="rank6"></div></center></td>
            </tr>--}}{{--


            </tbody></table>
        <table style="margin:20px auto 20px auto;">
            <tbody>
            <tr>
            <tr>
                <td><a class="nice_button" href="?page=1"><i class="fas fa-angle-double-left" aria-hidden="true"></i></a></td>
                @php
                    $start = max($listType1->currentPage() - 2, 1);
                    $end = min($listType1->currentPage() + 2, $listType1->lastPage());

                    if ($start > 1) {
                        echo '<td>...</td>';
                    }

                    for ($i = $start; $i <= $end; $i++) {
                        echo '<td><a style="margin-left:5px;" class="nice_button '.($i == $listType1->currentPage() ? 'nice_active' : '').'" href="?page='.$i.'">'.$i.'</a></td>';
                    }

                    if ($end < $listType1->lastPage()) {
                        echo '<td>...</td>';
                    }
                @endphp
                <td><a style="margin-left:5px;" class="nice_button" href="?page={{ $listType1->lastPage() }}"><i class="fas fa-angle-double-right" aria-hidden="true"></i></a></td>
            </tr>
            </tbody>
        </table>
        <div class="clear"></div>
    </div>
@endsection
--}}


<div class="main_container box-shadow drops">

    <div class="header">
        <div class="header_left">Thống kê chiến tích</div>
        <div class="clear"></div>
    </div>


    <div id="ranking"></div>


    <div class="button-container">
        <form id="form_ranking_chientichchung" name="form_ranking_chientichchung" method="post">
            <input type="submit" value="Chiến tích chung">
        </form>
        <form id="form_ranking_tieudiettrongngay" name="form_ranking_tieudiettrongngay" method="post">
            <input type="submit" value="Tiêu diệt trong ngày">
        </form>
        <form id="form_ranking_chiencichngay" name="form_ranking_chiencichngay" method="post">
            <input type="submit" value="Chiến tích trong ngày">
        </form>
        {{--<form id="form_ranking_thachdauchung" name="form_ranking_thachdauchung" method="post">
            <input type="submit" value="Thách đấu chung">
        </form>--}}

        <form id="form_ranking_chientichtuan" name="form_ranking_chientichtuan" method="post">
            <input type="submit" value="Chiến tích tuần">
        </form>




    </div><br>
    <!--
	<div class="button-container">
    <form id="form_ranking_usebox" name="form_ranking_usebox" method="post">
        <input type="submit" value="Top sự kiện">
    </form>

	<form id="form_ranking_topnap" name="form_ranking_topnap" method="post">
        <input type="submit" value="Top nạp Ecoin">
    </form>
	</div>
	-->
    <br>
</div>

<div id="rank_view_top" title="" style="width: 100%;">
    <div id="ranking_top"></div>
</div>

<script type="text/javascript">
    $('#form_ranking_chientichchung').submit(function () {
        loadUpForm('#ranking', './rank/pvpall.php', '#form_ranking_chientichchung' );
        return false;
    });
    $('#form_ranking_tieudiettrongngay').submit(function () {
        loadUpForm('#ranking', './rank/onlykill.php', '#form_ranking_tieudiettrongngay' );
        return false;
    });
    $('#form_ranking_chiencichngay').submit(function () {
        loadUpForm('#ranking', './rank/pvpday.php', '#form_ranking_chiencichngay' );
        return false;
    });
    /*$('#form_ranking_thachdauchung').submit(function () {
        loadUpForm('#ranking', './rank/thachdau.php', '#form_ranking_thachdauchung' );
        return false;
    });*/
    $('#form_ranking_chientichtuan').submit(function () {
        loadUpForm('#ranking', './rank/pvpweek.php', '#form_ranking_chientichtuan' );
        return false;
    });
    /*
    $('#form_ranking_topnap').submit(function () {
      loadUpForm('#ranking', './rank/topnap.php', '#form_ranking_topnap' );
      return false;
    });

    $('#form_ranking_usebox').submit(function () {
      loadUpForm('#ranking', './rank/usebox2.php', '#form_ranking_usebox' );
      return false;
    });
*/
</script>

<script type="text/javascript">
    $("ul.nav-tabs a").click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
</script>


