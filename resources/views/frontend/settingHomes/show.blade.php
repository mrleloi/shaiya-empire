@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.settingHome.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-homes.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $settingHome->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.logo') }}
                                    </th>
                                    <td>
                                        @if($settingHome->logo)
                                            <a href="{{ $settingHome->logo->getUrl() }}" target="_blank" style="display: inline-block">
                                                <img src="{{ $settingHome->logo->getUrl('thumb') }}">
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.slide_images') }}
                                    </th>
                                    <td>
                                        @foreach($settingHome->slide_images as $key => $media)
                                            <a href="{{ $media->getUrl() }}" target="_blank" style="display: inline-block">
                                                <img src="{{ $media->getUrl('thumb') }}">
                                            </a>
                                        @endforeach
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $settingHome->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.header') }}
                                    </th>
                                    <td>
                                        {{ $settingHome->header }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.events_title') }}
                                    </th>
                                    <td>
                                        {{ $settingHome->events_title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.events_content') }}
                                    </th>
                                    <td>
                                        {!! $settingHome->events_content !!}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.announcement_title') }}
                                    </th>
                                    <td>
                                        {{ $settingHome->announcement_title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.announcement_content') }}
                                    </th>
                                    <td>
                                        {!! $settingHome->announcement_content !!}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingHome.fields.content_server_info') }}
                                    </th>
                                    <td>
                                        {!! $settingHome->content_server_info !!}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-homes.index') }}">
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
