@if(isset($listType1) && count($listType1) > 0)
    <div class="ranking">
        <table id="rank" class="rank">
            <thead>
            <tr>
                <th width="30" style="text-align: center;">#</th>
                <th width="50" style="text-align: center;">Icon</th>
                <th style="text-align: left; padding-left: 10px;">Nhân vật</th>
                <th width="190" style="text-align: left; padding-left: 10px;">Nghề</th>
                <th width="120" style="text-align: center;">Chiến tích</th>
            </tr>
            </thead>
            <tbody>
            @foreach($listType1 as $item)
                <tr>
                    <td style="text-align: center;font-size:13px;">{{ $item->RowIndex }}</td>
                    <td style="text-align: center; padding: 0px;">
                        @php
                            $classImageName = '';
                            switch($item->CharClass) {
                                case 'Fighter': $classImageName = 'cbds.png'; break;
                                case 'Defender': $classImageName = 'vbgs.png'; break;
                                case 'Archer': $classImageName = 'ctts.png'; break;
                                case 'Ranger': $classImageName = 'stsk.png'; break;
                                case 'Mage': $classImageName = 'pstp.png'; break;
                                case 'Priest': $classImageName = 'tstt.png'; break;
                                case 'Warrior': $classImageName = 'cbds.png'; break;
                                case 'Guardian': $classImageName = 'vbgs.png'; break;
                                case 'Assassin': $classImageName = 'stsk.png'; break;
                                case 'Hunter': $classImageName = 'ctts.png'; break;
                                case 'Pagan': $classImageName = 'pstp.png'; break;
                                case 'Oracle': $classImageName = 'tstt.png'; break;
                                default: $classImageName = 'cbds.png'; break;
                            }
                        @endphp
                        <img src="images/class/{{ $classImageName }}" width="35" border="0" style="padding: 3px;" title="{{ $item->CharClass }}">
                    </td>
                    <td style="text-align: left; padding-left: 10px;font-size:13px;">{!! \App\Helpers\Helper::decodeText($item->CharName) !!}</td>
                    <td style="text-align: left; padding-left: 10px;font-size:13px;">
                        @php
                            $className = '';
                            switch($item->CharClass) {
                                case 'Fighter': $className = 'Chiến binh'; break;
                                case 'Defender': $className = 'Vệ binh'; break;
                                case 'Archer': $className = 'Cung thủ'; break;
                                case 'Ranger': $className = 'Sát thủ'; break;
                                case 'Mage': $className = 'Pháp sư'; break;
                                case 'Priest': $className = 'Tu sĩ'; break;
                                case 'Warrior': $className = 'Đấu sĩ'; break;
                                case 'Guardian': $className = 'Giáp sĩ'; break;
                                case 'Assassin': $className = 'Thích khách'; break;
                                case 'Hunter': $className = 'Thợ săn'; break;
                                case 'Pagan': $className = 'Thầy pháp'; break;
                                case 'Oracle': $className = 'Tiên tri'; break;
                                default: $className = $item->CharClass; break;
                            }
                            echo $className;
                        @endphp
                    </td>
                    <td style="text-align: center;font-size:13px;">{{ $item->K1 }}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>

    <div class="pagination" style="text-align: center; margin-top: 20px;">
        <a class="nice_button pvp-paginate" data-page="1" href="javascript:void(0)"><i class="fas fa-angle-double-left" aria-hidden="true"></i></a>
        @php
            $start = max($listType1->currentPage() - 2, 1);
            $end = min($listType1->currentPage() + 2, $listType1->lastPage());

            if ($start > 1) {
                echo '<span>...</span>';
            }

            for ($i = $start; $i <= $end; $i++) {
                echo '<a style="margin-left:5px;" class="nice_button pvp-paginate '.($i == $listType1->currentPage() ? 'nice_active' : '').'" data-page="'.$i.'" href="javascript:void(0)">'.$i.'</a>';
            }

            if ($end < $listType1->lastPage()) {
                echo '<span>...</span>';
            }
        @endphp
        <a style="margin-left:5px;" class="nice_button pvp-paginate" data-page="{{ $listType1->lastPage() }}" href="javascript:void(0)"><i class="fas fa-angle-double-right" aria-hidden="true"></i></a>
    </div>
@else
    <div class="alert alert-info">Không có dữ liệu hiển thị.</div>
@endif
