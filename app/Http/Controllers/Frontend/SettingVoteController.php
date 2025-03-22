<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroySettingVoteRequest;
use App\Http\Requests\StoreSettingVoteRequest;
use App\Http\Requests\UpdateSettingVoteRequest;
use App\Models\SettingVote;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class SettingVoteController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('setting_vote_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingVotes = SettingVote::all();

        return view('frontend.settingVotes.index', compact('settingVotes'));
    }

    public function create()
    {
        abort_if(Gate::denies('setting_vote_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingVotes.create');
    }

    public function store(StoreSettingVoteRequest $request)
    {
        $settingVote = SettingVote::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $settingVote->id]);
        }

        return redirect()->route('frontend.setting-votes.index');
    }

    public function edit(SettingVote $settingVote)
    {
        abort_if(Gate::denies('setting_vote_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingVotes.edit', compact('settingVote'));
    }

    public function update(UpdateSettingVoteRequest $request, SettingVote $settingVote)
    {
        $settingVote->update($request->all());

        return redirect()->route('frontend.setting-votes.index');
    }

    public function show(SettingVote $settingVote)
    {
        abort_if(Gate::denies('setting_vote_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.settingVotes.show', compact('settingVote'));
    }

    public function destroy(SettingVote $settingVote)
    {
        abort_if(Gate::denies('setting_vote_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $settingVote->delete();

        return back();
    }

    public function massDestroy(MassDestroySettingVoteRequest $request)
    {
        $settingVotes = SettingVote::find(request('ids'));

        foreach ($settingVotes as $settingVote) {
            $settingVote->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('setting_vote_create') && Gate::denies('setting_vote_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new SettingVote();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
