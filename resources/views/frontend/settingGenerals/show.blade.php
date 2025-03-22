@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.settingGeneral.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-generals.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.icon') }}
                                    </th>
                                    <td>
                                        @if($settingGeneral->icon)
                                            <a href="{{ $settingGeneral->icon->getUrl() }}" target="_blank" style="display: inline-block">
                                                <img src="{{ $settingGeneral->icon->getUrl('thumb') }}">
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.background') }}
                                    </th>
                                    <td>
                                        @if($settingGeneral->background)
                                            <a href="{{ $settingGeneral->background->getUrl() }}" target="_blank" style="display: inline-block">
                                                <img src="{{ $settingGeneral->background->getUrl('thumb') }}">
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.url_facebook') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->url_facebook }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.url_discord') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->url_discord }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.meta_des') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->meta_des }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingGeneral.fields.meta_keyword') }}
                                    </th>
                                    <td>
                                        {{ $settingGeneral->meta_keyword }}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-generals.index') }}">
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
