@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.show') }} {{ trans('cruds.settingGeneral.title') }}
        </div>

        <div class="card-body">
            <div class="form-group">
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.setting-generals.index') }}">
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
                                    <img src="{{ $settingGeneral->icon->thumbnail }}">
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
                                    <img src="{{ $settingGeneral->background->thumbnail }}">
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

                    <tr>
                        <th>
                            Video chính
                        </th>
                        <td>
                            @if($settingGeneral->video_url)
                                <div class="mb-3">
                                    <strong>URL:</strong>
                                    <a href="{{ $settingGeneral->video_url }}" target="_blank">
                                        {{ $settingGeneral->video_url }}
                                    </a>
                                </div>

                                @if($settingGeneral->getVideoThumbnail())
                                    <div class="mt-2">
                                        <strong>Thumbnail:</strong><br>
                                        <img src="{{ $settingGeneral->getVideoThumbnail() }}" style="max-width: 300px; margin-top: 5px;">
                                    </div>
                                @endif
                            @else
                                <em>Chưa thiết lập</em>
                            @endif
                        </td>
                    </tr>

                    <tr>
                        <th>
                            Ảnh Slider
                        </th>
                        <td>
                            <div class="row">
                                @if($settingGeneral->slides && $settingGeneral->slides->count() > 0)
                                    @foreach($settingGeneral->slides as $index => $slide)
                                        <div class="col-md-4 mb-3">
                                            <div class="card">
                                                <div class="card-body p-1">
                                                    <a href="{{ $slide->getUrl() }}" target="_blank">
                                                        <img src="{{ $slide->getUrl('thumb') }}" class="img-fluid">
                                                    </a>
                                                </div>
                                                <div class="card-footer p-1 text-center">
                                                    <small>Slide {{ $index + 1 }}</small>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="col-md-12">
                                        <em>Chưa có ảnh slider nào</em>
                                    </div>
                                @endif
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            Carousel Videos
                        </th>
                        <td>
                            @if($settingGeneral->carousel_videos && count($settingGeneral->carousel_videos) > 0)
                                <div class="row">
                                    @foreach($settingGeneral->getCarouselVideosWithInfo() as $index => $video)
                                        <div class="col-md-6 mb-3">
                                            <div class="card">
                                                <div class="card-header">
                                                    <strong>Video {{ $index + 1 }}: {{ $video['title'] }}</strong>
                                                </div>
                                                <div class="card-body p-1">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            @if(!empty($video['thumbnail']))
                                                                <img src="{{ $video['thumbnail'] }}" class="img-fluid">
                                                            @endif
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p><strong>URL:</strong> <a href="{{ $video['url'] }}" target="_blank">YouTube</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @else
                                <em>Chưa thiết lập video nào</em>
                            @endif
                        </td>
                    </tr>

                    <tr>
                        <th>
                            Ảnh trang chủ
                        </th>
                        <td>
                            <div class="row">
                                @if($settingGeneral->screenshots && $settingGeneral->screenshots->count() > 0)
                                    @foreach($settingGeneral->screenshots as $index => $screenshot)
                                        <div class="col-md-4 mb-3">
                                            <div class="card">
                                                <div class="card-body p-1">
                                                    <a href="{{ $screenshot->getUrl() }}" target="_blank">
                                                        <img src="{{ $screenshot->getUrl('thumb') }}" class="img-fluid">
                                                    </a>
                                                </div>
                                                <div class="card-footer p-1 text-center">
                                                    <small>Ảnh {{ $index + 1 }}</small>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="col-md-12">
                                        <em>Chưa có ảnh trang chủ nào</em>
                                    </div>
                                @endif
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.setting-generals.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
            </div>
        </div>
    </div>

@endsection
