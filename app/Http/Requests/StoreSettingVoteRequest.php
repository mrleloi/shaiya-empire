<?php

namespace App\Http\Requests;

use App\Models\SettingVote;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreSettingVoteRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_vote_create');
    }

    public function rules()
    {
        return [
            'title' => [
                'string',
                'nullable',
            ],
            'header' => [
                'string',
                'nullable',
            ],
        ];
    }
}
