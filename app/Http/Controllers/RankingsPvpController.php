<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Http\Controllers\DAO\RankDAO;
use App\Models\SettingHome;
use App\Models\SettingRankingsPvP;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class RankingsPvpController extends Controller
{
    protected $setting;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->setting = SettingRankingsPvP::query()->first();
    }

    /**
     * Main PVP rankings page
     */
    public function index(Request $request)
    {
        $criteria = $this->processCriteria($request);
        $rank_DAO = new RankDAO();

        if ($this->setting->num_display) {
            $listType1 = $rank_DAO->getCharacterRanks($criteria);
        } else {
            $listType1 = collect();
        }

        return view('rankings')
            ->with([
                'listType1' => $listType1,
                'setting' => $this->setting,
                'settingGeneral' => (object) ['title' => 'Shaiya Legend']
            ]);
    }

    /**
     * All-time PVP rankings
     */
    public function pvpall(Request $request)
    {
        // For tab view, we need to prepare data for both factions
        $aolRanks = $this->getAllTimePvpByFaction(1);
        $uofRanks = $this->getAllTimePvpByFaction(2);

        return view('ranking-pvp-all')
            ->with([
                'aolRanks' => $aolRanks,
                'uofRanks' => $uofRanks,
                'setting' => $this->setting
            ]);
    }

    /**
     * Get all-time ranks by faction
     */
    private function getAllTimePvpByFaction($faction)
    {
        $criteria = [
            'page' => 1,
            'pageSize' => 10,
            'pageOrder' => 'K1',
            'pageDirection' => 'DESC',
            'faction' => $faction
        ];

        $rank_DAO = new RankDAO();
        $ranks = $rank_DAO->getCharacterRanks($criteria);

        return $ranks && $ranks->count() ? $ranks->items() : [];
    }

    /**
     * Daily kill rankings
     */
    public function onlykill(Request $request)
    {
        $date = $request->get('date');
        $selectedDate = $date
            ? Carbon::createFromFormat('d-m-Y', $date)->format('Y-m-d')
            : Carbon::now()->format('Y-m-d');

        // For tab view, we need data from both factions
        $aolRanks = $this->getDailyKillsByFaction(1, $selectedDate);
        $uofRanks = $this->getDailyKillsByFaction(2, $selectedDate);

        return view('ranking-only-kill')
            ->with([
                'aolRanks' => $aolRanks,
                'uofRanks' => $uofRanks,
                'selectedDate' => $selectedDate,
                'setting' => $this->setting
            ]);
    }
    /**
     * Get daily kills by faction
     */
    private function getDailyKillsByFaction($faction, $date)
    {
        $criteria = [
            'page' => 1,
            'pageSize' => 10,
            'pageOrder' => 'Kills',
            'pageDirection' => 'DESC',
            'faction' => $faction,
            'times' => true,
            'start_date' => $date,
            'end_date' => $date,
        ];

        $rank_DAO = new RankDAO();
        $ranks = $rank_DAO->getCharacterKills($criteria);

        return $ranks && $ranks->count() ? $ranks->items() : [];
    }


    /**
     * Hiển thị trang chiến tích trong ngày
     */
    public function pvpday(Request $request)
    {
        $date = $request->get('date');
        $selectedDate = $date
            ? Carbon::createFromFormat('d-m-Y', $date)->format('Y-m-d')
            : Carbon::now()->format('Y-m-d');

        // Lấy dữ liệu theo ngày từ Cache để cải thiện hiệu suất
        $cacheKey = 'pvp_day_' . $selectedDate;
        $data = Cache::remember($cacheKey, 300, function () use ($selectedDate) {
            // Lấy dữ liệu cho Liên minh Ánh Sáng (faction=1)
            $aolRanks = $this->getDailyPvPByFaction(1, $selectedDate);

            // Lấy dữ liệu cho Liên minh Phẫn Nộ (faction=2)
            $uofRanks = $this->getDailyPvPByFaction(2, $selectedDate);

            return [
                'aolRanks' => $aolRanks,
                'uofRanks' => $uofRanks
            ];
        });

        return view('ranking-pvp-day')
            ->with([
                'aolRanks' => $data['aolRanks'],
                'uofRanks' => $data['uofRanks'],
                'selectedDate' => $selectedDate,
                'setting' => $this->setting
            ]);
    }

    /**
     * Lấy dữ liệu PVP theo ngày cho từng phe
     */
    private function getDailyPvPByFaction($faction, $date)
    {
        $criteria = [
            'page' => 1,
            'pageSize' => 10,
            'pageOrder' => 'Kills',
            'pageDirection' => 'DESC',
            'faction' => $faction,
            'times' => true,
            'start_date' => $date,
            'end_date' => $date,
        ];

        $rank_DAO = new RankDAO();
        $ranks = $rank_DAO->getCharacterKills($criteria);

        return $ranks && $ranks->count() ? $ranks->items() : [];
    }

    /**
     * Weekly PVP rankings
     */
    public function pvpweek(Request $request)
    {
        // Get data for weekly rankings
        $startDate = Carbon::now()->startOfWeek()->format('Y-m-d');
        $endDate = Carbon::now()->format('Y-m-d');

        // For tab view, we need data from both factions
        $aolRanks = $this->getWeeklyKillsByFaction(1, $startDate, $endDate);
        $uofRanks = $this->getWeeklyKillsByFaction(2, $startDate, $endDate);

        return view('ranking-pvp-week')
            ->with([
                'aolRanks' => $aolRanks,
                'uofRanks' => $uofRanks,
                'setting' => $this->setting
            ]);
    }

    /**
     * Get weekly kills by faction
     */
    private function getWeeklyKillsByFaction($faction, $startDate, $endDate)
    {
        $criteria = [
            'page' => 1,
            'pageSize' => 10,
            'pageOrder' => 'Kills',
            'pageDirection' => 'DESC',
            'faction' => $faction,
            'times' => true,
            'start_date' => $startDate,
            'end_date' => $endDate,
        ];

        $rank_DAO = new RankDAO();
        $ranks = $rank_DAO->getCharacterKills($criteria);

        return $ranks && $ranks->count() ? $ranks->items() : [];
    }

    /**
     * Process and validate request criteria
     */
    private function processCriteria(Request $request)
    {
        $level = 0;
        $faction = 0;
        if ($request->has('lm') && in_array(intval(Helper::clearXSS($request->lm)), [1,2])) {
            $faction = intval(Helper::clearXSS($request->lm));
        }

        $class = 0;
        if (isset($_REQUEST['class']) && (!empty($_REQUEST['class']) || is_numeric($_REQUEST['class']))) {
            $class = Helper::clearXSS($_REQUEST['class']);
        }

        $page = isset($_REQUEST['page']) && (!empty($_REQUEST['page']) && is_numeric($_REQUEST['page'])) && $_REQUEST['page'] >= 0
            ? Helper::clearXSS($_REQUEST['page'])
            : 1;

        $criteria = [
            'page' => $page,
            'pageSize' => $this->setting->num_display ?? 100,
            'pageOrder' => 'K1',
            'pageDirection' => 'DESC',
        ];

        if ($class) $criteria['class'] = $class;
        if ($faction) $criteria['faction'] = $faction;

        return $criteria;
    }

    /**
     * Get navigation data for sidebar or other navigation elements
     */
    public static function getListNav()
    {
        $level = 0;
        $defaultPageSize = 10;
        $defaultpage = 0;

        $pagingData = [
            'page' => $defaultpage,
            'pageSize' => $defaultPageSize,
            'pageOrder' => 'LV',
            'pageDirection' => 'DESC',
            'level' => $level,
            'class' => 0,
            'faction' => 0,
        ];

        $rank_DAO = new RankDAO();
        return $rank_DAO->getCharacterRanks($pagingData);
    }
}
