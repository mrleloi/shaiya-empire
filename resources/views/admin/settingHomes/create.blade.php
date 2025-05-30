@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.settingHome.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.setting-homes.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="logo">{{ trans('cruds.settingHome.fields.logo') }}</label>
                    <div class="needsclick dropzone {{ $errors->has('logo') ? 'is-invalid' : '' }}" id="logo-dropzone">
                    </div>
                    @if($errors->has('logo'))
                        <span class="text-danger">{{ $errors->first('logo') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.logo_helper') }}</span>
                </div>
                {{--<div class="form-group">
                    <label for="slide_images">{{ trans('cruds.settingHome.fields.slide_images') }}</label>
                    <div class="needsclick dropzone {{ $errors->has('slide_images') ? 'is-invalid' : '' }}" id="slide_images-dropzone">
                    </div>
                    @if($errors->has('slide_images'))
                        <span class="text-danger">{{ $errors->first('slide_images') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.slide_images_helper') }}</span>
                </div>--}}
                <div class="form-group">
                    <label for="title">{{ trans('cruds.settingHome.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}">
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="header">{{ trans('cruds.settingHome.fields.header') }}</label>
                    <input class="form-control {{ $errors->has('header') ? 'is-invalid' : '' }}" type="text" name="header" id="header" value="{{ old('header', '') }}">
                    @if($errors->has('header'))
                        <span class="text-danger">{{ $errors->first('header') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.header_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="events_title">{{ trans('cruds.settingHome.fields.events_title') }}</label>
                    <input class="form-control {{ $errors->has('events_title') ? 'is-invalid' : '' }}" type="text" name="events_title" id="events_title" value="{{ old('events_title', '') }}">
                    @if($errors->has('events_title'))
                        <span class="text-danger">{{ $errors->first('events_title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.events_title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="content_server_info">{{ trans('cruds.settingHome.fields.content_server_info') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('content_server_info') ? 'is-invalid' : '' }}" name="content_server_info" id="content_server_info">{!! old('content_server_info') !!}</textarea>
                    @if($errors->has('content_server_info'))
                        <span class="text-danger">{{ $errors->first('content_server_info') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.content_server_info_helper') }}</span>
                </div>
                {{--<div class="form-group">
                    <label for="content_server_info">{{ trans('cruds.settingHome.fields.server_information_full') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('server_information_full') ? 'is-invalid' : '' }}" name="server_information_full" id="server_information_full">{!! old('server_information_full') !!}</textarea>
                    @if($errors->has('server_information_full'))
                        <span class="text-danger">{{ $errors->first('server_information_full') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.content_server_info_helper') }}</span>
                </div>--}}
                {{--<div class="form-group">
                    <label for="events_content">{{ trans('cruds.settingHome.fields.events_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('events_content') ? 'is-invalid' : '' }}" name="events_content" id="events_content">{!! old('events_content') !!}</textarea>
                    @if($errors->has('events_content'))
                        <span class="text-danger">{{ $errors->first('events_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.events_content_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="announcement_title">{{ trans('cruds.settingHome.fields.announcement_title') }}</label>
                    <input class="form-control {{ $errors->has('announcement_title') ? 'is-invalid' : '' }}" type="text" name="announcement_title" id="announcement_title" value="{{ old('announcement_title', '') }}">
                    @if($errors->has('announcement_title'))
                        <span class="text-danger">{{ $errors->first('announcement_title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.announcement_title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="announcement_content">{{ trans('cruds.settingHome.fields.announcement_content') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('announcement_content') ? 'is-invalid' : '' }}" name="announcement_content" id="announcement_content">{!! old('announcement_content') !!}</textarea>
                    @if($errors->has('announcement_content'))
                        <span class="text-danger">{{ $errors->first('announcement_content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.announcement_content_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="content_server_info">{{ trans('cruds.settingHome.fields.content_server_info') }}</label>
                    <textarea class="form-control ckeditor {{ $errors->has('content_server_info') ? 'is-invalid' : '' }}" name="content_server_info" id="content_server_info">{!! old('content_server_info') !!}</textarea>
                    @if($errors->has('content_server_info'))
                        <span class="text-danger">{{ $errors->first('content_server_info') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingHome.fields.content_server_info_helper') }}</span>
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
        Dropzone.options.logoDropzone = {
            url: '{{ route('admin.setting-homes.storeMedia') }}',
            maxFilesize: 20, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 20,
                width: 4096,
                height: 4096
            },
            success: function (file, response) {
                $('form').find('input[name="logo"]').remove()
                $('form').append('<input type="hidden" name="logo" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="logo"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                    @if(isset($settingHome) && $settingHome->logo)
                var file = {!! json_encode($settingHome->logo) !!}
                        this.options.addedfile.call(this, file)
                this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="logo" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }

    </script>
    <script>
        var uploadedSlideImagesMap = {}
        Dropzone.options.slideImagesDropzone = {
            url: '{{ route('admin.setting-homes.storeMedia') }}',
            maxFilesize: 2000, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2000,
                width: 4096,
                height: 4096
            },
            success: function (file, response) {
                $('form').append('<input type="hidden" name="slide_images[]" value="' + response.name + '">')
                uploadedSlideImagesMap[file.name] = response.name
            },
            removedfile: function (file) {
                console.log(file)
                file.previewElement.remove()
                var name = ''
                if (typeof file.file_name !== 'undefined') {
                    name = file.file_name
                } else {
                    name = uploadedSlideImagesMap[file.name]
                }
                $('form').find('input[name="slide_images[]"][value="' + name + '"]').remove()
            },
            init: function () {
                    @if(isset($settingHome) && $settingHome->slide_images)
                var files = {!! json_encode($settingHome->slide_images) !!}
                    for (var i in files) {
                    var file = files[i]
                    this.options.addedfile.call(this, file)
                    this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                    file.previewElement.classList.add('dz-complete')
                    $('form').append('<input type="hidden" name="slide_images[]" value="' + file.file_name + '">')
                }
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }

    </script>
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
                                        xhr.open('POST', '{{ route('admin.setting-homes.storeCKEditorImages') }}', true);
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
                                        data.append('crud_id', '{{ $settingHome->id ?? 0 }}');
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
