<?php

namespace App\Http\Controllers;

use App\Models\SettingDownload;
use App\Models\SettingHome;
use Illuminate\Http\Request;

class DownloadController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = SettingDownload::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('download')
            ->with([
                'setting' => $this->setting
            ]);
    }
}
