<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSettingRankingsPvPRequest;
use App\Http\Requests\UpdateSettingRankingsPvPRequest;
use App\Http\Resources\Admin\SettingRankingsPvPResource;
use App\Models\SettingRankingsPvP;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingRankingsPvPApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('setting_rankings_pv_p_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingRankingsPvPResource(SettingRankingsPvP::all());
    }

    public function store(StoreSettingRankingsPvPRequest $request)
    {
        $settingRankingsPvP = SettingRankingsPvP::create($request->all());

        return (new SettingRankingsPvPResource($settingRankingsPvP))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingRankingsPvPResource($settingRankingsPvP);
    }

    public function update(UpdateSettingRankingsPvPRequest $request, SettingRankingsPvP $settingRankingsPvP)
    {
        $settingRankingsPvP->update($request->all());

        return (new SettingRankingsPvPResource($settingRankingsPvP))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsPvP->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
