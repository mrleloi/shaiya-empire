@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.show') }} {{ trans('cruds.guideFaq.title') }}
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.guide-faqs.index') }}">
                                    {{ trans('global.back_to_list') }}
                                </a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.id') }}
                                    </th>
                                    <td>
                                        {{ $guideFaq->id }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.title') }}
                                    </th>
                                    <td>
                                        {{ $guideFaq->title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.header') }}
                                    </th>
                                    <td>
                                        {{ $guideFaq->header }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.question_general_content') }}
                                    </th>
                                    <td>
                                        {!! $guideFaq->question_general_content !!}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.question_technical_content') }}
                                    </th>
                                    <td>
                                        {!! $guideFaq->question_technical_content !!}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {{ trans('cruds.guideFaq.fields.question_game_content') }}
                                    </th>
                                    <td>
                                        {!! $guideFaq->question_game_content !!}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group">
                                <a class="btn btn-default" href="{{ route('frontend.guide-faqs.index') }}">
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
