<?php

namespace App\Http\Controllers;

use App\Models\News;
use App\Models\SettingHome;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class HomeController extends Controller
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
        $articles = News::query()->with('media')->where('type', 'news')->orderBy('publish_at', 'desc')->get();
        $events = News::query()->with('media')->where('type', 'events')->orderBy('publish_at', 'desc')->get();
        return view('home')
            ->with([
                'setting' => $this->setting,
                'articles' => $articles,
                'events' => $events,
            ]);
    }
}
