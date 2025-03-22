@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.settingMedium.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.setting-media.store") }}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="title">{{ trans('cruds.settingMedium.fields.title') }}</label>
                    <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}">
                    @if($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingMedium.fields.title_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="header">{{ trans('cruds.settingMedium.fields.header') }}</label>
                    <input class="form-control {{ $errors->has('header') ? 'is-invalid' : '' }}" type="text" name="header" id="header" value="{{ old('header', '') }}">
                    @if($errors->has('header'))
                        <span class="text-danger">{{ $errors->first('header') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingMedium.fields.header_helper') }}</span>
                </div>
                <div class="form-group">
                    <label for="content">{{ trans('cruds.settingMedium.fields.content') }}</label>
					<div>
						<h4>Nhập thời gian hồi sinh lần lượt (đơn vị giờ) cho các boss theo thứ tự sau, mỗi số cách nhau bởi dấu phẩy, không có thì điền là 0</h4>
						<h5>Ví dụ: 12,12,0,24</h5>
						<h4>Danh sách các boss có trong GameLog:</h4>
						<ol>
						<?php
						$sql = 'SELECT [MobName]
								  ,MAX([ActionTime]) AS LatestActionTime
							FROM [PS_GameLog].[dbo].[Boss_Death_Log]
							GROUP BY [MobName] ORDER BY MobName ASC;';
						$results = \DB::connection('sqlsrv_gamelog')->select($sql);
						$results = collect($results);
						foreach ($results as $i => $boss) {
							echo '<li>'. $boss->MobName .'</li>';
						}
						?>
						</ol>
					</div>
                    <textarea class="form-control {{ $errors->has('content') ? 'is-invalid' : '' }}" name="content" id="content">{!! old('content') !!}</textarea>
                    @if($errors->has('content'))
                        <span class="text-danger">{{ $errors->first('content') }}</span>
                    @endif
                    <span class="help-block">{{ trans('cruds.settingMedium.fields.content_helper') }}</span>
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
                                        xhr.open('POST', '{{ route('admin.setting-media.storeCKEditorImages') }}', true);
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
                                        data.append('crud_id', '{{ $settingMedium->id ?? 0 }}');
                                        xhr.send(data);
                                    });
                                })
                        }
                    };
                }
            }
        });
    </script>

@endsection
