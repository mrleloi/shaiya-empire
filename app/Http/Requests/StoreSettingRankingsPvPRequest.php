<?php

namespace App\Http\Requests;

use App\Models\SettingRankingsPvP;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreSettingRankingsPvPRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_rankings_pv_p_create');
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
            'num_display' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
        ];
    }
}
