<?php

namespace App\Http\Requests;

use App\Models\GameUser;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroyGameUserRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('game_user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:game_users,id',
        ];
    }
}
