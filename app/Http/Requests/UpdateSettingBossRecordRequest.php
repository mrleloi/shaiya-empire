<?php

namespace App\Http\Requests;

use App\Models\SettingBossRecord;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateSettingBossRecordRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('setting_boss_record_edit');
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
