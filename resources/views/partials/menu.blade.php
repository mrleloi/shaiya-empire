<aside class="main-sidebar sidebar-dark-primary elevation-4" style="min-height: 917px;">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <span class="brand-text font-weight-light">{{ trans('panel.site_title') }}</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs("admin.home") ? "active" : "" }}" href="{{ route("admin.home") }}">
                        <i class="fas fa-fw fa-tachometer-alt nav-icon">
                        </i>
                        <p>
                            {{ trans('global.dashboard') }}
                        </p>
                    </a>
                </li>
                @can('user_management_access')
                    <li class="nav-item has-treeview {{ request()->is("admin/users*") ? "menu-open" : "" }} {{ request()->is("admin/permissions*") ? "menu-open" : "" }} {{ request()->is("admin/roles*") ? "menu-open" : "" }}">
                        <a class="nav-link nav-dropdown-toggle {{ request()->is("admin/users*") ? "active" : "" }} {{ request()->is("admin/permissions*") ? "active" : "" }} {{ request()->is("admin/roles*") ? "active" : "" }}" href="#">
                            <i class="fa-fw nav-icon fas fa-users">

                            </i>
                            <p>
                                {{ trans('cruds.userManagement.title') }}
                                <i class="right fa fa-fw fa-angle-left nav-icon"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @can('user_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.users.index") }}" class="nav-link {{ request()->is("admin/users") || request()->is("admin/users/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-user">

                                        </i>
                                        <p>
                                            {{ trans('cruds.user.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('permission_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.permissions.index") }}" class="nav-link {{ request()->is("admin/permissions") || request()->is("admin/permissions/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-unlock-alt">

                                        </i>
                                        <p>
                                            {{ trans('cruds.permission.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('role_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.roles.index") }}" class="nav-link {{ request()->is("admin/roles") || request()->is("admin/roles/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-briefcase">

                                        </i>
                                        <p>
                                            {{ trans('cruds.role.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcan
                {{--@can('game_user_access')
                    <li class="nav-item">
                        <a href="{{ route("admin.game-users.index") }}" class="nav-link {{ request()->is("admin/game-users") || request()->is("admin/game-users/*") ? "active" : "" }}">
                            <i class="fa-fw nav-icon fas fa-cogs">

                            </i>
                            <p>
                                {{ trans('cruds.gameUser.title') }}
                            </p>
                        </a>
                    </li>
                @endcan--}}
                @can('sites_setting_access')
                    <li class="nav-item has-treeview {{ request()->is("admin/setting-generals*") ? "menu-open" : "" }} {{ request()->is("admin/setting-homes*") ? "menu-open" : "" }} {{ request()->is("admin/guide-rules*") ? "menu-open" : "" }} {{ request()->is("admin/guide-droplists*") ? "menu-open" : "" }} {{ request()->is("admin/guide-faqs*") ? "menu-open" : "" }} {{ request()->is("admin/setting-media*") ? "menu-open" : "" }} {{ request()->is("admin/setting-item-malls*") ? "menu-open" : "" }} {{ request()->is("admin/setting-rankings-pv-ps*") ? "menu-open" : "" }} {{ request()->is("admin/setting-rankings-guilds*") ? "menu-open" : "" }} {{ request()->is("admin/setting-downloads*") ? "menu-open" : "" }} {{ request()->is("admin/setting-donates*") ? "menu-open" : "" }} {{ request()->is("admin/setting-boss-records*") ? "menu-open" : "" }} {{ request()->is("admin/setting-votes*") ? "menu-open" : "" }}">
                        <a class="nav-link nav-dropdown-toggle {{ request()->is("admin/setting-generals*") ? "active" : "" }} {{ request()->is("admin/setting-homes*") ? "active" : "" }} {{ request()->is("admin/guide-rules*") ? "active" : "" }} {{ request()->is("admin/guide-droplists*") ? "active" : "" }} {{ request()->is("admin/guide-faqs*") ? "active" : "" }} {{ request()->is("admin/setting-media*") ? "active" : "" }} {{ request()->is("admin/setting-item-malls*") ? "active" : "" }} {{ request()->is("admin/setting-rankings-pv-ps*") ? "active" : "" }} {{ request()->is("admin/setting-rankings-guilds*") ? "active" : "" }} {{ request()->is("admin/setting-downloads*") ? "active" : "" }} {{ request()->is("admin/setting-donates*") ? "active" : "" }} {{ request()->is("admin/setting-boss-records*") ? "active" : "" }} {{ request()->is("admin/setting-votes*") ? "active" : "" }}" href="#">
                            <i class="fa-fw nav-icon fas fa-cogs">

                            </i>
                            <p>
                                {{ trans('cruds.sitesSetting.title') }}
                                <i class="right fa fa-fw fa-angle-left nav-icon"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @can('setting_general_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-generals.index") }}" class="nav-link {{ request()->is("admin/setting-generals") || request()->is("admin/setting-generals/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingGeneral.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('setting_home_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-homes.index") }}" class="nav-link {{ request()->is("admin/setting-homes") || request()->is("admin/setting-homes/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingHome.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('news_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.newss.index") }}" class="nav-link {{ request()->is("admin/newss") || request()->is("admin/newss/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.news.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('guide_rule_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.guide-rules.index") }}" class="nav-link {{ request()->is("admin/guide-rules") || request()->is("admin/guide-rules/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.guideRule.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            {{--@can('guide_droplist_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.guide-droplists.index") }}" class="nav-link {{ request()->is("admin/guide-droplists") || request()->is("admin/guide-droplists/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.guideDroplist.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan--}}
                            @can('guide_faq_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.guide-faqs.index") }}" class="nav-link {{ request()->is("admin/guide-faqs") || request()->is("admin/guide-faqs/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.guideFaq.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('setting_medium_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-media.index") }}" class="nav-link {{ request()->is("admin/setting-media") || request()->is("admin/setting-media/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingMedium.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            {{--@can('setting_item_mall_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-item-malls.index") }}" class="nav-link {{ request()->is("admin/setting-item-malls") || request()->is("admin/setting-item-malls/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingItemMall.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan--}}
                            @can('setting_rankings_pv_p_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-rankings-pv-ps.index") }}" class="nav-link {{ request()->is("admin/setting-rankings-pv-ps") || request()->is("admin/setting-rankings-pv-ps/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingRankingsPvP.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            {{--@can('setting_rankings_guild_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-rankings-guilds.index") }}" class="nav-link {{ request()->is("admin/setting-rankings-guilds") || request()->is("admin/setting-rankings-guilds/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingRankingsGuild.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan--}}
                            @can('setting_download_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-downloads.index") }}" class="nav-link {{ request()->is("admin/setting-downloads") || request()->is("admin/setting-downloads/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingDownload.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('setting_donate_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-donates.index") }}" class="nav-link {{ request()->is("admin/setting-donates") || request()->is("admin/setting-donates/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingDonate.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            {{--@can('setting_boss_record_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-boss-records.index") }}" class="nav-link {{ request()->is("admin/setting-boss-records") || request()->is("admin/setting-boss-records/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingBossRecord.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan
                            @can('setting_vote_access')
                                <li class="nav-item">
                                    <a href="{{ route("admin.setting-votes.index") }}" class="nav-link {{ request()->is("admin/setting-votes") || request()->is("admin/setting-votes/*") ? "active" : "" }}">
                                        <i class="fa-fw nav-icon fas fa-cogs">

                                        </i>
                                        <p>
                                            {{ trans('cruds.settingVote.title') }}
                                        </p>
                                    </a>
                                </li>
                            @endcan--}}
                        </ul>
                    </li>
                @endcan
                {{--@can('support_access')
                    <li class="nav-item">
                        <a href="{{ route("admin.supports.index") }}" class="nav-link {{ request()->is("admin/supports") || request()->is("admin/supports/*") ? "active" : "" }}">
                            <i class="fa-fw nav-icon fas fa-cogs">

                            </i>
                            <p>
                                {{ trans('cruds.support.title') }}
                            </p>
                        </a>
                    </li>
                @endcan--}}
                {{--@php($unread = \App\Models\QaTopic::unreadCount())
                <li class="nav-item">
                    <a href="{{ route("admin.messenger.index") }}" class="{{ request()->is("admin/messenger") || request()->is("admin/messenger/*") ? "active" : "" }} nav-link">
                        <i class="fa-fw fa fa-envelope nav-icon">

                        </i>
                        <p>{{ trans('global.messages') }}</p>
                        @if($unread > 0)
                            <strong>( {{ $unread }} )</strong>
                        @endif

                    </a>
                </li>--}}
                @if(file_exists(app_path('Http/Controllers/Auth/ChangePasswordController.php')))
                    @can('profile_password_edit')
                        <li class="nav-item">
                            <a class="nav-link {{ request()->is('profile/password') || request()->is('profile/password/*') ? 'active' : '' }}" href="{{ route('admin.profile.password.edit') }}">
                                <i class="fa-fw fas fa-key nav-icon">
                                </i>
                                <p>
                                    {{ trans('global.change_password') }}
                                </p>
                            </a>
                        </li>
                    @endcan
                @endif
                <li class="nav-item">
                    <form method="POST" action="{{ route('admin.logout') }}" id="logout-admin-form">
                        @csrf

                        <a href="#" class="nav-link" onclick="event.preventDefault(); document.getElementById('logout-admin-form').submit();">
                            <p>
                                <i class="fas fa-fw fa-sign-out-alt nav-icon">

                                </i>
                            <p>{{ trans('global.logout') }}</p>
                            </p>
                        </a>
                    </form>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
