<?php

namespace App\Http\Controllers;

use App\Models\GuideRule;
use App\Models\SettingHome;
use Illuminate\Http\Request;

class GuideRulesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = GuideRule::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('guide-rules')
            ->with([
                'setting' => $this->setting
            ]);
    }
}
