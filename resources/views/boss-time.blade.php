<style type="text/css">
    .bosstime table {
        width: 100%;
        border-spacing: 1px;
        border-collapse: separate;
        cursor: default;
        border: 2px solid rgba(0,0,0,0.5);
    }
    .bosstime table thead tr td{
        background-color: rgba(0,0,0,0.5);
        padding: 10px;
    }
    .bosstime table tbody tr td{
        padding: 7px 10px;
        border: 1px solid rgba(0,0,0,0.2);
    }
    .bosstime table tbody tr {
        background: url(images/top_bosstime_line.png) no-repeat bottom;
    }
    .bosstime table tbody {
        transition: 300ms ease all;
    }
    .bosstime table tbody:hover {
        background-color: rgba(0,0,0,0.2);
    }
    .bosstime button {
        font-size: 14px;
        width: 100%;
    }
    .bosstime span.claimed {
        color: #159f42;
    }
    .bosstime span.unclaimed {
        color: #bc5353;
    }
    .bosstime a.unclaimed {
        background-color: #4d321f;
        display: block;
        padding: 2px 5px;
        transition: 300ms ease all;
        color: #DACBB5;
        border-radius: 2px;
    }
    .bosstime a:hover.unclaimed {
        background-color: #925d33;
        color: #fffdd9;
    }
</style>
<script type="text/javascript" src="date.php"></script>
<script type="text/javascript" src="js/jquery.countdown.js"></script>
<div class="main_container box-shadow">
    <div class="header">
        <div class="header_left">Hệ thống boss tại {{ $settingGeneral->title }}</div>
        <div class="clear"></div>
    </div>
    <div class="global_container">
        <div class="sub_container">
            <div class="main_content bosstime">
                <table>
                    <thead>
                    <tr>
                        <td width="95" align="center">Tên boss</td>
                        <td width="100" align="center">Thời điểm</td>
                        <td width="75" align="center">Hồi sinh</td>
                        <td width="120" align="center">Dự kiến</td>
                    </tr>
                    </thead>

                    @forelse($bossList as $boss)
                        <tbody>
                        <tr>
                            <td>
                            <span style="font-size:10pt;">
                                @if($boss->hasColor)
                                    <span style="color:{{ $boss->colorCode }}">{{ $boss->MobName }}</span>
                                @else
                                    {{ $boss->MobName }}
                                @endif
                            </span>
                            </td>
                            <td align="center"><span style="font-size:10pt;">{{ $boss->formattedActionTime }}</span></td>
                            <td align="center"><span style="font-size:10pt;">{{ $boss->respawnHours }}</span></td>
                            <td align="center" class="cdcontainer" id="{{ $boss->nextRespawnTimestamp }}">
                                @if(is_numeric($boss->nextRespawnTimestamp))
                                    <span class='countdownBoss'>{{ $boss->nextRespawnTimestamp }}</span>
                                @else
                                    <span style="font-size:10pt;">{{ $boss->nextRespawnTimestamp }}</span>
                                @endif
                            </td>
                        </tr>
                        </tbody>
                    @empty
                        <tbody>
                        <tr>
                            <td style="text-align: left; padding-left: 10px;font-size:13px;">Không có dữ liệu</td>
                        </tr>
                        </tbody>
                    @endforelse
                </table>
{{--                <br/>--}}
{{--                <p><center>Chu kì boss nguyên tố tại Canos: <strong>Hậu duệ Bawii (vị trí Dentatus) > Dentatus > Secreta > Ales > Lumen</strong></center></p>--}}
            </div>
        </div>
    </div>
</div>

<div id="vote_result"></div>
