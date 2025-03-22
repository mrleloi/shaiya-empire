<?php

namespace App\Http\Requests;

use App\Models\GuideFaq;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreGuideFaqRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('guide_faq_create');
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
