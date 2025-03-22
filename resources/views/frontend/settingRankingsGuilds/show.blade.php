@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.settingRankingsGuild.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-rankings-guilds.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsGuild.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsGuild->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsGuild.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsGuild->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsGuild.fields.header') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsGuild->header }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsGuild.fields.num_display') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsGuild->num_display }}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-rankings-guilds.index') }}">
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
