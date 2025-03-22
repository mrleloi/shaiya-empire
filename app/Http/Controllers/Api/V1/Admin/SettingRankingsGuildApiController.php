<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSettingRankingsGuildRequest;
use App\Http\Requests\UpdateSettingRankingsGuildRequest;
use App\Http\Resources\Admin\SettingRankingsGuildResource;
use App\Models\SettingRankingsGuild;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingRankingsGuildApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('setting_rankings_guild_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingRankingsGuildResource(SettingRankingsGuild::all());
    }

    public function store(StoreSettingRankingsGuildRequest $request)
    {
        $settingRankingsGuild = SettingRankingsGuild::create($request->all());

        return (new SettingRankingsGuildResource($settingRankingsGuild))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingRankingsGuildResource($settingRankingsGuild);
    }

    public function update(UpdateSettingRankingsGuildRequest $request, SettingRankingsGuild $settingRankingsGuild)
    {
        $settingRankingsGuild->update($request->all());

        return (new SettingRankingsGuildResource($settingRankingsGuild))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsGuild->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
