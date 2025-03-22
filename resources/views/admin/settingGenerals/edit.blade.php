@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.edit') }} {{ trans('cruds.settingGeneral.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.setting-generals.update", [$settingGeneral->id]) }}" enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <div class="form-group">
                    <label for="icon">{{ trans('cruds.settingGeneral.fields.icon') }}</label>
                    <div class="needsclick dropzone {{ $errors->has('icon') ? 'is-invalid' : '' }}" id="icon-dropzone">
                    </div>
                    @if($errors->has('icon'))
                        <span class="text-danger">{{ $errors->first('icon') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.icon_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="background">{{ trans('cruds.settingGeneral.fields.background') }}</label>
                    <div class="needsclick dropzone {{ $errors->has('background') ? 'is-invalid' : '' }}" id="background-dropzone">
                    </div>
                    @if($errors->has('background'))
                        <span class="text-danger">{{ $errors->first('background') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.background_helper') }}</span>
                </div>
                <div class="form-group">
                    <label class="required" for="title">{{ trans('cruds.settingGeneral.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', $settingGeneral->title) }}" required>
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="url_facebook">{{ trans('cruds.settingGeneral.fields.url_facebook') }}</label>
                    <input class="form-control {{ $errors->has('url_facebook') ? 'is-invalid' : '' }}" type="text" name="url_facebook" id="url_facebook" value="{{ old('url_facebook', $settingGeneral->url_facebook) }}">
                    @if($errors->has('url_facebook'))
                        <span class="text-danger">{{ $errors->first('url_facebook') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.url_facebook_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="url_discord">{{ trans('cruds.settingGeneral.fields.url_discord') }}</label>
                    <input class="form-control {{ $errors->has('url_discord') ? 'is-invalid' : '' }}" type="text" name="url_discord" id="url_discord" value="{{ old('url_discord', $settingGeneral->url_discord) }}">
                    @if($errors->has('url_discord'))
                        <span class="text-danger">{{ $errors->first('url_discord') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.url_discord_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="meta_des">{{ trans('cruds.settingGeneral.fields.meta_des') }}</label>
                    <textarea class="form-control {{ $errors->has('meta_des') ? 'is-invalid' : '' }}" name="meta_des" id="meta_des">{{ old('meta_des', $settingGeneral->meta_des) }}</textarea>
                    @if($errors->has('meta_des'))
                        <span class="text-danger">{{ $errors->first('meta_des') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.meta_des_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="meta_keyword">{{ trans('cruds.settingGeneral.fields.meta_keyword') }}</label>
                    <input class="form-control {{ $errors->has('meta_keyword') ? 'is-invalid' : '' }}" type="text" name="meta_keyword" id="meta_keyword" value="{{ old('meta_keyword', $settingGeneral->meta_keyword) }}">
                    @if($errors->has('meta_keyword'))
                        <span class="text-danger">{{ $errors->first('meta_keyword') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingGeneral.fields.meta_keyword_helper') }}</span>
                </div>

                <hr>
                <h4>Quản lý Slider</h4>

                <div class="form-group">
                    <label for="slides">Ảnh Slider</label>
                    <div class="needsclick dropzone {{ $errors->has('slides') ? 'is-invalid' : '' }}" id="slides-dropzone">
                    </div>
                    @if($errors->has('slides'))
                        <span class="text-danger">{{ $errors->first('slides') }}</span>
                    @endif
                    <span class="help-block">Tải lên các ảnh cho slider trang chủ. Kích thước đề xuất: 1920x400 pixel.</span>
                </div>

                <hr>
                <h4>Quản lý Video chính</h4>

                <div class="form-group">
                    <label for="video_url">URL Video YouTube chính</label>
                    <input class="form-control {{ $errors->has('video_url') ? 'is-invalid' : '' }}" type="text" name="video_url" id="video_url" value="{{ old('video_url', $settingGeneral->video_url) }}">
                    @if($errors->has('video_url'))
                        <span class="text-danger">{{ $errors->first('video_url') }}</span>
                    @endif
                    <span class="help-block">Nhập URL video từ YouTube. Hệ thống sẽ tự động lấy thumbnail.</span>
                </div>

                <div class="form-group">
                    <label for="video_thumbnail">URL Thumbnail Tùy chỉnh (Tùy chọn)</label>
                    <input class="form-control {{ $errors->has('video_thumbnail') ? 'is-invalid' : '' }}" type="text" name="video_thumbnail" id="video_thumbnail" value="{{ old('video_thumbnail', $settingGeneral->video_thumbnail) }}">
                    @if($errors->has('video_thumbnail'))
                        <span class="text-danger">{{ $errors->first('video_thumbnail') }}</span>
                    @endif
                    <span class="help-block">Để trống nếu muốn sử dụng thumbnail mặc định từ YouTube.</span>
                </div>

                <hr>
                <h4>Quản lý Carousel Videos</h4>

                <div class="card">
                    <div class="card-body">
                        <table class="table" id="carousel-videos-table">
                            <thead>
                            <tr>
                                <th>URL Video YouTube</th>
                                <th>Tiêu đề</th>
                                <th>Thumbnail (tùy chọn)</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $carouselVideos = old('carousel_videos', $settingGeneral->carousel_videos ?? []);
                                if (!is_array($carouselVideos)) {
                                    $carouselVideos = [];
                                }
                            @endphp

                            @foreach($carouselVideos as $index => $video)
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[{{ $index }}][url]" value="{{ $video['url'] ?? '' }}" placeholder="URL YouTube">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[{{ $index }}][title]" value="{{ $video['title'] ?? '' }}" placeholder="Tiêu đề video">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[{{ $index }}][thumbnail]" value="{{ $video['thumbnail'] ?? '' }}" placeholder="URL thumbnail (tùy chọn)">
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm remove-video"><i class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                            @endforeach

                            @if(count($carouselVideos) == 0)
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[0][url]" value="" placeholder="URL YouTube">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[0][title]" value="" placeholder="Tiêu đề video">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="carousel_videos[0][thumbnail]" value="" placeholder="URL thumbnail (tùy chọn)">
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm remove-video"><i class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                            @endif
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4" class="text-right">
                                    <button type="button" class="btn btn-success btn-sm" id="add-more-videos">
                                        <i class="fa fa-plus"></i> Thêm video
                                    </button>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <hr>
                <h4>Quản lý Ảnh trang chủ</h4>

                <div class="form-group">
                    <label for="screenshots">Ảnh trang chủ</label>
                    <div class="needsclick dropzone {{ $errors->has('screenshots') ? 'is-invalid' : '' }}" id="screenshots-dropzone">
                    </div>
                    @if($errors->has('screenshots'))
                        <span class="text-danger">{{ $errors->first('screenshots') }}</span>
                    @endif
                    <span class="help-block">Tải lên các ảnh sẽ hiển thị trên trang chủ. Có thể tải nhiều ảnh cùng lúc.</span>
                </div>

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
        Dropzone.options.iconDropzone = {
            url: '{{ route('admin.setting-generals.storeMedia') }}',
            maxFilesize: 20, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.ico',
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
            url: '{{ route('admin.setting-generals.storeMedia') }}',
            maxFilesize: 2000, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.ico',
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
    <script>
        var uploadedScreenshotsMap = {}
        Dropzone.options.screenshotsDropzone = {
            url: '{{ route('admin.setting-generals.storeMedia') }}',
            maxFilesize: 10, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 10,
                width: 4096,
                height: 4096
            },
            success: function (file, response) {
                $('form').append('<input type="hidden" name="screenshots[]" value="' + response.name + '">')
                uploadedScreenshotsMap[file.name] = response.name
            },
            removedfile: function (file) {
                console.log(file)
                file.previewElement.remove()
                var name = ''
                if (typeof file.file_name !== 'undefined') {
                    name = file.file_name
                } else {
                    name = uploadedScreenshotsMap[file.name]
                }
                $('form').find('input[name="screenshots[]"][value="' + name + '"]').remove()
            },
            init: function () {
                @if(isset($settingGeneral) && $settingGeneral->screenshots)
                var files = {!! json_encode($settingGeneral->screenshots) !!}
                for (var i in files) {
                    var file = files[i]
                    this.options.addedfile.call(this, file)
                    this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                    file.previewElement.classList.add('dz-complete')
                    $('form').append('<input type="hidden" name="screenshots[]" value="' + file.file_name + '">')
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
        var uploadedSlidesMap = {}
        Dropzone.options.slidesDropzone = {
            url: '{{ route('admin.setting-generals.storeMedia') }}',
            maxFilesize: 10, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 10,
                width: 4096,
                height: 4096
            },
            success: function (file, response) {
                $('form').append('<input type="hidden" name="slides[]" value="' + response.name + '">')
                uploadedSlidesMap[file.name] = response.name
            },
            removedfile: function (file) {
                console.log(file)
                file.previewElement.remove()
                var name = ''
                if (typeof file.file_name !== 'undefined') {
                    name = file.file_name
                } else {
                    name = uploadedSlidesMap[file.name]
                }
                $('form').find('input[name="slides[]"][value="' + name + '"]').remove()
            },
            init: function () {
                @if(isset($settingGeneral) && $settingGeneral->slides)
                var files = {!! json_encode($settingGeneral->slides) !!}
                for (var i in files) {
                    var file = files[i]
                    this.options.addedfile.call(this, file)
                    this.options.thumbnail.call(this, file, file.preview ?? file.preview_url)
                    file.previewElement.classList.add('dz-complete')
                    $('form').append('<input type="hidden" name="slides[]" value="' + file.file_name + '">')
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
        // Carousel Video Manager
        $(document).ready(function () {
            let videoCounter = {{ count(old('carousel_videos', $settingGeneral->carousel_videos ?? [])) ?: 0 }};

            // Thêm video mới
            $('#add-more-videos').click(function () {
                videoCounter++;

                const newRow = `
                    <tr>
                        <td>
                            <input type="text" class="form-control" name="carousel_videos[${videoCounter}][url]" value="" placeholder="URL YouTube">
                        </td>
                        <td>
                            <input type="text" class="form-control" name="carousel_videos[${videoCounter}][title]" value="" placeholder="Tiêu đề video">
                        </td>
                        <td>
                            <input type="text" class="form-control" name="carousel_videos[${videoCounter}][thumbnail]" value="" placeholder="URL thumbnail (tùy chọn)">
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm remove-video"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>
                `;

                $('#carousel-videos-table tbody').append(newRow);
            });

            // Xóa video
            $(document).on('click', '.remove-video', function () {
                const rowCount = $('#carousel-videos-table tbody tr').length;
                if (rowCount > 1) {
                    $(this).closest('tr').remove();
                } else {
                    // Xóa nội dung nếu đây là hàng cuối cùng
                    $(this).closest('tr').find('input').val('');
                }
            });
        });
    </script>
@endsection
