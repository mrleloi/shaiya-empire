<?php

namespace App\Http\Requests;

use App\Models\GuideRule;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreGuideRuleRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('guide_rule_create');
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
            'play_nice_policies_title' => [
                'string',
                'nullable',
            ],
            'tos_title' => [
                'string',
                'nullable',
            ],
            'agreement_title' => [
                'string',
                'nullable',
            ],
        ];
    }
}
