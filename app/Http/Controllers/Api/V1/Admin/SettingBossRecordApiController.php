<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSettingBossRecordRequest;
use App\Http\Requests\UpdateSettingBossRecordRequest;
use App\Http\Resources\Admin\SettingBossRecordResource;
use App\Models\SettingBossRecord;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingBossRecordApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('setting_boss_record_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingBossRecordResource(SettingBossRecord::all());
    }

    public function store(StoreSettingBossRecordRequest $request)
    {
        $settingBossRecord = SettingBossRecord::create($request->all());

        return (new SettingBossRecordResource($settingBossRecord))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingBossRecordResource($settingBossRecord);
    }

    public function update(UpdateSettingBossRecordRequest $request, SettingBossRecord $settingBossRecord)
    {
        $settingBossRecord->update($request->all());

        return (new SettingBossRecordResource($settingBossRecord))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingBossRecord->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
