<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroySettingRankingsGuildRequest;
use App\Http\Requests\StoreSettingRankingsGuildRequest;
use App\Http\Requests\UpdateSettingRankingsGuildRequest;
use App\Models\SettingRankingsGuild;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingRankingsGuildController extends Controller
{
    use CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_rankings_guild_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsGuilds = SettingRankingsGuild::all();

        return view('frontend.settingRankingsGuilds.index', compact('settingRankingsGuilds'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_rankings_guild_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsGuilds.create');
    }

    public function store(StoreSettingRankingsGuildRequest $request)
    {
        $settingRankingsGuild = SettingRankingsGuild::create($request->all());

        return redirect()->route('frontend.setting-rankings-guilds.index');
    }

    public function edit(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsGuilds.edit', compact('settingRankingsGuild'));
    }

    public function update(UpdateSettingRankingsGuildRequest $request, SettingRankingsGuild $settingRankingsGuild)
    {
        $settingRankingsGuild->update($request->all());

        return redirect()->route('frontend.setting-rankings-guilds.index');
    }

    public function show(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingRankingsGuilds.show', compact('settingRankingsGuild'));
    }

    public function destroy(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingRankingsGuild->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingRankingsGuildRequest $request)
    {
        $settingRankingsGuilds = SettingRankingsGuild::find(request('ids'));

        foreach ($settingRankingsGuilds as $settingRankingsGuild) {
            $settingRankingsGuild->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
