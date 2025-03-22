@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.guideRule.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.guide-rules.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="title">{{ trans('cruds.guideRule.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}">
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="header">{{ trans('cruds.guideRule.fields.header') }}</label>
                    <input class="form-control {{ $errors->has('header') ? 'is-invalid' : '' }}" type="text" name="header" id="header" value="{{ old('header', '') }}">
                    @if($errors->has('header'))
                        <span class="text-danger">{{ $errors->first('header') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.header_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="play_nice_policies_title">{{ trans('cruds.guideRule.fields.play_nice_policies_title') }}</label>
                    <input class="form-control {{ $errors->has('play_nice_policies_title') ? 'is-invalid' : '' }}" type="text" name="play_nice_policies_title" id="play_nice_policies_title" value="{{ old('play_nice_policies_title', '') }}">
                    @if($errors->has('play_nice_policies_title'))
                        <span class="text-danger">{{ $errors->first('play_nice_policies_title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.play_nice_policies_title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="play_nice_policies_content">{{ trans('cruds.guideRule.fields.play_nice_policies_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('play_nice_policies_content') ? 'is-invalid' : '' }}" name="play_nice_policies_content" id="play_nice_policies_content">{!! old('play_nice_policies_content') !!}</textarea>
                    @if($errors->has('play_nice_policies_content'))
                        <span class="text-danger">{{ $errors->first('play_nice_policies_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.play_nice_policies_content_helper') }}</span>
                </div>
                {{--<div class="form-group">
                    <label for="tos_title">{{ trans('cruds.guideRule.fields.tos_title') }}</label>
                    <input class="form-control {{ $errors->has('tos_title') ? 'is-invalid' : '' }}" type="text" name="tos_title" id="tos_title" value="{{ old('tos_title', '') }}">
                    @if($errors->has('tos_title'))
                        <span class="text-danger">{{ $errors->first('tos_title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.tos_title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="tos_content">{{ trans('cruds.guideRule.fields.tos_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('tos_content') ? 'is-invalid' : '' }}" name="tos_content" id="tos_content">{!! old('tos_content') !!}</textarea>
                    @if($errors->has('tos_content'))
                        <span class="text-danger">{{ $errors->first('tos_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.tos_content_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="agreement_title">{{ trans('cruds.guideRule.fields.agreement_title') }}</label>
                    <input class="form-control {{ $errors->has('agreement_title') ? 'is-invalid' : '' }}" type="text" name="agreement_title" id="agreement_title" value="{{ old('agreement_title', '') }}">
                    @if($errors->has('agreement_title'))
                        <span class="text-danger">{{ $errors->first('agreement_title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.agreement_title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="agreement_content">{{ trans('cruds.guideRule.fields.agreement_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('agreement_content') ? 'is-invalid' : '' }}" name="agreement_content" id="agreement_content">{!! old('agreement_content') !!}</textarea>
                    @if($errors->has('agreement_content'))
                        <span class="text-danger">{{ $errors->first('agreement_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.guideRule.fields.agreement_content_helper') }}</span>
                </div>--}}
                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                </div>
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
                                        xhr.open('POST', '{{ route('admin.guide-rules.storeCKEditorImages') }}', true);
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
