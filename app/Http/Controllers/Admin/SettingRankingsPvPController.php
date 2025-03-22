<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroySettingRankingsPvPRequest;
use App\Http\Requests\StoreSettingRankingsPvPRequest;
use App\Http\Requests\UpdateSettingRankingsPvPRequest;
use App\Models\SettingRankingsPvP;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingRankingsPvPController extends Controller
{
    use CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingRankingsPvP::query()->select(sprintf('%s.*', (new SettingRankingsPvP)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_rankings_pv_p_show';
                $editGate      = 'setting_rankings_pv_p_edit';
                $deleteGate    = 'setting_rankings_pv_p_delete';
                $crudRoutePart = 'setting-rankings-pv-ps';

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

        return view('admin.settingRankingsPvPs.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_rankings_pv_p_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsPvPs.create');
    }

    public function store(StoreSettingRankingsPvPRequest $request)
    {
        $settingRankingsPvP = SettingRankingsPvP::create($request->all());

        return redirect()->route('admin.setting-rankings-pv-ps.index');
    }

    public function edit(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsPvPs.edit', compact('settingRankingsPvP'));
    }

    public function update(UpdateSettingRankingsPvPRequest $request, SettingRankingsPvP $settingRankingsPvP)
    {
        $settingRankingsPvP->update($request->all());

        return redirect()->route('admin.setting-rankings-pv-ps.index');
    }

    public function show(SettingRankingsPvP $settingRankingsPvP)
    {
        abort_if(Gate::denies('setting_rankings_pv_p_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingRankingsPvPs.show', compact('settingRankingsPvP'));
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
