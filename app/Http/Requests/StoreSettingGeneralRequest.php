<?php

namespace App\Http\Requests;

use App\Models\SettingGeneral;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreSettingGeneralRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_general_create');
    }

    public function rules()
    {
        return [
            'title' => [
                'string',
                'required',
            ],
            'url_facebook' => [
                'string',
                'nullable',
            ],
            'url_discord' => [
                'string',
                'nullable',
            ],
            'meta_des' => [
                'string',
                'nullable',
            ],
            'meta_keyword' => [
                'string',
                'nullable',
            ],
            'video_url' => [
                'string',
                'nullable',
                'url',
            ],
            'video_thumbnail' => [
                'string',
                'nullable',
                'url',
            ],
            'image_1' => [
                'string',
                'nullable',
            ],
            'image_2' => [
                'string',
                'nullable',
            ],
            'image_3' => [
                'string',
                'nullable',
            ],
            'image_4' => [
                'string',
                'nullable',
            ],
            'image_5' => [
                'string',
                'nullable',
            ],
            'image_6' => [
                'string',
                'nullable',
            ],
            'image_7' => [
                'string',
                'nullable',
            ],
            'image_8' => [
                'string',
                'nullable',
            ],
            'image_9' => [
                'string',
                'nullable',
            ],
            'image_10' => [
                'string',
                'nullable',
            ],
        ];
    }
}
