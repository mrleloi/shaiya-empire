@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.guideFaq.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.guide-faqs.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="title">{{ trans('cruds.guideFaq.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}">
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideFaq.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="header">{{ trans('cruds.guideFaq.fields.header') }}</label>
                    <input class="form-control {{ $errors->has('header') ? 'is-invalid' : '' }}" type="text" name="header" id="header" value="{{ old('header', '') }}">
                    @if($errors->has('header'))
                        <span class="text-danger">{{ $errors->first('header') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideFaq.fields.header_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="question_general_content">{{ trans('cruds.guideFaq.fields.question_general_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('question_general_content') ? 'is-invalid' : '' }}" name="question_general_content" id="question_general_content">{!! old('question_general_content') !!}</textarea>
                    @if($errors->has('question_general_content'))
                        <span class="text-danger">{{ $errors->first('question_general_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideFaq.fields.question_general_content_helper') }}</span>
                </div>
                {{--<div class="form-group">
                    <label for="question_technical_content">{{ trans('cruds.guideFaq.fields.question_technical_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('question_technical_content') ? 'is-invalid' : '' }}" name="question_technical_content" id="question_technical_content">{!! old('question_technical_content') !!}</textarea>
                    @if($errors->has('question_technical_content'))
                        <span class="text-danger">{{ $errors->first('question_technical_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideFaq.fields.question_technical_content_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="question_game_content">{{ trans('cruds.guideFaq.fields.question_game_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('question_game_content') ? 'is-invalid' : '' }}" name="question_game_content" id="question_game_content">{!! old('question_game_content') !!}</textarea>
                    @if($errors->has('question_game_content'))
                        <span class="text-danger">{{ $errors->first('question_game_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideFaq.fields.question_game_content_helper') }}</span>
                </div>
                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                </div>--}}
            </form>
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
                                        xhr.open('POST', '{{ route('admin.guide-faqs.storeCKEditorImages') }}', true);
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
                                        data.append('crud_id', '{{ $guideFaq->id ?? 0 }}');
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
