<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreGuideFaqRequest;
use App\Http\Requests\UpdateGuideFaqRequest;
use App\Http\Resources\Admin\GuideFaqResource;
use App\Models\GuideFaq;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class GuideFaqsApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('guide_faq_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideFaqResource(GuideFaq::all());
    }

    public function store(StoreGuideFaqRequest $request)
    {
        $guideFaq = GuideFaq::create($request->all());

        return (new GuideFaqResource($guideFaq))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(GuideFaq $guideFaq)
    {
        abort_if(Gate::denies('guide_faq_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideFaqResource($guideFaq);
    }

    public function update(UpdateGuideFaqRequest $request, GuideFaq $guideFaq)
    {
        $guideFaq->update($request->all());

        return (new GuideFaqResource($guideFaq))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(GuideFaq $guideFaq)
    {
        abort_if(Gate::denies('guide_faq_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideFaq->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
