<?php

namespace App\Http\Controllers;

use App\Models\GuideFaq;
use App\Models\SettingHome;
use Illuminate\Http\Request;

class GuideFaqsController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = GuideFaq::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('guide-faqs')
            ->with([
                'setting' => $this->setting
            ]);
    }
}
