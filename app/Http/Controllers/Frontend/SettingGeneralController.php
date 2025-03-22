<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingGeneralRequest;
use App\Http\Requests\StoreSettingGeneralRequest;
use App\Http\Requests\UpdateSettingGeneralRequest;
use App\Models\SettingGeneral;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class SettingGeneralController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_general_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingGenerals = SettingGeneral::with(['media'])->get();

        return view('frontend.settingGenerals.index', compact('settingGenerals'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_general_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingGenerals.create');
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

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingGeneral->id]);
        }

        return redirect()->route('frontend.setting-generals.index');
    }

    public function edit(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingGenerals.edit', compact('settingGeneral'));
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

        return redirect()->route('frontend.setting-generals.index');
    }

    public function show(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingGenerals.show', compact('settingGeneral'));
    }

    public function destroy(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingGeneral->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingGeneralRequest $request)
    {
        $settingGenerals = SettingGeneral::find(request('ids'));

        foreach ($settingGenerals as $settingGeneral) {
            $settingGeneral->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_general_create') && Gate::denies('setting_general_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingGeneral();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
