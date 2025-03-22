<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroySettingRankingsGuildRequest;
use App\Http\Requests\StoreSettingRankingsGuildRequest;
use App\Http\Requests\UpdateSettingRankingsGuildRequest;
use App\Models\SettingRankingsGuild;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingRankingsGuildController extends Controller
{
    use CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_rankings_guild_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingRankingsGuild::query()->select(sprintf('%s.*', (new SettingRankingsGuild)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_rankings_guild_show';
                $editGate      = 'setting_rankings_guild_edit';
                $deleteGate    = 'setting_rankings_guild_delete';
                $crudRoutePart = 'setting-rankings-guilds';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : '';
            });
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : '';
            });
            $table->editColumn('header', function ($row) {
                return $row->header ? $row->header : '';
            });
            $table->editColumn('num_display', function ($row) {
                return $row->num_display ? $row->num_display : '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('admin.settingRankingsGuilds.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_rankings_guild_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsGuilds.create');
    }

    public function store(StoreSettingRankingsGuildRequest $request)
    {
        $settingRankingsGuild = SettingRankingsGuild::create($request->all());

        return redirect()->route('admin.setting-rankings-guilds.index');
    }

    public function edit(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsGuilds.edit', compact('settingRankingsGuild'));
    }

    public function update(UpdateSettingRankingsGuildRequest $request, SettingRankingsGuild $settingRankingsGuild)
    {
        $settingRankingsGuild->update($request->all());

        return redirect()->route('admin.setting-rankings-guilds.index');
    }

    public function show(SettingRankingsGuild $settingRankingsGuild)
    {
        abort_if(Gate::denies('setting_rankings_guild_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsGuilds.show', compact('settingRankingsGuild'));
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
