<?php

namespace App\Http\Controllers\Admin;

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
use Yajra\DataTables\Facades\DataTables;

class SettingItemMallController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_item_mall_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingItemMall::query()->select(sprintf('%s.*', (new SettingItemMall)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_item_mall_show';
                $editGate      = 'setting_item_mall_edit';
                $deleteGate    = 'setting_item_mall_delete';
                $crudRoutePart = 'setting-item-malls';

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

        return view('admin.settingItemMalls.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_item_mall_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingItemMalls.create');
    }

    public function store(StoreSettingItemMallRequest $request)
    {
        $settingItemMall = SettingItemMall::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingItemMall->id]);
        }

        return redirect()->route('admin.setting-item-malls.index');
    }

    public function edit(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingItemMalls.edit', compact('settingItemMall'));
    }

    public function update(UpdateSettingItemMallRequest $request, SettingItemMall $settingItemMall)
    {
        $settingItemMall->update($request->all());

        return redirect()->route('admin.setting-item-malls.index');
    }

    public function show(SettingItemMall $settingItemMall)
    {
        abort_if(Gate::denies('setting_item_mall_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingItemMalls.show', compact('settingItemMall'));
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
