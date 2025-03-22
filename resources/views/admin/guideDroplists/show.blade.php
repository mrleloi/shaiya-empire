@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.show') }} {{ trans('cruds.guideDroplist.title') }}
        </div>

        <div class="card-body">
            <div class="form-group">
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.guide-droplists.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.guideDroplist.fields.id') }}
                        </th>
                        <td>
                            {{ $guideDroplist->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideDroplist.fields.title') }}
                        </th>
                        <td>
                            {{ $guideDroplist->title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideDroplist.fields.header') }}
                        </th>
                        <td>
                            {{ $guideDroplist->header }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.guideDroplist.fields.content') }}
                        </th>
                        <td>
                            {!! $guideDroplist->content !!}
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <a class="btn btn-default" href="{{ route('admin.guide-droplists.index') }}">
                        {{ trans('global.back_to_list') }}
                    </a>
                </div>
            </div>
        </div>
    </div>



@endsection
