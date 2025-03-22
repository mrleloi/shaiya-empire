<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreGuideRuleRequest;
use App\Http\Requests\UpdateGuideRuleRequest;
use App\Http\Resources\Admin\GuideRuleResource;
use App\Models\GuideRule;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class GuideRulesApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('guide_rule_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideRuleResource(GuideRule::all());
    }

    public function store(StoreGuideRuleRequest $request)
    {
        $guideRule = GuideRule::create($request->all());

        return (new GuideRuleResource($guideRule))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(GuideRule $guideRule)
    {
        abort_if(Gate::denies('guide_rule_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GuideRuleResource($guideRule);
    }

    public function update(UpdateGuideRuleRequest $request, GuideRule $guideRule)
    {
        $guideRule->update($request->all());

        return (new GuideRuleResource($guideRule))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(GuideRule $guideRule)
    {
        abort_if(Gate::denies('guide_rule_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideRule->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
