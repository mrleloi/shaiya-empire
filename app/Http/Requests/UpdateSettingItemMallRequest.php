<?php

namespace App\Http\Requests;

use App\Models\SettingItemMall;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateSettingItemMallRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_item_mall_edit');
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
