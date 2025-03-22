@extends('layouts.admin')
@section('content')
    @can('game_user_create')
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <a class="btn btn-success" href="{{ route('admin.game-users.create') }}">
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
            <table class=" table table-bordered table-striped table-hover ajaxTable datatable datatable-GameUser">
                <thead>
                <tr>
                    <th width="10">

                    </th>
                    <th>
                        {{ trans('cruds.gameUser.fields.rowid') }}
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
            </table>
        </div>
    </div>



@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
                @can('game_user_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}';
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.game-users.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    var ids = $.map(dt.rows({ selected: true }).data(), function (entry) {
                        return entry.rowid
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

            let dtOverrideGlobals = {
                    buttons: dtButtons,
                    processing: true,
                    serverSide: true,
                    retrieve: true,
                    aaSorting: [],
                    ajax: "{{ route('admin.game-users.index') }}",
                    columns: [
                        { data: 'placeholder', name: 'placeholder' },
                        { data: 'id', name: 'RowID' },
                        { data: 'UserUID', name: 'UserUID' },
                        { data: 'UserID', name: 'UserID' },
                        { data: 'JoinDate', name: 'JoinDate' },
                        { data: 'Admin', name: 'Admin' },
                        { data: 'AdminLevel', name: 'AdminLevel' },
                        { data: 'UseQueue', name: 'UseQueue' },
                        { data: 'Status', name: 'Status' },
                        { data: 'Leave', name: 'Leave' },
                        { data: 'LeaveDate', name: 'LeaveDate' },
                        { data: 'UserType', name: 'UserType' },
                        { data: 'UserIp', name: 'UserIp' },
                        { data: 'ModiIp', name: 'ModiIp' },
                        { data: 'ModiDate', name: 'ModiDate' },
                        { data: 'Point', name: 'Point' },
                        { data: 'Enpassword', name: 'Enpassword' },
                        { data: 'Birth', name: 'Birth' },
                        { data: 'Email', name: 'Email' },
                        { data: 'actions', name: '{{ trans('global.actions') }}' }
                    ],
                    orderCellsTop: true,
                    order: [[ 1, 'desc' ]],
                    pageLength: 100,
                };
            let table = $('.datatable-GameUser').DataTable(dtOverrideGlobals);
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
        });

    </script>
@endsection
