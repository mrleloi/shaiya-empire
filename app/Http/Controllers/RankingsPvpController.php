<?php
// RankingsPvpController.php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Http\Controllers\DAO\RankDAO;
use App\Models\SettingGeneral;
use App\Models\SettingRankingsPvP;
use Illuminate\Http\Request;

class RankingsPvpController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = SettingRankingsPvP::query()->first();
    }

    public function index(Request $request)
    {
        return view('rankings')
            ->with([
                'setting' => $this->setting,
            ]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function pvpall(Request $request)
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

        $type = 0;
        if ($request->has('type') && in_array(intval(Helper::clearXSS($request->type)), [1,2])) {
            $type = intval(Helper::clearXSS($request->type));
        }

        $rank_DAO = new RankDAO();
        $defaultPageSize = $this->setting->num_display;

        if ($defaultPageSize) {
            $defaultpage = 0;
            $validPageSizes = array($defaultPageSize);
            $validOrderBys = array('K1','K2','KDR');
            $validPageDirections = array('ASC','DESC');

            // Gather valid user input from the user's POST request
            $pagingData = array();
            $type = 1;
            if ($type == 1) {
                $pagingData['page'] = isset($_REQUEST['page']) && (!empty($_REQUEST['page']) && is_numeric($_REQUEST['page'])) && $_REQUEST['page'] >= 0 ? Helper::clearXSS($_REQUEST['page']) : Helper::clearXSS($defaultpage);
            } else {
                $pagingData['page'] = 0;
            }

            $pagingData['pageSize'] = isset($_REQUEST['pageSize']) && (!empty($_REQUEST['pageSize']) && is_numeric($_REQUEST['pageSize'])) && in_array($_REQUEST['pageSize'],$validPageSizes) ? Helper::clearXSS($_REQUEST['pageSize']) : Helper::clearXSS($defaultPageSize);

            if ($class) $pagingData['class'] = $class;
            if ($faction) $pagingData['faction'] = $faction;

            $listType1 = $rank_DAO->getCharacterRanks($pagingData);
            dd($listType1);
        } else {
            $listType1 = collect();
        }

        // Check if it's an AJAX request
        if ($request->ajax() || $request->has('ajax')) {
            return view('rankings-pvp-ajax')->with([
                'listType1' => $listType1,
            ]);
        }

        // Get general settings for the title
        $settingGeneral = SettingGeneral::query()->first();

        return view('rankings-pvp')->with([
            'listType1' => $listType1,
            'setting' => $this->setting,
            'settingGeneral' => $settingGeneral
        ]);
    }
}
