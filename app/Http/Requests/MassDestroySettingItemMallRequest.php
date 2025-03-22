<?php

namespace App\Http\Requests;

use App\Models\SettingItemMall;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroySettingItemMallRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('setting_item_mall_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:setting_item_malls,id',
        ];
    }
}
