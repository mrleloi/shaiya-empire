<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroySettingRankingsPvPRequest;
use App\Http\Requests\StoreSettingRankingsPvPRequest;
use App\Http\Requests\UpdateSettingRankingsPvPRequest;
use App\Models\SettingRankingsPvP;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingRankingsPvPController extends Controller
{
    use CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_rankings_pv_p_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsPvPs = SettingRankingsPvP::all();

        return view('frontend.settingRankingsPvPs.index', compact('settingRankingsPvPs'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_rankings_pv_p_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsPvPs.create');
    }

    public function store(StoreSettingRankingsPvPRequest $request)
    {
        $settingRankingsPvP = SettingRankingsPvP::create($request->all());

        return redirect()->route('frontend.setting-rankings-pv-ps.index');
    }

    public function edit(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsPvPs.edit', compact('settingRankingsPvP'));
    }

    public function update(UpdateSettingRankingsPvPRequest $request, SettingRankingsPvP $settingRankingsPvP)
    {
        $settingRankingsPvP->update($request->all());

        return redirect()->route('frontend.setting-rankings-pv-ps.index');
    }

    public function show(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsPvPs.show', compact('settingRankingsPvP'));
    }

    public function destroy(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsPvP->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingRankingsPvPRequest $request)
    {
        $settingRankingsPvPs = SettingRankingsPvP::find(request('ids'));

        foreach ($settingRankingsPvPs as $settingRankingsPvP) {
            $settingRankingsPvP->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
