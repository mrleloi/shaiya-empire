@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.settingRankingsPvP.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.setting-rankings-pv-ps.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="title">{{ trans('cruds.settingRankingsPvP.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}">
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingRankingsPvP.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="header">{{ trans('cruds.settingRankingsPvP.fields.header') }}</label>
                    <input class="form-control {{ $errors->has('header') ? 'is-invalid' : '' }}" type="text" name="header" id="header" value="{{ old('header', '') }}">
                    @if($errors->has('header'))
                        <span class="text-danger">{{ $errors->first('header') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingRankingsPvP.fields.header_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="num_display">{{ trans('cruds.settingRankingsPvP.fields.num_display') }}</label>
                    <input class="form-control {{ $errors->has('num_display') ? 'is-invalid' : '' }}" type="number" name="num_display" id="num_display" value="{{ old('num_display', '20') }}" step="1">
                    @if($errors->has('num_display'))
                        <span class="text-danger">{{ $errors->first('num_display') }}</span>
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



@endsection
