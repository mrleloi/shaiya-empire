<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyGuideDroplistRequest;
use App\Http\Requests\StoreGuideDroplistRequest;
use App\Http\Requests\UpdateGuideDroplistRequest;
use App\Models\GuideDroplist;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class GuideDroplistController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('guide_droplist_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = GuideDroplist::query()->select(sprintf('%s.*', (new GuideDroplist)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'guide_droplist_show';
                $editGate      = 'guide_droplist_edit';
                $deleteGate    = 'guide_droplist_delete';
                $crudRoutePart = 'guide-droplists';

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

        return view('admin.guideDroplists.index');
    }

    public function create()
    {
        abort_if(Gate::denies('guide_droplist_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideDroplists.create');
    }

    public function store(StoreGuideDroplistRequest $request)
    {
        $guideDroplist = GuideDroplist::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $guideDroplist->id]);
        }

        return redirect()->route('admin.guide-droplists.index');
    }

    public function edit(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideDroplists.edit', compact('guideDroplist'));
    }

    public function update(UpdateGuideDroplistRequest $request, GuideDroplist $guideDroplist)
    {
        $guideDroplist->update($request->all());

        return redirect()->route('admin.guide-droplists.index');
    }

    public function show(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideDroplists.show', compact('guideDroplist'));
    }

    public function destroy(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideDroplist->delete();

        return back();
    }

    public function massDestroy(MassDestroyGuideDroplistRequest $request)
    {
        $guideDroplists = GuideDroplist::find(request('ids'));

        foreach ($guideDroplists as $guideDroplist) {
            $guideDroplist->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('guide_droplist_create') && Gate::denies('guide_droplist_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new GuideDroplist();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
