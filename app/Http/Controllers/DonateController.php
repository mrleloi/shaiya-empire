<?php

namespace App\Http\Controllers;

use App\Models\SettingDonate;
use App\Models\SettingHome;
use Illuminate\Http\Request;

class DonateController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->setting = SettingDonate::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('donate')
            ->with([
                'setting' => $this->setting
            ]);
    }
}
