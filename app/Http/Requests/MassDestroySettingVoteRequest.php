<?php

namespace App\Http\Requests;

use App\Models\SettingVote;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroySettingVoteRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('setting_vote_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:setting_votes,id',
        ];
    }
}
