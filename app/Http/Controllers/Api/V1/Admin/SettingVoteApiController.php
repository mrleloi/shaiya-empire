<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\StoreSettingVoteRequest;
use App\Http\Requests\UpdateSettingVoteRequest;
use App\Http\Resources\Admin\SettingVoteResource;
use App\Models\SettingVote;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingVoteApiController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_vote_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingVoteResource(SettingVote::all());
    }

    public function store(StoreSettingVoteRequest $request)
    {
        $settingVote = SettingVote::create($request->all());

        return (new SettingVoteResource($settingVote))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(SettingVote $settingVote)
    {
        abort_if(Gate::denies('setting_vote_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new SettingVoteResource($settingVote);
    }

    public function update(UpdateSettingVoteRequest $request, SettingVote $settingVote)
    {
        $settingVote->update($request->all());

        return (new SettingVoteResource($settingVote))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(SettingVote $settingVote)
    {
        abort_if(Gate::denies('setting_vote_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingVote->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
