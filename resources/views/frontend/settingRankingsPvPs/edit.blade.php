@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.edit') }} {{ trans('cruds.settingRankingsPvP.title_singular') }}
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route("frontend.setting-rankings-pv-ps.update", [$settingRankingsPvP->id]) }}" enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="title">{{ trans('cruds.settingRankingsPvP.fields.title') }}</label>
                                <input class="form-control" type="text" name="title" id="title" value="{{ old('title', $settingRankingsPvP->title) }}">
                                @if($errors->has('title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingRankingsPvP.fields.title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="header">{{ trans('cruds.settingRankingsPvP.fields.header') }}</label>
                                <input class="form-control" type="text" name="header" id="header" value="{{ old('header', $settingRankingsPvP->header) }}">
                                @if($errors->has('header'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('header') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingRankingsPvP.fields.header_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="num_display">{{ trans('cruds.settingRankingsPvP.fields.num_display') }}</label>
                                <input class="form-control" type="number" name="num_display" id="num_display" value="{{ old('num_display', $settingRankingsPvP->num_display) }}" step="1">
                                @if($errors->has('num_display'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('num_display') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingRankingsPvP.fields.num_display_helper') }}</span>
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
