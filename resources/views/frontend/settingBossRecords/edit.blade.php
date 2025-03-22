@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.edit') }} {{ trans('cruds.settingBossRecord.title_singular') }}
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route("frontend.setting-boss-records.update", [$settingBossRecord->id]) }}" enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="title">{{ trans('cruds.settingBossRecord.fields.title') }}</label>
                                <input class="form-control" type="text" name="title" id="title" value="{{ old('title', $settingBossRecord->title) }}">
                                @if($errors->has('title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingBossRecord.fields.title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="header">{{ trans('cruds.settingBossRecord.fields.header') }}</label>
                                <input class="form-control" type="text" name="header" id="header" value="{{ old('header', $settingBossRecord->header) }}">
                                @if($errors->has('header'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('header') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingBossRecord.fields.header_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-danger" type="submit">
                                    {{ trans('global.save') }}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
