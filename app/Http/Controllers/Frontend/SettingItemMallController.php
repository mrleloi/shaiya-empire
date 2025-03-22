<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingItemMallRequest;
use App\Http\Requests\StoreSettingItemMallRequest;
use App\Http\Requests\UpdateSettingItemMallRequest;
use App\Models\SettingItemMall;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class SettingItemMallController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_item_mall_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingItemMalls = SettingItemMall::all();

        return view('frontend.settingItemMalls.index', compact('settingItemMalls'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_item_mall_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingItemMalls.create');
    }

    public function store(StoreSettingItemMallRequest $request)
    {
        $settingItemMall = SettingItemMall::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingItemMall->id]);
        }

        return redirect()->route('frontend.setting-item-malls.index');
    }

    public function edit(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingItemMalls.edit', compact('settingItemMall'));
    }

    public function update(UpdateSettingItemMallRequest $request, SettingItemMall $settingItemMall)
    {
        $settingItemMall->update($request->all());

        return redirect()->route('frontend.setting-item-malls.index');
    }

    public function show(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingItemMalls.show', compact('settingItemMall'));
    }

    public function destroy(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingItemMall->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingItemMallRequest $request)
    {
        $settingItemMalls = SettingItemMall::find(request('ids'));

        foreach ($settingItemMalls as $settingItemMall) {
            $settingItemMall->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_item_mall_create') && Gate::denies('setting_item_mall_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingItemMall();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
