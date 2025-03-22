<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingDownloadRequest;
use App\Http\Requests\StoreSettingDownloadRequest;
use App\Http\Requests\UpdateSettingDownloadRequest;
use App\Models\SettingDownload;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingDownloadController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_download_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingDownload::query()->select(sprintf('%s.*', (new SettingDownload)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_download_show';
                $editGate      = 'setting_download_edit';
                $deleteGate    = 'setting_download_delete';
                $crudRoutePart = 'setting-downloads';

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

        return view('admin.settingDownloads.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_download_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingDownloads.create');
    }

    public function store(StoreSettingDownloadRequest $request)
    {
        $settingDownload = SettingDownload::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingDownload->id]);
        }

        return redirect()->route('admin.setting-downloads.index');
    }

    public function edit(SettingDownload $settingDownload)
    {
        abort_if(Gate::denies('setting_download_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingDownloads.edit', compact('settingDownload'));
    }

    public function update(UpdateSettingDownloadRequest $request, SettingDownload $settingDownload)
    {
        $settingDownload->update($request->all());

        return redirect()->route('admin.setting-downloads.index');
    }

    public function show(SettingDownload $settingDownload)
    {
        abort_if(Gate::denies('setting_download_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingDownloads.show', compact('settingDownload'));
    }

    public function destroy(SettingDownload $settingDownload)
    {
        abort_if(Gate::denies('setting_download_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingDownload->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingDownloadRequest $request)
    {
        $settingDownloads = SettingDownload::find(request('ids'));

        foreach ($settingDownloads as $settingDownload) {
            $settingDownload->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_download_create') && Gate::denies('setting_download_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingDownload();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
