<script>
    function bootstrapAlertSuccess() {
        $.bootstrapGrowl('', {
            ele: 'body',
            type: 'success',
            offset: {
                from: 'bottom',
                amount: 20
            },
            align: 'right',
            width: 350,
            delay: 4000,
            allow_dismiss: true,
            stackup_spacing: 10
        });
    }

    function bootstrapAlertError() {
        $.bootstrapGrowl('', {
            ele: 'body',
            type: 'danger',
            offset: {
                from: 'bottom',
                amount: 20
            },
            align: 'right',
            width: 350,
            delay: 4000,
            allow_dismiss: true,
            stackup_spacing: 10
        });
    }
</script>

<div id="topbar" class="topbar">
    <div class="topbar-main">
        <div class="header-today">
            <?php
            // Thiết lập múi giờ và ngôn ngữ
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            \Illuminate\Support\Carbon::setLocale('vi');

            // Tạo đối tượng ngày (ví dụ: 27 tháng 8, 2024)
            $date = \Illuminate\Support\Carbon::now();

            // Định dạng ngày tháng
            $formattedDate = $date->isoFormat('dddd, MMMM D, YYYY');

            // Viết hoa chữ cái đầu của mỗi từ
            $formattedDate = \Illuminate\Support\Str::title($formattedDate);

            // In ra ngày đã định dạng
            echo $formattedDate;
            ?>
        </div>

        @guest

        <!-- <div class="header-user">
            <a href='{{ route('login') }}'>{{ __('Login') }}</a>
            <span>/</span>
            <a href='{{ route('register') }}'>{{ __('Register') }}</a>
        </div> -->

        @endguest

    </div>

</div>
<header id="header" class="header">

    <div class="navbar-header">
        <div class="navbar-header-main">
            <!-- <div class="logo_holder">
            <h1>
                <a href="{{ route('home') }}" class="logo" title="" style="background-image: url('/assets/images/misc/logo.png');" alt="Logo">
                </a>
            </h1>
        </div> -->
            <div class="navbar-item">
                <a href="{{ route('home') }}" class="nav_item type-menu">
                    <span>{{ $settingHome->header }}
                        <!-- <i>{{ $settingHome->header }}</i> -->
                    </span>
                </a>
            </div>
            <div class="navbar-item">
                <a href="javascript:void(0)" class="nav_item type-menu  hasSubmenu">
                    <span>{{ __('GUIDE') }}
                        <!-- <i>{{ __('GUIDE') }}</i> -->
                    </span>
                </a>
                <div id="menutrim3" class="dropdown-holder">
                    <ul class="dropdown-nav">
                        <li><a href="{{ route('guide-rules') }}" class="nav_item type-submenu">{{ $settingGuideRules->header }}</a></li>
                        <li><a href="{{ route('guide-droplist') }}" class="nav_item type-submenu">{{ $settingGuideDroplist->header }}</a></li>
{{--                        <li><a href="{{ route('guide-faqs') }}" class="nav_item type-submenu">{{ $settingGuideFaqs->header }}</a></li>--}}
                        <li><a href="{{ route('server-info') }}" class="nav_item type-submenu">THÔNG TIN SERVER</a></li>
                    </ul>
                </div>
            </div>
            <div class="navbar-item">
                <a href="{{ route('media') }}" class="nav_item type-menu">
                    <span>{{ $settingMedia->header }}
                        <!-- <i>{{ $settingMedia->header }}</i> -->
                    </span>
                </a>
            </div>

            <div class="navbar-item">
                <a href="javascript:void(0)" class="nav_item type-menu  hasSubmenu">
                    <span>{{ __('RANKINGS') }}
                        <!-- <i>{{ __('RANKINGS') }}</i> -->
                    </span>
                </a>
                <div id="menutrim3" class="dropdown-holder">
                    <ul class="dropdown-nav">
                        <li><a href="{{ route('rankings-pvp') }}" class="nav_item type-submenu">{{ $settingRankingsPvp->header }}</a></li>
                        <li><a href="{{ route('rankings-guild') }}" class="nav_item type-submenu">{{ $settingRankingsGuild->header }}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- <div class="header-inner">

        <div class="logo_holder">

            <h1>
                <a href="{{ route('home') }}" class="logo" title="" style="background-image: url('/assets/images/misc/logo.png' }}');" alt="Logo">
                </a>
                <a href="{{ route('home') }}" class="logo" title="" style="background-image: url('{{ $settingHome->logo ? $settingHome->logo->url : '/assets/images/misc/logo.png' }}');" alt="Logo">
                </a>
            </h1>

        </div>
        <div class="navigation border_box self_clear">

            <ul class="nav_menu left_area">

                <li>
                    <a href="{{ route('home') }}" class="nav_item type-menu">
                        <span>{{ $settingHome->header }}<i>{{ $settingHome->header }}</i></span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="nav_item type-menu  hasSubmenu">
                        <span>{{ __('GUIDE') }}<i>{{ __('GUIDE') }}</i></span>
                    </a>
                    <div id="menutrim3" class="dropdown-holder">
                        <ul class="dropdown-nav">
                            <li><a href="{{ route('guide-rules') }}" class="nav_item type-submenu">{{ $settingGuideRules->header }}</a></li>
                            <li><a href="{{ route('guide-droplist') }}" class="nav_item type-submenu">{{ $settingGuideDroplist->header }}</a></li>
                            <li><a href="{{ route('guide-faqs') }}" class="nav_item type-submenu">{{ $settingGuideFaqs->header }}</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="{{ route('media') }}" class="nav_item type-menu">
                        <span>{{ $settingMedia->header }}<i>{{ $settingMedia->header }}</i></span>
                    </a>
                </li>

            </ul>

            <ul class="nav_menu right_area">


                <li>
                    <a href="{{ route('item-mall') }}" class="nav_item type-menu">
                        <span>{{ $settingItemMall->header }}<i>{{ $settingItemMall->header }}</i></span>
                    </a>
                    {{--<div id="menutrim3" class="dropdown-holder">
                        <ul class="dropdown-nav">
                            <li><a href="{{ route('item-mall') }}" class="nav_item type-submenu">TIERED SPENDER</a></li>
                        </ul>
                    </div>--}}
                </li>

                <li>
                    <a href="javascript:void(0)" class="nav_item type-menu  hasSubmenu">
                        <span>{{ __('RANKINGS') }}<i>{{ __('RANKINGS') }}</i></span>
                    </a>
                    <div id="menutrim3" class="dropdown-holder">
                        <ul class="dropdown-nav">
                            <li><a href="{{ route('rankings-pvp') }}" class="nav_item type-submenu">{{ $settingRankingsPvp->header }}</a></li>
                            <li><a href="{{ route('rankings-guild') }}" class="nav_item type-submenu">{{ $settingRankingsGuild->header }}</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="{{ route('download') }}" class="nav_item type-menu nav_active">
                        <span>{{ $settingDownload->header }}<i>{{ $settingDownload->header }}</i></span>
                    </a>
                </li>
            </ul>

        </div>

    </div> -->

</header>
<!--
@if($settingHome->slide_images)
<div id="slider_container" class="slider_container border_box anti_blur">
    <div id="slider">
        @foreach($settingHome->slide_images as $image)
        <img src="{{ $image->url }}" alt="" />
        @endforeach
    </div>
    <div class="slider_pagination">
    </div>
</div>
@endif -->
