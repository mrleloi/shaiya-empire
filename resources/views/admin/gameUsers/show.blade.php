@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.show') }} {{ trans('cruds.gameUser.title') }}
        </div>

        <div class="card-body">
            <div class="form-group">
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.game-users.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.rowid') }}
                        </th>
                        <td>
                            {{ $gameUser->rowid }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.useruid') }}
                        </th>
                        <td>
                            {{ $gameUser->useruid }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.userid') }}
                        </th>
                        <td>
                            {{ $gameUser->userid }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.pw') }}
                        </th>
                        <td>
                            ********
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.joindate') }}
                        </th>
                        <td>
                            {{ $gameUser->joindate }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.admin') }}
                        </th>
                        <td>
                            {{ $gameUser->admin }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.adminlevel') }}
                        </th>
                        <td>
                            {{ $gameUser->adminlevel }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.usequeue') }}
                        </th>
                        <td>
                            {{ $gameUser->usequeue }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.status') }}
                        </th>
                        <td>
                            {{ $gameUser->status }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.leave') }}
                        </th>
                        <td>
                            {{ $gameUser->leave }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.leavedate') }}
                        </th>
                        <td>
                            {{ $gameUser->leavedate }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.usertype') }}
                        </th>
                        <td>
                            {{ $gameUser->usertype }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.userip') }}
                        </th>
                        <td>
                            {{ $gameUser->userip }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.modiip') }}
                        </th>
                        <td>
                            {{ $gameUser->modiip }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.modidate') }}
                        </th>
                        <td>
                            {{ $gameUser->modidate }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.point') }}
                        </th>
                        <td>
                            {{ $gameUser->point }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.enpassword') }}
                        </th>
                        <td>
                            {{ $gameUser->enpassword }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.birth') }}
                        </th>
                        <td>
                            {{ $gameUser->birth }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.gameUser.fields.email') }}
                        </th>
                        <td>
                            {{ $gameUser->email }}
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.game-users.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
            </div>
        </div>
    </div>



@endsection
