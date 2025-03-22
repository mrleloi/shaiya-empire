<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Http\Controllers\DAO\RankDAO;
use App\Models\SettingHome;
use App\Models\SettingRankingsGuild;
use Illuminate\Http\Request;

class RankingsGuildController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = SettingRankingsGuild::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $level = 0;
        $faction = 0;
        if ($request->has('lm') && in_array(intval(Helper::clearXSS($request->lm)), [1,2])) $faction = intval(Helper::clearXSS($request->lm));

        $class = 0;
        if (isset($_REQUEST['class']) && (!empty($_REQUEST['class']) || is_numeric($_REQUEST['class']))) $class = Helper::clearXSS($_REQUEST['class']);

        $times = 1;
        if ($request->has('times') && in_array(intval(Helper::clearXSS($request->times)), [1,2,3])) $times = intval(Helper::clearXSS($request->times));

        $rank_DAO = new RankDAO();
        $defaultPageSize = $this->setting->num_display;
//        $defaultPageSize = 5;
        if ($defaultPageSize) {
            $defaultpage = 0;
            $validPageSizes = array($defaultPageSize); // This determines valid values for how many results can be displayed on a page.
            $validOrderBys = array('K1','K2','KDR'); // This determines valid values for how the results can be ordered on a page.
            $validPageDirections = array('ASC','DESC'); // This determines valid values for how the direction results can be sorted on a page.

            // Gather valid user input from the user's POST request
            $pagingData = array();
            $type = 1;
            if ($type == 1) {
                $pagingData['page'] = isset($_REQUEST['page']) && (!empty($_REQUEST['page']) && is_numeric($_REQUEST['page'])) && $_REQUEST['page'] >= 0 ? Helper::clearXSS($_REQUEST['page']) : Helper::clearXSS($defaultpage);
            } else {
                $pagingData['page'] = 0;
            }
            $pagingData['pageSize'] = isset($_REQUEST['pageSize']) && (!empty($_REQUEST['page']) && is_numeric($_REQUEST['pageSize'])) && in_array($_REQUEST['pageSize'],$validPageSizes) ? Helper::clearXSS($_REQUEST['pageSize']) : Helper::clearXSS($defaultPageSize);
//            $pagingData['pageOrder'] = isset($_REQUEST['pageOrder']) && !empty($_REQUEST['pageOrder']) && in_array($_REQUEST['pageOrder'],$validOrderBys) ? Helper::clearXSS($_REQUEST['pageOrder']) : 'K1';
//            $pagingData['pageDirection'] = isset($_REQUEST['pageDirection']) && !empty($_REQUEST['pageDirection']) && in_array($_REQUEST['pageDirection'],$validPageDirections) ? Helper::clearXSS($_REQUEST['pageDirection']) : 'DESC';

//            $pagingData['level'] = $level;
            if ($class) $pagingData['class'] = $class;
            if ($faction) $pagingData['faction'] = $faction;

            // sort by Kills
            $pagingData['pageOrder'] = 'KDR';
            $pagingData['pageDirection'] = 'DESC';

            // group by date/week/month
            if ($times) {
                $pagingData['times'] = $times;
                $pagingData['start_date'] = Helper::clearXSS($request->start_date);
                $pagingData['end_date'] = Helper::clearXSS($request->end_date);
            }

            $listType1 = $rank_DAO->getCharacterKills($pagingData);
        } else {
            $listType1 = collect();
        }
//        dd($listType1);
        return view('rankings-guild')
            ->with([
                'listType1' => $listType1,
                'setting' => $this->setting
            ]);
    }
}
