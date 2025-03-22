<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreGameUserRequest;
use App\Http\Requests\UpdateGameUserRequest;
use App\Http\Resources\Admin\GameUserResource;
use App\Models\GameUser;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class GameUserApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('game_user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GameUserResource(GameUser::all());
    }

    public function store(StoreGameUserRequest $request)
    {
        $gameUser = GameUser::create($request->all());

        return (new GameUserResource($gameUser))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new GameUserResource($gameUser);
    }

    public function update(UpdateGameUserRequest $request, GameUser $gameUser)
    {
        $gameUser->update($request->all());

        return (new GameUserResource($gameUser))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(GameUser $gameUser)
    {
        abort_if(Gate::denies('game_user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $gameUser->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
