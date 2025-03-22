<?php

namespace App\Http\Requests;

use App\Models\SettingDonate;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreSettingDonateRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_donate_create');
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
