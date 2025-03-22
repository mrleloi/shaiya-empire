<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingGeneralRequest;
use App\Http\Requests\UpdateSettingGeneralRequest;
use App\Http\Resources\Admin\SettingGeneralResource;
use App\Models\SettingGeneral;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingGeneralApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_general_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingGeneralResource(SettingGeneral::all());
    }

    public function store(StoreSettingGeneralRequest $request)
    {
        $settingGeneral = SettingGeneral::create($request->all());

        if ($request->input('icon', false)) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('icon'))))->toMediaCollection('icon');
        }

        if ($request->input('background', false)) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('background'))))->toMediaCollection('background');
        }

        return (new SettingGeneralResource($settingGeneral))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingGeneralResource($settingGeneral);
    }

    public function update(UpdateSettingGeneralRequest $request, SettingGeneral $settingGeneral)
    {
        $settingGeneral->update($request->all());

        if ($request->input('icon', false)) {
            if (! $settingGeneral->icon || $request->input('icon') !== $settingGeneral->icon->file_name) {
                if ($settingGeneral->icon) {
                    $settingGeneral->icon->delete();
                }
                $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('icon'))))->toMediaCollection('icon');
            }
        } elseif ($settingGeneral->icon) {
            $settingGeneral->icon->delete();
        }

        if ($request->input('background', false)) {
            if (! $settingGeneral->background || $request->input('background') !== $settingGeneral->background->file_name) {
                if ($settingGeneral->background) {
                    $settingGeneral->background->delete();
                }
                $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('background'))))->toMediaCollection('background');
            }
        } elseif ($settingGeneral->background) {
            $settingGeneral->background->delete();
        }

        return (new SettingGeneralResource($settingGeneral))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingGeneral->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
