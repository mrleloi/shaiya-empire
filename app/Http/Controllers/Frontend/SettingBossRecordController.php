<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroySettingBossRecordRequest;
use App\Http\Requests\StoreSettingBossRecordRequest;
use App\Http\Requests\UpdateSettingBossRecordRequest;
use App\Models\SettingBossRecord;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingBossRecordController extends Controller
{
    use CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_boss_record_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingBossRecords = SettingBossRecord::all();

        return view('frontend.settingBossRecords.index', compact('settingBossRecords'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_boss_record_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingBossRecords.create');
    }

    public function store(StoreSettingBossRecordRequest $request)
    {
        $settingBossRecord = SettingBossRecord::create($request->all());

        return redirect()->route('frontend.setting-boss-records.index');
    }

    public function edit(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingBossRecords.edit', compact('settingBossRecord'));
    }

    public function update(UpdateSettingBossRecordRequest $request, SettingBossRecord $settingBossRecord)
    {
        $settingBossRecord->update($request->all());

        return redirect()->route('frontend.setting-boss-records.index');
    }

    public function show(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingBossRecords.show', compact('settingBossRecord'));
    }

    public function destroy(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingBossRecord->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingBossRecordRequest $request)
    {
        $settingBossRecords = SettingBossRecord::find(request('ids'));

        foreach ($settingBossRecords as $settingBossRecord) {
            $settingBossRecord->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
