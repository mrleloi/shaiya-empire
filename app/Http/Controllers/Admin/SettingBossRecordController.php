<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingBossRecordRequest;
use App\Http\Requests\StoreSettingBossRecordRequest;
use App\Http\Requests\UpdateSettingBossRecordRequest;
use App\Models\SettingBossRecord;
use App\Models\SettingDonate;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingBossRecordController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_boss_record_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingBossRecord::query()->select(sprintf('%s.*', (new SettingBossRecord)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_boss_record_show';
                $editGate      = 'setting_boss_record_edit';
                $deleteGate    = 'setting_boss_record_delete';
                $crudRoutePart = 'setting-boss-records';

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

        return view('admin.settingBossRecords.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_boss_record_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingBossRecords.create');
    }

    public function store(StoreSettingBossRecordRequest $request)
    {
        $settingBossRecord = SettingBossRecord::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingBossRecord->id]);
        }

        return redirect()->route('admin.setting-boss-records.index');
    }

    public function edit(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingBossRecords.edit', compact('settingBossRecord'));
    }

    public function update(UpdateSettingBossRecordRequest $request, SettingBossRecord $settingBossRecord)
    {
        $settingBossRecord->update($request->all());

        return redirect()->route('admin.setting-boss-records.index');
    }

    public function show(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingBossRecords.show', compact('settingBossRecord'));
    }

    public function destroy(SettingBossRecord $settingBossRecord)
    {
        abort_if(Gate::denies('setting_boss_record_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingBossRecord->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingBossRecordRequest $request)
    {
        $settingBossRecords = SettingBossRecord::find(request('ids'));

        foreach ($settingBossRecords as $settingBossRecord) {
            $settingBossRecord->delete();
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
