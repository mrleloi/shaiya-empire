<?php

namespace App\Http\Requests;

use App\Models\GuideFaq;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroyGuideFaqRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('guide_faq_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:guide_faqs,id',
        ];
    }
}
