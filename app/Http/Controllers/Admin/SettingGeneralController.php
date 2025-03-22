<?php

namespace App\Http\Controllers\Admin;

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
use Yajra\DataTables\Facades\DataTables;

class SettingGeneralController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('setting_general_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = SettingGeneral::query()->select(sprintf('%s.*', (new SettingGeneral)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'setting_general_show';
                $editGate      = 'setting_general_edit';
                $deleteGate    = 'setting_general_delete';
                $crudRoutePart = 'setting-generals';

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
            $table->editColumn('icon', function ($row) {
                if ($photo = $row->icon) {
                    return sprintf(
                        '<a href="%s" target="_blank"><img src="%s" width="50px" height="50px"></a>',
                        $photo->url,
                        $photo->thumbnail
                    );
                }

                return '';
            });
            $table->editColumn('background', function ($row) {
                if ($photo = $row->background) {
                    return sprintf(
                        '<a href="%s" target="_blank"><img src="%s" width="50px" height="50px"></a>',
                        $photo->url,
                        $photo->thumbnail
                    );
                }

                return '';
            });
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : '';
            });
            $table->editColumn('url_facebook', function ($row) {
                return $row->url_facebook ? $row->url_facebook : '';
            });
            $table->editColumn('url_discord', function ($row) {
                return $row->url_discord ? $row->url_discord : '';
            });
            $table->editColumn('meta_des', function ($row) {
                return $row->meta_des ? $row->meta_des : '';
            });
            $table->editColumn('meta_keyword', function ($row) {
                return $row->meta_keyword ? $row->meta_keyword : '';
            });
            $table->editColumn('video_url', function ($row) {
                return $row->video_url ? $row->video_url : '';
            });
            $table->editColumn('slides', function ($row) {
                if (!$row->slides) {
                    return '';
                }
                $links = [];
                foreach ($row->slides as $media) {
                    $links[] = '<a href="' . $media->getUrl() . '" target="_blank"><img src="' . $media->getUrl('thumb') . '" width="50px" height="50px"></a>';
                }

                return implode(' ', $links);
            });
            $table->editColumn('screenshots', function ($row) {
                if (!$row->screenshots) {
                    return '';
                }
                $links = [];
                foreach ($row->screenshots as $media) {
                    $links[] = '<a href="' . $media->getUrl() . '" target="_blank"><img src="' . $media->getUrl('thumb') . '" width="50px" height="50px"></a>';
                }

                return implode(' ', $links);
            });
            $table->editColumn('carousel_videos', function ($row) {
                return $row->carousel_videos ? count($row->carousel_videos) . ' videos' : '0 videos';
            });

            $table->rawColumns(['actions', 'placeholder', 'icon', 'background', 'slides', 'screenshots']);

            return $table->make(true);
        }

        return view('admin.settingGenerals.index');
    }

    public function create()
    {
        abort_if(Gate::denies('setting_general_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingGenerals.create');
    }

    public function store(StoreSettingGeneralRequest $request)
    {
        // Xử lý các video carousel
        $carouselVideos = [];
        if ($request->has('carousel_videos') && is_array($request->carousel_videos)) {
            foreach ($request->carousel_videos as $video) {
                if (!empty($video['url'])) {
                    $carouselVideos[] = [
                        'url' => $video['url'],
                        'title' => $video['title'] ?? '',
                        'thumbnail' => $video['thumbnail'] ?? ''
                    ];
                }
            }
        }

        $data = $request->all();
        $data['carousel_videos'] = $carouselVideos;

        $settingGeneral = SettingGeneral::create($data);

        if ($request->input('icon', false)) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('icon'))))->toMediaCollection('icon');
        }

        if ($request->input('background', false)) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($request->input('background'))))->toMediaCollection('background');
        }

        foreach ($request->input('screenshots', []) as $file) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('screenshots');
        }

        foreach ($request->input('slides', []) as $file) {
            $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('slides');
        }

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingGeneral->id]);
        }

        return redirect()->route('admin.setting-generals.index');
    }

    public function edit(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingGenerals.edit', compact('settingGeneral'));
    }

    public function update(UpdateSettingGeneralRequest $request, SettingGeneral $settingGeneral)
    {
        // Xử lý các video carousel
        $carouselVideos = [];
        if ($request->has('carousel_videos') && is_array($request->carousel_videos)) {
            foreach ($request->carousel_videos as $video) {
                if (!empty($video['url'])) {
                    $carouselVideos[] = [
                        'url' => $video['url'],
                        'title' => $video['title'] ?? '',
                        'thumbnail' => $video['thumbnail'] ?? ''
                    ];
                }
            }
        }

        $data = $request->all();
        $data['carousel_videos'] = $carouselVideos;

        $settingGeneral->update($data);

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

        // Screenshots management
        if (count($settingGeneral->screenshots) > 0) {
            foreach ($settingGeneral->screenshots as $media) {
                if (!in_array($media->file_name, $request->input('screenshots', []))) {
                    $media->delete();
                }
            }
        }

        $media = $settingGeneral->screenshots->pluck('file_name')->toArray();

        foreach ($request->input('screenshots', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('screenshots');
            }
        }

        // Slides management
        if (count($settingGeneral->slides) > 0) {
            foreach ($settingGeneral->slides as $media) {
                if (!in_array($media->file_name, $request->input('slides', []))) {
                    $media->delete();
                }
            }
        }

        $media = $settingGeneral->slides->pluck('file_name')->toArray();

        foreach ($request->input('slides', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $settingGeneral->addMedia(storage_path('tmp/uploads/' . basename($file)))->toMediaCollection('slides');
            }
        }

        return redirect()->route('admin.setting-generals.index');
    }

    public function show(SettingGeneral $settingGeneral)
    {
        abort_if(Gate::denies('setting_general_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.settingGenerals.show', compact('settingGeneral'));
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
