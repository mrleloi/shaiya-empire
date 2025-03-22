{{--
@extends('layouts.guest')

@section('title', $setting->title)

@section('body_class', 'theme_havoc')

@section('content')
    <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>{{ $setting->header }}</i></span><br><br>

        <form action="{{ route('rankings-guild') }}" method="GET">
        <div class="filter" style="text-align: center; margin-bottom: 15px;">
            <div style="display: inline-flex;">
                <select name="times" style="min-width: 200px;">
                    <option value="1" {{ request('times') == '1' ? 'selected' : '' }}>-- Xếp hạng Ngày --</option>
                    <option value="2" {{ request('times') == '2' ? 'selected' : '' }}>Xếp hạng Tuần</option>
                    <option value="3" {{ request('times') == '3' ? 'selected' : '' }}>Xếp hạng Tháng</option>
                </select>
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
        </div>
        <div class="dates" style="text-align: center; ">
            <div style="display: inline-flex; align-items: center; gap: 10px;">
                <div>
                    <label for="start_date">Ngày bắt đầu:</label>
                    <input type="date" name="start_date" id="start_date" value="{{ request('start_date') ? request('start_date') : \Illuminate\Support\Carbon::today()->toDateString() }}" required style="
    color-scheme: dark;
    filter: color: white !important;
    line-height: inherit;
    color: #979797;
    padding: 7px 7px 4px 10px;
    font-size: 12px;
    box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    -moz-box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    -webkit-box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    font-family: 'PT Sans Caption', sans-serif;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .4);
    border-width: 1px;
    border-style: solid;
    border-color: #3e3e3e;
    border-radius: 0;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    background-color: #191919;
    transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -o-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -ms-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -moz-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -webkit-transition: color .3s ease-in-out, border-color .3s ease-in-out;">
                </div>
                <div>
                    <label for="end_date">Ngày kết thúc:</label>
                    <input type="date" name="end_date" id="end_date" value="{{ request('end_date') ? request('end_date') : \Illuminate\Support\Carbon::today()->toDateString() }}" required style="
    color-scheme: dark;
    filter: color: white !important;
    line-height: inherit;
    color: #979797;
    padding: 7px 7px 4px 10px;
    font-size: 12px;
    box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    -moz-box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    -webkit-box-shadow: inset 0 0 0 2px #0f0f0f, 0 2px 0 0 #0a0a0a, 0 0 8px 0 #101010;
    font-family: 'PT Sans Caption', sans-serif;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .4);
    border-width: 1px;
    border-style: solid;
    border-color: #3e3e3e;
    border-radius: 0;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    background-color: #191919;
    transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -o-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -ms-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -moz-transition: color .3s ease-in-out, border-color .3s ease-in-out;
    -webkit-transition: color .3s ease-in-out, border-color .3s ease-in-out;">
                </div>
            </div>
        </div>
        </form>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const timesSelect = document.querySelector('select[name="times"]');
                const startDateInput = document.getElementById('start_date');
                const endDateInput = document.getElementById('end_date');

                function setDefaultDates() {
                    const today = new Date();
                    startDateInput.value = today.toISOString().split('T')[0];
                    endDateInput.value = today.toISOString().split('T')[0];
                }

                timesSelect.addEventListener('change', function() {
                    const today = new Date();
                    if (this.value === '2') { // Xếp hạng Tuần
                        const startOfWeek = new Date(today.setDate(today.getDate() - today.getDay() + (today.getDay() === 0 ? -6 : 1)));
                        const endOfWeek = new Date(startOfWeek.getTime());
                        endOfWeek.setDate(startOfWeek.getDate() + 6);

                        startDateInput.value = startOfWeek.toISOString().split('T')[0];
                        endDateInput.value = endOfWeek.toISOString().split('T')[0];
                    } else if (this.value === '3') { // Xếp hạng Tháng
                        const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
                        const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);

                        startDateInput.value = startOfMonth.toISOString().split('T')[0];
                        endDateInput.value = endOfMonth.toISOString().split('T')[0];
                    } else {
                        // Xử lý cho ngày hiện tại hoặc xóa trường ngày nếu cần
                        startDateInput.value = today.toISOString().split('T')[0];
                        endDateInput.value = today.toISOString().split('T')[0];
                    }
                });
            });
        </script>
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
                    <td><center>{{ $item->Kills }}</center></td>
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
