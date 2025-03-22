<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingDonateRequest;
use App\Http\Requests\UpdateSettingDonateRequest;
use App\Http\Resources\Admin\SettingDonateResource;
use App\Models\SettingDonate;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingDonateApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_donate_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingDonateResource(SettingDonate::all());
    }

    public function store(StoreSettingDonateRequest $request)
    {
        $settingDonate = SettingDonate::create($request->all());

        return (new SettingDonateResource($settingDonate))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingDonate $settingDonate)
    {
        abort_if(Gate::denies('setting_donate_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingDonateResource($settingDonate);
    }

    public function update(UpdateSettingDonateRequest $request, SettingDonate $settingDonate)
    {
        $settingDonate->update($request->all());

        return (new SettingDonateResource($settingDonate))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingDonate $settingDonate)
    {
        abort_if(Gate::denies('setting_donate_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingDonate->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
