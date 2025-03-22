<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingMediumRequest;
use App\Http\Requests\StoreSettingMediumRequest;
use App\Http\Requests\UpdateSettingMediumRequest;
use App\Models\SettingMedium;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingMediaController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_medium_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingMedium::query()->select(sprintf('%s.*', (new SettingMedium)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_medium_show';
                $editGate      = 'setting_medium_edit';
                $deleteGate    = 'setting_medium_delete';
                $crudRoutePart = 'setting-media';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : '';
            });
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : '';
            });
            $table->editColumn('header', function ($row) {
                return $row->header ? $row->header : '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('admin.settingMedia.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_medium_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingMedia.create');
    }

    public function store(StoreSettingMediumRequest $request)
    {
        $settingMedium = SettingMedium::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingMedium->id]);
        }

        return redirect()->route('admin.setting-media.index');
    }

    public function edit(SettingMedium $settingMedium)
    {
        abort_if(Gate::denies('setting_medium_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingMedia.edit', compact('settingMedium'));
    }

    public function update(UpdateSettingMediumRequest $request, SettingMedium $settingMedium)
    {
        $settingMedium->update($request->all());

        return redirect()->route('admin.setting-media.index');
    }

    public function show(SettingMedium $settingMedium)
    {
        abort_if(Gate::denies('setting_medium_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingMedia.show', compact('settingMedium'));
    }

    public function destroy(SettingMedium $settingMedium)
    {
        abort_if(Gate::denies('setting_medium_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingMedium->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingMediumRequest $request)
    {
        $settingMedia = SettingMedium::find(request('ids'));

        foreach ($settingMedia as $settingMedium) {
            $settingMedium->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_medium_create') && Gate::denies('setting_medium_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingMedium();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
