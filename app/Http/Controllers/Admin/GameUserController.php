<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyGameUserRequest;
use App\Http\Requests\StoreGameUserRequest;
use App\Http\Requests\UpdateGameUserRequest;
use App\Models\GameUser;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class GameUserController extends Controller
{
    use CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('game_user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = GameUser::query()->select(sprintf('%s.*', (new GameUser)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'game_user_show';
                $editGate      = 'game_user_edit';
                $deleteGate    = 'game_user_delete';
                $crudRoutePart = 'game-users';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : '';
            });
            $table->editColumn('useruid', function ($row) {
                return $row->useruid ? $row->useruid : '';
            });
            $table->editColumn('userid', function ($row) {
                return $row->userid ? $row->userid : '';
            });

            $table->editColumn('admin', function ($row) {
                return $row->admin ? $row->admin : '';
            });
            $table->editColumn('adminlevel', function ($row) {
                return $row->adminlevel ? $row->adminlevel : '';
            });
            $table->editColumn('usequeue', function ($row) {
                return $row->usequeue ? $row->usequeue : '';
            });
            $table->editColumn('status', function ($row) {
                return $row->status ? $row->status : '';
            });
            $table->editColumn('leave', function ($row) {
                return $row->leave ? $row->leave : '';
            });

            $table->editColumn('usertype', function ($row) {
                return $row->usertype ? $row->usertype : '';
            });
            $table->editColumn('userip', function ($row) {
                return $row->userip ? $row->userip : '';
            });
            $table->editColumn('modiip', function ($row) {
                return $row->modiip ? $row->modiip : '';
            });

            $table->editColumn('point', function ($row) {
                return $row->point ? $row->point : '';
            });
            $table->editColumn('enpassword', function ($row) {
                return $row->enpassword ? $row->enpassword : '';
            });
            $table->editColumn('birth', function ($row) {
                return $row->birth ? $row->birth : '';
            });
            $table->editColumn('email', function ($row) {
                return $row->email ? $row->email : '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('admin.gameUsers.index');
    }

    public function create()
    {
        abort_if(Gate::denies('game_user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.gameUsers.create');
    }

    public function store(StoreGameUserRequest $request)
    {
        $gameUser = GameUser::create($request->all());

        return redirect()->route('admin.game-users.index');
    }

    public function edit(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.gameUsers.edit', compact('gameUser'));
    }

    public function update(UpdateGameUserRequest $request, GameUser $gameUser)
    {
        $gameUser->update($request->all());

        return redirect()->route('admin.game-users.index');
    }

    public function show(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.gameUsers.show', compact('gameUser'));
    }

    public function destroy(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $gameUser->delete();

        return back();
    }

    public function massDestroy(MassDestroyGameUserRequest $request)
    {
        $gameUsers = GameUser::find(request('ids'));

        foreach ($gameUsers as $gameUser) {
            $gameUser->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
