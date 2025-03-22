<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingHomeRequest;
use App\Http\Requests\StoreSettingHomeRequest;
use App\Http\Requests\UpdateSettingHomeRequest;
use App\Models\SettingHome;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class SettingHomeController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_home_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingHome::query()->select(sprintf('%s.*', (new SettingHome)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_home_show';
                $editGate      = 'setting_home_edit';
                $deleteGate    = 'setting_home_delete';
                $crudRoutePart = 'setting-homes';

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
            $table->editColumn('logo', function ($row) {
                if ($photo = $row->logo) {
                    return sprintf(
                        '<a href="%s" target="_blank"><img src="%s" width="50px" height="50px"></a>',
                        $photo->url,
                        $photo->thumbnail
                    );
                }

                return '';
            });
            /*$table->editColumn('slide_images', function ($row) {
                if (! $row->slide_images) {
                    return '';
                }
                $links = [];
                foreach ($row->slide_images as $media) {
                    $links[] = '<a href="' . $media->url . '" target="_blank"><img src="' . $media->thumbnail . '" width="50px" height="50px"></a>';
                }

                return implode(' ', $links);
            });*/
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : '';
            });
            $table->editColumn('header', function ($row) {
                return $row->header ? $row->header : '';
            });
            $table->editColumn('events_title', function ($row) {
                return $row->events_title ? $row->events_title : '';
            });
            /*$table->editColumn('announcement_title', function ($row) {
                return $row->announcement_title ? $row->announcement_title : '';
            });*/

//            $table->rawColumns(['actions', 'placeholder', 'logo', 'slide_images']);
            $table->rawColumns(['actions', 'placeholder', 'logo']);

            return $table->make(true);
        }

        return view('admin.settingHomes.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_home_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingHomes.create');
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

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingHome->id]);
        }

        return redirect()->route('admin.setting-homes.index');
    }

    public function edit(SettingHome $settingHome)
    {
        abort_if(Gate::denies('setting_home_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingHomes.edit', compact('settingHome'));
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
        }*/
        /*$media = $settingHome->slide_images->pluck('file_name')->toArray();
        foreach ($request->input('slide_images', []) as $file) {
            if (count($media) === 0 || ! in_array($file, $media)) {
                $settingHome->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('slide_images');
            }
        }*/

        return redirect()->route('admin.setting-homes.index');
    }

    public function show(SettingHome $settingHome)
    {
        abort_if(Gate::denies('setting_home_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingHomes.show', compact('settingHome'));
    }

    public function destroy(SettingHome $settingHome)
    {
        abort_if(Gate::denies('setting_home_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingHome->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingHomeRequest $request)
    {
        $settingHomes = SettingHome::find(request('ids'));

        foreach ($settingHomes as $settingHome) {
            $settingHome->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_home_create') && Gate::denies('setting_home_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingHome();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
