<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreGuideDroplistRequest;
use App\Http\Requests\UpdateGuideDroplistRequest;
use App\Http\Resources\Admin\GuideDroplistResource;
use App\Models\GuideDroplist;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class GuideDroplistApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('guide_droplist_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideDroplistResource(GuideDroplist::all());
    }

    public function store(StoreGuideDroplistRequest $request)
    {
        $guideDroplist = GuideDroplist::create($request->all());

        return (new GuideDroplistResource($guideDroplist))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideDroplistResource($guideDroplist);
    }

    public function update(UpdateGuideDroplistRequest $request, GuideDroplist $guideDroplist)
    {
        $guideDroplist->update($request->all());

        return (new GuideDroplistResource($guideDroplist))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(GuideDroplist $guideDroplist)
    {
        abort_if(Gate::denies('guide_droplist_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideDroplist->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
