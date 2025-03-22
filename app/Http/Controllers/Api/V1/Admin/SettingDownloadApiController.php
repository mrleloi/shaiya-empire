<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingDownloadRequest;
use App\Http\Requests\UpdateSettingDownloadRequest;
use App\Http\Resources\Admin\SettingDownloadResource;
use App\Models\SettingDownload;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingDownloadApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_download_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingDownloadResource(SettingDownload::all());
    }

    public function store(StoreSettingDownloadRequest $request)
    {
        $settingDownload = SettingDownload::create($request->all());

        return (new SettingDownloadResource($settingDownload))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingDownload $settingDownload)
    {
        abort_if(Gate::denies('setting_download_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingDownloadResource($settingDownload);
    }

    public function update(UpdateSettingDownloadRequest $request, SettingDownload $settingDownload)
    {
        $settingDownload->update($request->all());

        return (new SettingDownloadResource($settingDownload))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingDownload $settingDownload)
    {
        abort_if(Gate::denies('setting_download_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingDownload->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
