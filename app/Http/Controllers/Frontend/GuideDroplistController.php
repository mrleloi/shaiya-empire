<?php

namespace App\Http\Controllers\Frontend;

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

class GuideDroplistController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('guide_droplist_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideDroplists = GuideDroplist::all();

        return view('frontend.guideDroplists.index', compact('guideDroplists'));
    }

    public function create()
    {
        abort_if(Gate::denies('guide_droplist_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideDroplists.create');
    }

    public function store(StoreGuideDroplistRequest $request)
    {
        $guideDroplist = GuideDroplist::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $guideDroplist->id]);
        }

        return redirect()->route('frontend.guide-droplists.index');
    }

    public function edit(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideDroplists.edit', compact('guideDroplist'));
    }

    public function update(UpdateGuideDroplistRequest $request, GuideDroplist $guideDroplist)
    {
        $guideDroplist->update($request->all());

        return redirect()->route('frontend.guide-droplists.index');
    }

    public function show(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideDroplists.show', compact('guideDroplist'));
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
