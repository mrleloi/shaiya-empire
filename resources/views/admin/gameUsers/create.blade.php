@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.gameUser.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.game-users.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="useruid">{{ trans('cruds.gameUser.fields.useruid') }}</label>
                    <input class="form-control {{ $errors->has('useruid') ? 'is-invalid' : '' }}" type="number" name="useruid" id="useruid" value="{{ old('useruid', '') }}" step="1">
                    @if($errors->has('useruid'))
                        <span class="text-danger">{{ $errors->first('useruid') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.useruid_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="userid">{{ trans('cruds.gameUser.fields.userid') }}</label>
                    <input class="form-control {{ $errors->has('userid') ? 'is-invalid' : '' }}" type="text" name="userid" id="userid" value="{{ old('userid', '') }}">
                    @if($errors->has('userid'))
                        <span class="text-danger">{{ $errors->first('userid') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.userid_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="pw">{{ trans('cruds.gameUser.fields.pw') }}</label>
                    <input class="form-control {{ $errors->has('pw') ? 'is-invalid' : '' }}" type="password" name="pw" id="pw">
                    @if($errors->has('pw'))
                        <span class="text-danger">{{ $errors->first('pw') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.pw_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="joindate">{{ trans('cruds.gameUser.fields.joindate') }}</label>
                    <input class="form-control datetime {{ $errors->has('joindate') ? 'is-invalid' : '' }}" type="text" name="joindate" id="joindate" value="{{ old('joindate') }}">
                    @if($errors->has('joindate'))
                        <span class="text-danger">{{ $errors->first('joindate') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.joindate_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="admin">{{ trans('cruds.gameUser.fields.admin') }}</label>
                    <input class="form-control {{ $errors->has('admin') ? 'is-invalid' : '' }}" type="number" name="admin" id="admin" value="{{ old('admin', '0') }}" step="1">
                    @if($errors->has('admin'))
                        <span class="text-danger">{{ $errors->first('admin') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.admin_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="adminlevel">{{ trans('cruds.gameUser.fields.adminlevel') }}</label>
                    <input class="form-control {{ $errors->has('adminlevel') ? 'is-invalid' : '' }}" type="number" name="adminlevel" id="adminlevel" value="{{ old('adminlevel', '0') }}" step="1">
                    @if($errors->has('adminlevel'))
                        <span class="text-danger">{{ $errors->first('adminlevel') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.adminlevel_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="usequeue">{{ trans('cruds.gameUser.fields.usequeue') }}</label>
                    <input class="form-control {{ $errors->has('usequeue') ? 'is-invalid' : '' }}" type="number" name="usequeue" id="usequeue" value="{{ old('usequeue', '0') }}" step="1">
                    @if($errors->has('usequeue'))
                        <span class="text-danger">{{ $errors->first('usequeue') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.usequeue_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="status">{{ trans('cruds.gameUser.fields.status') }}</label>
                    <input class="form-control {{ $errors->has('status') ? 'is-invalid' : '' }}" type="number" name="status" id="status" value="{{ old('status', '') }}" step="1">
                    @if($errors->has('status'))
                        <span class="text-danger">{{ $errors->first('status') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.status_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="leave">{{ trans('cruds.gameUser.fields.leave') }}</label>
                    <input class="form-control {{ $errors->has('leave') ? 'is-invalid' : '' }}" type="number" name="leave" id="leave" value="{{ old('leave', '') }}" step="1">
                    @if($errors->has('leave'))
                        <span class="text-danger">{{ $errors->first('leave') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.leave_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="leavedate">{{ trans('cruds.gameUser.fields.leavedate') }}</label>
                    <input class="form-control datetime {{ $errors->has('leavedate') ? 'is-invalid' : '' }}" type="text" name="leavedate" id="leavedate" value="{{ old('leavedate') }}">
                    @if($errors->has('leavedate'))
                        <span class="text-danger">{{ $errors->first('leavedate') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.leavedate_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="usertype">{{ trans('cruds.gameUser.fields.usertype') }}</label>
                    <input class="form-control {{ $errors->has('usertype') ? 'is-invalid' : '' }}" type="text" name="usertype" id="usertype" value="{{ old('usertype', '\'U\'') }}">
                    @if($errors->has('usertype'))
                        <span class="text-danger">{{ $errors->first('usertype') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.usertype_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="userip">{{ trans('cruds.gameUser.fields.userip') }}</label>
                    <input class="form-control {{ $errors->has('userip') ? 'is-invalid' : '' }}" type="text" name="userip" id="userip" value="{{ old('userip', '') }}">
                    @if($errors->has('userip'))
                        <span class="text-danger">{{ $errors->first('userip') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.userip_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="modiip">{{ trans('cruds.gameUser.fields.modiip') }}</label>
                    <input class="form-control {{ $errors->has('modiip') ? 'is-invalid' : '' }}" type="text" name="modiip" id="modiip" value="{{ old('modiip', '') }}">
                    @if($errors->has('modiip'))
                        <span class="text-danger">{{ $errors->first('modiip') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.modiip_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="modidate">{{ trans('cruds.gameUser.fields.modidate') }}</label>
                    <input class="form-control datetime {{ $errors->has('modidate') ? 'is-invalid' : '' }}" type="text" name="modidate" id="modidate" value="{{ old('modidate') }}">
                    @if($errors->has('modidate'))
                        <span class="text-danger">{{ $errors->first('modidate') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.modidate_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="point">{{ trans('cruds.gameUser.fields.point') }}</label>
                    <input class="form-control {{ $errors->has('point') ? 'is-invalid' : '' }}" type="number" name="point" id="point" value="{{ old('point', '') }}" step="1">
                    @if($errors->has('point'))
                        <span class="text-danger">{{ $errors->first('point') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.point_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="enpassword">{{ trans('cruds.gameUser.fields.enpassword') }}</label>
                    <input class="form-control {{ $errors->has('enpassword') ? 'is-invalid' : '' }}" type="text" name="enpassword" id="enpassword" value="{{ old('enpassword', '') }}">
                    @if($errors->has('enpassword'))
                        <span class="text-danger">{{ $errors->first('enpassword') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.enpassword_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="birth">{{ trans('cruds.gameUser.fields.birth') }}</label>
                    <input class="form-control {{ $errors->has('birth') ? 'is-invalid' : '' }}" type="text" name="birth" id="birth" value="{{ old('birth', '') }}">
                    @if($errors->has('birth'))
                        <span class="text-danger">{{ $errors->first('birth') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.birth_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="email">{{ trans('cruds.gameUser.fields.email') }}</label>
                    <input class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" type="text" name="email" id="email" value="{{ old('email', '') }}">
                    @if($errors->has('email'))
                        <span class="text-danger">{{ $errors->first('email') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.gameUser.fields.email_helper') }}</span>
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
