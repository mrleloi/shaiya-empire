@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.settingMedium.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-media.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingMedium.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $settingMedium->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingMedium.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $settingMedium->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingMedium.fields.header') }}
                                    </th>
                                    <td>
                                        {{ $settingMedium->header }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingMedium.fields.content') }}
                                    </th>
                                    <td>
                                        {!! $settingMedium->content !!}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-media.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
