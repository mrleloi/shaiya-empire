<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingMediumRequest;
use App\Http\Requests\UpdateSettingMediumRequest;
use App\Http\Resources\Admin\SettingMediumResource;
use App\Models\SettingMedium;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingMediaApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_medium_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingMediumResource(SettingMedium::all());
    }

    public function store(StoreSettingMediumRequest $request)
    {
        $settingMedium = SettingMedium::create($request->all());

        return (new SettingMediumResource($settingMedium))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingMedium $settingMedium)
    {
        abort_if(Gate::denies('setting_medium_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingMediumResource($settingMedium);
    }

    public function update(UpdateSettingMediumRequest $request, SettingMedium $settingMedium)
    {
        $settingMedium->update($request->all());

        return (new SettingMediumResource($settingMedium))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingMedium $settingMedium)
    {
        abort_if(Gate::denies('setting_medium_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingMedium->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
