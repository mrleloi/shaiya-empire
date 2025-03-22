@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.edit') }} {{ trans('cruds.gameUser.title_singular') }}
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route("frontend.game-users.update", [$gameUser->id]) }}" enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="useruid">{{ trans('cruds.gameUser.fields.useruid') }}</label>
                                <input class="form-control" type="number" name="useruid" id="useruid" value="{{ old('useruid', $gameUser->useruid) }}" step="1">
                                @if($errors->has('useruid'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('useruid') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.useruid_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="userid">{{ trans('cruds.gameUser.fields.userid') }}</label>
                                <input class="form-control" type="text" name="userid" id="userid" value="{{ old('userid', $gameUser->userid) }}">
                                @if($errors->has('userid'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('userid') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.userid_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="pw">{{ trans('cruds.gameUser.fields.pw') }}</label>
                                <input class="form-control" type="password" name="pw" id="pw">
                                @if($errors->has('pw'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('pw') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.pw_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="joindate">{{ trans('cruds.gameUser.fields.joindate') }}</label>
                                <input class="form-control datetime" type="text" name="joindate" id="joindate" value="{{ old('joindate', $gameUser->joindate) }}">
                                @if($errors->has('joindate'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('joindate') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.joindate_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="admin">{{ trans('cruds.gameUser.fields.admin') }}</label>
                                <input class="form-control" type="number" name="admin" id="admin" value="{{ old('admin', $gameUser->admin) }}" step="1">
                                @if($errors->has('admin'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('admin') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.admin_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="adminlevel">{{ trans('cruds.gameUser.fields.adminlevel') }}</label>
                                <input class="form-control" type="number" name="adminlevel" id="adminlevel" value="{{ old('adminlevel', $gameUser->adminlevel) }}" step="1">
                                @if($errors->has('adminlevel'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('adminlevel') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.adminlevel_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="usequeue">{{ trans('cruds.gameUser.fields.usequeue') }}</label>
                                <input class="form-control" type="number" name="usequeue" id="usequeue" value="{{ old('usequeue', $gameUser->usequeue) }}" step="1">
                                @if($errors->has('usequeue'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('usequeue') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.usequeue_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="status">{{ trans('cruds.gameUser.fields.status') }}</label>
                                <input class="form-control" type="number" name="status" id="status" value="{{ old('status', $gameUser->status) }}" step="1">
                                @if($errors->has('status'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('status') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.status_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="leave">{{ trans('cruds.gameUser.fields.leave') }}</label>
                                <input class="form-control" type="number" name="leave" id="leave" value="{{ old('leave', $gameUser->leave) }}" step="1">
                                @if($errors->has('leave'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('leave') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.leave_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="leavedate">{{ trans('cruds.gameUser.fields.leavedate') }}</label>
                                <input class="form-control datetime" type="text" name="leavedate" id="leavedate" value="{{ old('leavedate', $gameUser->leavedate) }}">
                                @if($errors->has('leavedate'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('leavedate') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.leavedate_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="usertype">{{ trans('cruds.gameUser.fields.usertype') }}</label>
                                <input class="form-control" type="text" name="usertype" id="usertype" value="{{ old('usertype', $gameUser->usertype) }}">
                                @if($errors->has('usertype'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('usertype') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.usertype_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="userip">{{ trans('cruds.gameUser.fields.userip') }}</label>
                                <input class="form-control" type="text" name="userip" id="userip" value="{{ old('userip', $gameUser->userip) }}">
                                @if($errors->has('userip'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('userip') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.userip_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="modiip">{{ trans('cruds.gameUser.fields.modiip') }}</label>
                                <input class="form-control" type="text" name="modiip" id="modiip" value="{{ old('modiip', $gameUser->modiip) }}">
                                @if($errors->has('modiip'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('modiip') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.modiip_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="modidate">{{ trans('cruds.gameUser.fields.modidate') }}</label>
                                <input class="form-control datetime" type="text" name="modidate" id="modidate" value="{{ old('modidate', $gameUser->modidate) }}">
                                @if($errors->has('modidate'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('modidate') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.modidate_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="point">{{ trans('cruds.gameUser.fields.point') }}</label>
                                <input class="form-control" type="number" name="point" id="point" value="{{ old('point', $gameUser->point) }}" step="1">
                                @if($errors->has('point'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('point') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.point_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="enpassword">{{ trans('cruds.gameUser.fields.enpassword') }}</label>
                                <input class="form-control" type="text" name="enpassword" id="enpassword" value="{{ old('enpassword', $gameUser->enpassword) }}">
                                @if($errors->has('enpassword'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('enpassword') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.enpassword_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="birth">{{ trans('cruds.gameUser.fields.birth') }}</label>
                                <input class="form-control" type="text" name="birth" id="birth" value="{{ old('birth', $gameUser->birth) }}">
                                @if($errors->has('birth'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('birth') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.gameUser.fields.birth_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="email">{{ trans('cruds.gameUser.fields.email') }}</label>
                                <input class="form-control" type="text" name="email" id="email" value="{{ old('email', $gameUser->email) }}">
                                @if($errors->has('email'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('email') }}
                                    </div>
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

            </div>
        </div>
    </div>
@endsection
