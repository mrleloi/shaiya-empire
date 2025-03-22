<?php

namespace App\Http\Requests;

use App\Models\GameUser;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateGameUserRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('game_user_edit');
    }

    public function rules()
    {
        return [
            'useruid' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'userid' => [
                'string',
                'nullable',
            ],
            'joindate' => [
                'date_format:' . config('panel.date_format') . ' ' . config('panel.time_format'),
                'nullable',
            ],
            'admin' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'adminlevel' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'usequeue' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'status' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'leave' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'leavedate' => [
                'date_format:' . config('panel.date_format') . ' ' . config('panel.time_format'),
                'nullable',
            ],
            'usertype' => [
                'string',
                'nullable',
            ],
            'userip' => [
                'string',
                'nullable',
            ],
            'modiip' => [
                'string',
                'nullable',
            ],
            'modidate' => [
                'date_format:' . config('panel.date_format') . ' ' . config('panel.time_format'),
                'nullable',
            ],
            'point' => [
                'nullable',
                'integer',
                'min:-2147483648',
                'max:2147483647',
            ],
            'enpassword' => [
                'string',
                'nullable',
            ],
            'birth' => [
                'string',
                'nullable',
            ],
            'email' => [
                'string',
                'nullable',
            ],
        ];
    }
}
