<?php

namespace App\Http\Controllers;

use App\Models\News;
use App\Models\SettingHome;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class ServerInfoController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = SettingHome::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('server-info')
            ->with([
                'setting' => $this->setting,
            ]);
    }
}
