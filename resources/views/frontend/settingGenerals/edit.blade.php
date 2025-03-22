@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        {{ trans('global.edit') }} {{ trans('cruds.settingGeneral.title_singular') }}
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route("frontend.setting-generals.update", [$settingGeneral->id]) }}" enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="icon">{{ trans('cruds.settingGeneral.fields.icon') }}</label>
                                <div class="needsclick dropzone" id="icon-dropzone">
                                </div>
                                @if($errors->has('icon'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('icon') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.icon_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="background">{{ trans('cruds.settingGeneral.fields.background') }}</label>
                                <div class="needsclick dropzone" id="background-dropzone">
                                </div>
                                @if($errors->has('background'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('background') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.background_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label class="required" for="title">{{ trans('cruds.settingGeneral.fields.title') }}</label>
                                <input class="form-control" type="text" name="title" id="title" value="{{ old('title', $settingGeneral->title) }}" required>
                                @if($errors->has('title'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('title') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.title_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="url_facebook">{{ trans('cruds.settingGeneral.fields.url_facebook') }}</label>
                                <input class="form-control" type="text" name="url_facebook" id="url_facebook" value="{{ old('url_facebook', $settingGeneral->url_facebook) }}">
                                @if($errors->has('url_facebook'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('url_facebook') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.url_facebook_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="url_discord">{{ trans('cruds.settingGeneral.fields.url_discord') }}</label>
                                <input class="form-control" type="text" name="url_discord" id="url_discord" value="{{ old('url_discord', $settingGeneral->url_discord) }}">
                                @if($errors->has('url_discord'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('url_discord') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.url_discord_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="meta_des">{{ trans('cruds.settingGeneral.fields.meta_des') }}</label>
                                <textarea class="form-control" name="meta_des" id="meta_des">{{ old('meta_des', $settingGeneral->meta_des) }}</textarea>
                                @if($errors->has('meta_des'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('meta_des') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.meta_des_helper') }}</span>
                            </div>
                            <div class="form-group">
                                <label for="meta_keyword">{{ trans('cruds.settingGeneral.fields.meta_keyword') }}</label>
                                <input class="form-control" type="text" name="meta_keyword" id="meta_keyword" value="{{ old('meta_keyword', $settingGeneral->meta_keyword) }}">
                                @if($errors->has('meta_keyword'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('meta_keyword') }}
                                    </div>
                                @endif
                                <span class="help-block">{{ trans('cruds.settingGeneral.fields.meta_keyword_helper') }}</span>
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
        Dropzone.options.iconDropzone = {
            url: '{{ route('frontend.setting-generals.storeMedia') }}',
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
                $('form').find('input[name="icon"]').remove()
                $('form').append('<input type="hidden" name="icon" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="icon"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                    @if(isset($settingGeneral) && $settingGeneral->icon)
                var file = {!! json_encode($settingGeneral->icon) !!}
                        this.options.addedfile.call(this, file)
                this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="icon" value="' + file.file_name + '">')
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
        Dropzone.options.backgroundDropzone = {
            url: '{{ route('frontend.setting-generals.storeMedia') }}',
            maxFilesize: 2000, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            maxFiles: 1,
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
                $('form').find('input[name="background"]').remove()
                $('form').append('<input type="hidden" name="background" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="background"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                    @if(isset($settingGeneral) && $settingGeneral->background)
                var file = {!! json_encode($settingGeneral->background) !!}
                        this.options.addedfile.call(this, file)
                this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="background" value="' + file.file_name + '">')
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
@endsection
