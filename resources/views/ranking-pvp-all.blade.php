{{-- ranking-pvp-all.blade.php --}}

<div class="rankingtab tabbable boxed parentTabs" style="padding: 5px 5px 0 5px;">

    <ul class="nav nav-tabs" style="margin-bottom: 5px;">
        <li class="active"><a href="#rankas">Liên minh Ánh Sáng</a></li>
        <li><a href="#rankpn">Liên minh Phẫn Nộ</a></li>
    </ul>
    <br>

    <div id="ranking">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="rankas">
                <div class="tabbable">
                    <div class="ranking">
                        <table id="rank" class="rank">
                            <thead>
                            <tr>
                                <th width="30" style="text-align: center;">#</th>
                                <th width="50" style="text-align: center;">Icon</th>
                                <th style="text-align: left; padding-left: 10px;" >Nhân vật</th>
                                <th width="190" style="text-align: left; padding-left: 10px;">Nghề</th>
                                <th width="120" style="text-align: center;">Chiến tích</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($aolRanks as $index => $player)
                                <tr>
                                    <td style="text-align: center;font-size:13px;">{{ $index + 1 }}</td>
                                    <td style="text-align: center; padding: 0px;">
                                        <img src="images/class/{{ \App\Helpers\Helper::getClassImageName($player->CharClassID) }}.png" width="35" border="0" style="padding: 3px;" title="" />
                                    </td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">{{ \App\Helpers\Helper::decodeText($player->CharName) }}</td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">{{ $player->CharClass }}</td>
                                    <td style="text-align: center;font-size:13px;">{{ $player->K1 }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td style="text-align: center;font-size:13px;">1</td>
                                    <td style="text-align: center; padding: 0px;"><img src="images/class/cbds.png" width="35" border="0" style="padding: 3px;" title="" /></td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">Không có dữ liệu</td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">-</td>
                                    <td style="text-align: center;font-size:13px;">0</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="rankpn">
                <div class="tabbable">
                    <div class="ranking">
                        <table id="rank" class="rank">
                            <thead>
                            <tr>
                                <th width="30" style="text-align: center;">#</th>
                                <th width="50" style="text-align: center;">Icon</th>
                                <th style="text-align: left; padding-left: 10px;" >Nhân vật</th>
                                <th width="190" style="text-align: left; padding-left: 10px;">Nghề</th>
                                <th width="120" style="text-align: center;">Chiến tích</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($uofRanks as $index => $player)
                                <tr>
                                    <td style="text-align: center;font-size:13px;">{{ $index + 1 }}</td>
                                    <td style="text-align: center; padding: 0px;">
                                        <img src="images/class/{{ \App\Helpers\Helper::getClassImageName($player->CharClassID) }}.png" width="35" border="0" style="padding: 3px;" title="" />
                                    </td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">{{ \App\Helpers\Helper::decodeText($player->CharName) }}</td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">{{ $player->CharClass }}</td>
                                    <td style="text-align: center;font-size:13px;">{{ $player->K1 }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td style="text-align: center;font-size:13px;">1</td>
                                    <td style="text-align: center; padding: 0px;"><img src="images/class/cbds.png" width="35" border="0" style="padding: 3px;" title="" /></td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">Không có dữ liệu</td>
                                    <td style="text-align: left; padding-left: 10px;font-size:13px;">-</td>
                                    <td style="text-align: center;font-size:13px;">0</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <BR>
</div>

<div id="rank_view_top" title="" style="width: 100%;">
    <div id="ranking_top"></div>
</div>

<script type="text/javascript">
    $("ul.nav-tabs a").click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
</script>
