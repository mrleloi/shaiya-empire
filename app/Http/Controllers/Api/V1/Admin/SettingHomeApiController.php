<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingHomeRequest;
use App\Http\Requests\UpdateSettingHomeRequest;
use App\Http\Resources\Admin\SettingHomeResource;
use App\Models\SettingHome;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingHomeApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_home_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingHomeResource(SettingHome::all());
    }

    public function store(StoreSettingHomeRequest $request)
    {
        $settingHome = SettingHome::create($request->all());

        if ($request->input('logo', false)) {
            $settingHome->addMedia(storage_path('tmp/uploads/' . basename($request->input('logo'))))->toMediaCollection('logo');
        }

        /*foreach ($request->input('slide_images', []) as $file) {
            $settingHome->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('slide_images');
        }*/

        return (new SettingHomeResource($settingHome))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingHome $settingHome)
    {
        abort_if(Gate::denies('setting_home_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingHomeResource($settingHome);
    }

    public function update(UpdateSettingHomeRequest $request, SettingHome $settingHome)
    {
        $settingHome->update($request->all());

        if ($request->input('logo', false)) {
            if (! $settingHome->logo || $request->input('logo') !== $settingHome->logo->file_name) {
                if ($settingHome->logo) {
                    $settingHome->logo->delete();
                }
                $settingHome->addMedia(storage_path('tmp/uploads/' . basename($request->input('logo'))))->toMediaCollection('logo');
            }
        } elseif ($settingHome->logo) {
            $settingHome->logo->delete();
        }

        /*if (count($settingHome->slide_images) > 0) {
            foreach ($settingHome->slide_images as $media) {
                if (! in_array($media->file_name, $request->input('slide_images', []))) {
                    $media->delete();
                }
            }
        }
        $media = $settingHome->slide_images->pluck('file_name')->toArray();
        foreach ($request->input('slide_images', []) as $file) {
            if (count($media) === 0 || ! in_array($file, $media)) {
                $settingHome->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('slide_images');
            }
        }*/

        return (new SettingHomeResource($settingHome))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingHome $settingHome)
    {
        abort_if(Gate::denies('setting_home_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingHome->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
