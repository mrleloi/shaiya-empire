<?php

namespace App\Http\Requests;

use App\Models\SettingBossRecord;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroySettingBossRecordRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('setting_boss_record_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:setting_boss_records,id',
        ];
    }
}
