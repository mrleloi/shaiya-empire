@extends('layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                @can('game_user_create')
                    <div style="margin-bottom: 10px;" class="row">
                        <div class="col-lg-12">
                            <a class="btn btn-success" href="{{ route('frontend.game-users.create') }}">
                                {{ trans('global.add') }} {{ trans('cruds.gameUser.title_singular') }}
                            </a>
                            <button class="btn btn-warning" data-toggle="modal" data-target="#csvImportModal">
                                {{ trans('global.app_csvImport') }}
                            </button>
                            @include('csvImport.modal', ['model' => 'GameUser', 'route' => 'admin.game-users.parseCsvImport'])
                        </div>
                    </div>
                @endcan
                <div class="card">
                    <div class="card-header">
                        {{ trans('cruds.gameUser.title_singular') }} {{ trans('global.list') }}
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class=" table table-bordered table-striped table-hover datatable datatable-GameUser">
                                <thead>
                                <tr>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.id') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.useruid') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.userid') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.joindate') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.admin') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.adminlevel') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.usequeue') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.status') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.leave') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.leavedate') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.usertype') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.userip') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.modiip') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.modidate') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.point') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.enpassword') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.birth') }}
                                    </th>
                                    <th>
                                        {{ trans('cruds.gameUser.fields.email') }}
                                    </th>
                                    <th>
                                        &nbsp;
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($gameUsers as $key => $gameUser)
                                    <tr data-entry-id="{{ $gameUser->id }}">
                                        <td>
                                            {{ $gameUser->id ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->useruid ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->userid ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->joindate ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->admin ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->adminlevel ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->usequeue ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->status ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->leave ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->leavedate ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->usertype ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->userip ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->modiip ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->modidate ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->point ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->enpassword ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->birth ?? '' }}
                                        </td>
                                        <td>
                                            {{ $gameUser->email ?? '' }}
                                        </td>
                                        <td>
                                            @can('game_user_show')
                                                <a class="btn btn-xs btn-primary" href="{{ route('frontend.game-users.show', $gameUser->id) }}">
                                                    {{ trans('global.view') }}
                                                </a>
                                            @endcan

                                            @can('game_user_edit')
                                                <a class="btn btn-xs btn-info" href="{{ route('frontend.game-users.edit', $gameUser->id) }}">
                                                    {{ trans('global.edit') }}
                                                </a>
                                            @endcan

                                            @can('game_user_delete')
                                                <form action="{{ route('frontend.game-users.destroy', $gameUser->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                    <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                                </form>
                                            @endcan

                                        </td>

                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
                @can('game_user_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('frontend.game-users.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
                        return $(entry).data('entry-id')
                    });

                    if (ids.length === 0) {
                        alert('{{ trans('global.datatables.zero_selected') }}')

                        return
                    }

                    if (confirm('{{ trans('global.areYouSure') }}')) {
                        $.ajax({
                            headers: {'x-csrf-token': _token},
                            method: 'POST',
                            url: config.url,
                            data: { ids: ids, _method: 'DELETE' }})
                            .done(function () { location.reload() })
                    }
                }
            }
            dtButtons.push(deleteButton)
            @endcan

            $.extend(true, $.fn.dataTable.defaults, {
                orderCellsTop: true,
                order: [[ 1, 'desc' ]],
                pageLength: 100,
            });
            let table = $('.datatable-GameUser:not(.ajaxTable)').DataTable({ buttons: dtButtons })
            $('a[data-toggle="tab"]').on('shown.bs.tab click', function(e){
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust();
            });

            let visibleColumnsIndexes = null;
            $('.datatable thead').on('input', '.search', function () {
                let strict = $(this).attr('strict') || false
                let value = strict && this.value ? "^" + this.value + "$" : this.value

                let index = $(this).parent().index()
                if (visibleColumnsIndexes !== null) {
                    index = visibleColumnsIndexes[index]
                }

                table
                    .column(index)
                    .search(value, strict)
                    .draw()
            });
            table.on('column-visibility.dt', function(e, settings, column, state) {
                visibleColumnsIndexes = []
                table.columns(":visible").every(function(colIdx) {
                    visibleColumnsIndexes.push(colIdx);
                });
            })
        })

    </script>
@endsection
