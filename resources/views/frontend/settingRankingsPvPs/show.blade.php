@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.settingRankingsPvP.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-rankings-pv-ps.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsPvP.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsPvP->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsPvP.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsPvP->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsPvP.fields.header') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsPvP->header }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.settingRankingsPvP.fields.num_display') }}
                                    </th>
                                    <td>
                                        {{ $settingRankingsPvP->num_display }}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.setting-rankings-pv-ps.index') }}">
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
