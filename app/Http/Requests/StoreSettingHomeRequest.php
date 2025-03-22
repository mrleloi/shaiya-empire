<?php

namespace App\Http\Requests;

use App\Models\SettingHome;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreSettingHomeRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_home_create');
    }

    public function rules()
    {
        return [
            /*'slide_images' => [
                'array',
            ],*/
            'title' => [
                'string',
                'nullable',
            ],
            'header' => [
                'string',
                'nullable',
            ],
            'events_title' => [
                'string',
                'nullable',
            ],
            /*'announcement_title' => [
                'string',
                'nullable',
            ],*/
        ];
    }
}
