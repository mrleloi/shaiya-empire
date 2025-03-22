<?php

namespace App\Http\Requests;

use App\Models\SettingRankingsPvP;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroySettingRankingsPvPRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('setting_rankings_pv_p_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:setting_rankings_pv_ps,id',
        ];
    }
}
