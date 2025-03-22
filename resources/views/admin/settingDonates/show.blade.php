@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.show') }} {{ trans('cruds.settingDonate.title') }}
        </div>

        <div class="card-body">
            <div class="form-group">
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.setting-donates.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.settingDonate.fields.id') }}
                        </th>
                        <td>
                            {{ $settingDonate->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.settingDonate.fields.title') }}
                        </th>
                        <td>
                            {{ $settingDonate->title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.settingDonate.fields.header') }}
                        </th>
                        <td>
                            {{ $settingDonate->header }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.settingDonate.fields.content') }}
                        </th>
                        <td>
                            {!! $settingDonate->content !!}
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.setting-donates.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
            </div>
        </div>
    </div>



@endsection
