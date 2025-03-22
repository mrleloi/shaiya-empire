<?php

namespace App\Http\Requests;

use App\Models\GuideDroplist;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreGuideDroplistRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('guide_droplist_create');
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
