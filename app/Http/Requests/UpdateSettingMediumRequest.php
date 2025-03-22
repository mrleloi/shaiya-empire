<?php

namespace App\Http\Requests;

use App\Models\SettingMedium;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateSettingMediumRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_medium_edit');
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
