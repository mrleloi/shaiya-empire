<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingItemMallRequest;
use App\Http\Requests\UpdateSettingItemMallRequest;
use App\Http\Resources\Admin\SettingItemMallResource;
use App\Models\SettingItemMall;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingItemMallApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_item_mall_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingItemMallResource(SettingItemMall::all());
    }

    public function store(StoreSettingItemMallRequest $request)
    {
        $settingItemMall = SettingItemMall::create($request->all());

        return (new SettingItemMallResource($settingItemMall))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingItemMallResource($settingItemMall);
    }

    public function update(UpdateSettingItemMallRequest $request, SettingItemMall $settingItemMall)
    {
        $settingItemMall->update($request->all());

        return (new SettingItemMallResource($settingItemMall))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingItemMall->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
