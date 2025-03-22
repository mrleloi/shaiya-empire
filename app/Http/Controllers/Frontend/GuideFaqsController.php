<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyGuideFaqRequest;
use App\Http\Requests\StoreGuideFaqRequest;
use App\Http\Requests\UpdateGuideFaqRequest;
use App\Models\GuideFaq;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class GuideFaqsController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('guide_faq_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideFaqs = GuideFaq::all();

        return view('frontend.guideFaqs.index', compact('guideFaqs'));
    }

    public function create()
    {
        abort_if(Gate::denies('guide_faq_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideFaqs.create');
    }

    public function store(StoreGuideFaqRequest $request)
    {
        $guideFaq = GuideFaq::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $guideFaq->id]);
        }

        return redirect()->route('frontend.guide-faqs.index');
    }

    public function edit(GuideFaq $guideFaq)
    {
        abort_if(Gate::denies('guide_faq_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideFaqs.edit', compact('guideFaq'));
    }

    public function update(UpdateGuideFaqRequest $request, GuideFaq $guideFaq)
    {
        $guideFaq->update($request->all());

        return redirect()->route('frontend.guide-faqs.index');
    }

    public function show(GuideFaq $guideFaq)
    {
        abort_if(Gate::denies('guide_faq_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.guideFaqs.show', compact('guideFaq'));
    }

    public function destroy(GuideFaq $guideFaq)
    {
        abort_if(Gate::denies('guide_faq_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideFaq->delete();

        return back();
    }

    public function massDestroy(MassDestroyGuideFaqRequest $request)
    {
        $guideFaqs = GuideFaq::find(request('ids'));

        foreach ($guideFaqs as $guideFaq) {
            $guideFaq->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('guide_faq_create') && Gate::denies('guide_faq_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new GuideFaq();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
