@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.edit') }} {{ trans('cruds.guideRule.title_singular') }}
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route("frontend.guide-rules.update", [$guideRule->id]) }}" enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="title">{{ trans('cruds.guideRule.fields.title') }}</label>
                                <input class="form-control" type="text" name="title" id="title" value="{{ old('title', $guideRule->title) }}">
                                @if($errors->has('title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="header">{{ trans('cruds.guideRule.fields.header') }}</label>
                                <input class="form-control" type="text" name="header" id="header" value="{{ old('header', $guideRule->header) }}">
                                @if($errors->has('header'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('header') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.header_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="play_nice_policies_title">{{ trans('cruds.guideRule.fields.play_nice_policies_title') }}</label>
                                <input class="form-control" type="text" name="play_nice_policies_title" id="play_nice_policies_title" value="{{ old('play_nice_policies_title', $guideRule->play_nice_policies_title) }}">
                                @if($errors->has('play_nice_policies_title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('play_nice_policies_title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.play_nice_policies_title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="play_nice_policies_content">{{ trans('cruds.guideRule.fields.play_nice_policies_content') }}</label>
                                <textarea class="form-control ckeditor" name="play_nice_policies_content" id="play_nice_policies_content">{!! old('play_nice_policies_content', $guideRule->play_nice_policies_content) !!}</textarea>
                                @if($errors->has('play_nice_policies_content'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('play_nice_policies_content') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.play_nice_policies_content_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="tos_title">{{ trans('cruds.guideRule.fields.tos_title') }}</label>
                                <input class="form-control" type="text" name="tos_title" id="tos_title" value="{{ old('tos_title', $guideRule->tos_title) }}">
                                @if($errors->has('tos_title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('tos_title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.tos_title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="tos_content">{{ trans('cruds.guideRule.fields.tos_content') }}</label>
                                <textarea class="form-control ckeditor" name="tos_content" id="tos_content">{!! old('tos_content', $guideRule->tos_content) !!}</textarea>
                                @if($errors->has('tos_content'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('tos_content') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.tos_content_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="agreement_title">{{ trans('cruds.guideRule.fields.agreement_title') }}</label>
                                <input class="form-control" type="text" name="agreement_title" id="agreement_title" value="{{ old('agreement_title', $guideRule->agreement_title) }}">
                                @if($errors->has('agreement_title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('agreement_title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.agreement_title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="agreement_content">{{ trans('cruds.guideRule.fields.agreement_content') }}</label>
                                <textarea class="form-control ckeditor" name="agreement_content" id="agreement_content">{!! old('agreement_content', $guideRule->agreement_content) !!}</textarea>
                                @if($errors->has('agreement_content'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('agreement_content') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.guideRule.fields.agreement_content_helper') }}</span>
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

@section('scripts')
    <script>
        $(document).ready(function () {
            function SimpleUploadAdapter(editor) {
                editor.plugins.get('FileRepository').createUploadAdapter = function(loader) {
                    return {
                        upload: function() {
                            return loader.file
                                .then(function (file) {
                                    return new Promise(function(resolve, reject) {
                                        // Init request
                                        var xhr = new XMLHttpRequest();
                                        xhr.open('POST', '{{ route('frontend.guide-rules.storeCKEditorImages') }}', true);
                                        xhr.setRequestHeader('x-csrf-token', window._token);
                                        xhr.setRequestHeader('Accept', 'application/json');
                                        xhr.responseType = 'json';

                                        // Init listeners
                                        var genericErrorText = `Couldn't upload file: ${ file.name }.`;
                                        xhr.addEventListener('error', function() { reject(genericErrorText) });
                                        xhr.addEventListener('abort', function() { reject() });
                                        xhr.addEventListener('load', function() {
                                            var response = xhr.response;

                                            if (!response || xhr.status !== 201) {
                                                return reject(response && response.message ? `${genericErrorText}\n${xhr.status} ${response.message}` : `${genericErrorText}\n ${xhr.status} ${xhr.statusText}`);
                                            }

                                            $('form').append('<input type="hidden" name="ck-media[]" value="' + response.id + '">');

                                            resolve({ default: response.url });
                                        });

                                        if (xhr.upload) {
                                            xhr.upload.addEventListener('progress', function(e) {
                                                if (e.lengthComputable) {
                                                    loader.uploadTotal = e.total;
                                                    loader.uploaded = e.loaded;
                                                }
                                            });
                                        }

                                        // Send request
                                        var data = new FormData();
                                        data.append('upload', file);
                                        data.append('crud_id', '{{ $guideRule->id ?? 0 }}');
                                        xhr.send(data);
                                    });
                                })
                        }
                    };
                }
            }

            var allEditors = document.querySelectorAll('.ckeditor');
            for (var i = 0; i < allEditors.length; ++i) {
                ClassicEditor.create(
                    allEditors[i], {
                        extraPlugins: [SimpleUploadAdapter]
                    }
                );
            }
        });
    </script>

@endsection
