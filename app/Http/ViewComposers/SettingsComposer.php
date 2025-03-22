<?php

namespace App\Http\ViewComposers;

use App\Http\Controllers\RankingsPvpController;
use App\Models\GuideDroplist;
use App\Models\GuideFaq;
use App\Models\GuideRule;
use App\Models\SettingBossRecord;
use App\Models\SettingDonate;
use App\Models\SettingDownload;
use App\Models\SettingItemMall;
use App\Models\SettingMedium;
use App\Models\SettingRankingsGuild;
use App\Models\SettingRankingsPvP;
use App\Models\SettingVote;
use Illuminate\View\View;
use App\Models\SettingGeneral;
use App\Models\SettingHome;

class SettingsComposer
{
    public function compose(View $view)
    {
        $view->with('settingGeneral', SettingGeneral::query()->first())
            ->with('settingHome', SettingHome::query()->first())
//            ->with('settingBossRecord', SettingBossRecord::query()->first())
            ->with('settingDonate', SettingDonate::query()->first())
            ->with('settingDownload', SettingDownload::query()->first())
//            ->with('settingGuideDroplist', GuideDroplist::query()->first())
            ->with('settingGuideFaqs', GuideFaq::query()->first())
            ->with('settingGuideRules', GuideRule::query()->first())
//            ->with('settingItemMall', SettingItemMall::query()->first())
            ->with('settingMedia', SettingMedium::query()->first())
//            ->with('settingRankingsGuild', SettingRankingsGuild::query()->first())
            ->with('settingRankingsPvp', SettingRankingsPvP::query()->first());
//            ->with('settingVote', SettingVote::query()->first());
    }
}
