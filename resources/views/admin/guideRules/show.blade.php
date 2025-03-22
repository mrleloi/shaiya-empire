@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.show') }} {{ trans('cruds.guideRule.title') }}
        </div>

        <div class="card-body">
            <div class="form-group">
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.guide-rules.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.id') }}
                        </th>
                        <td>
                            {{ $guideRule->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.title') }}
                        </th>
                        <td>
                            {{ $guideRule->title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.header') }}
                        </th>
                        <td>
                            {{ $guideRule->header }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.play_nice_policies_title') }}
                        </th>
                        <td>
                            {{ $guideRule->play_nice_policies_title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.play_nice_policies_content') }}
                        </th>
                        <td>
                            {!! $guideRule->play_nice_policies_content !!}
                        </td>
                    </tr>
                    {{--<tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.tos_title') }}
                        </th>
                        <td>
                            {{ $guideRule->tos_title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.tos_content') }}
                        </th>
                        <td>
                            {!! $guideRule->tos_content !!}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.agreement_title') }}
                        </th>
                        <td>
                            {{ $guideRule->agreement_title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideRule.fields.agreement_content') }}
                        </th>
                        <td>
                            {!! $guideRule->agreement_content !!}
                        </td>
                    </tr>--}}
                    </tbody>
                </table>
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.guide-rules.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
            </div>
        </div>
    </div>



@endsection
