<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyGameUserRequest;
use App\Http\Requests\StoreGameUserRequest;
use App\Http\Requests\UpdateGameUserRequest;
use App\Models\GameUser;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class GameUserController extends Controller
{
    use CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('game_user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $gameUsers = GameUser::all();

        return view('frontend.gameUsers.index', compact('gameUsers'));
    }

    public function create()
    {
        abort_if(Gate::denies('game_user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.gameUsers.create');
    }

    public function store(StoreGameUserRequest $request)
    {
        $gameUser = GameUser::create($request->all());

        return redirect()->route('frontend.game-users.index');
    }

    public function edit(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.gameUsers.edit', compact('gameUser'));
    }

    public function update(UpdateGameUserRequest $request, GameUser $gameUser)
    {
        $gameUser->update($request->all());

        return redirect()->route('frontend.game-users.index');
    }

    public function show(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('frontend.gameUsers.show', compact('gameUser'));
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
