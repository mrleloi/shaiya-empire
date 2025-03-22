<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingDonateRequest;
use App\Http\Requests\StoreSettingDonateRequest;
use App\Http\Requests\UpdateSettingDonateRequest;
use App\Models\SettingDonate;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class SettingDonateController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_donate_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingDonates = SettingDonate::all();

        return view('frontend.settingDonates.index', compact('settingDonates'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_donate_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingDonates.create');
    }

    public function store(StoreSettingDonateRequest $request)
    {
        $settingDonate = SettingDonate::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingDonate->id]);
        }

        return redirect()->route('frontend.setting-donates.index');
    }

    public function edit(SettingDonate $settingDonate)
    {
        abort_if(Gate::denies('setting_donate_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingDonates.edit', compact('settingDonate'));
    }

    public function update(UpdateSettingDonateRequest $request, SettingDonate $settingDonate)
    {
        $settingDonate->update($request->all());

        return redirect()->route('frontend.setting-donates.index');
    }

    public function show(SettingDonate $settingDonate)
    {
        abort_if(Gate::denies('setting_donate_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingDonates.show', compact('settingDonate'));
    }

    public function destroy(SettingDonate $settingDonate)
    {
        abort_if(Gate::denies('setting_donate_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingDonate->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingDonateRequest $request)
    {
        $settingDonates = SettingDonate::find(request('ids'));

        foreach ($settingDonates as $settingDonate) {
            $settingDonate->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_donate_create') && Gate::denies('setting_donate_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingDonate();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
