<?php

namespace App\Http\Controllers;

use App\Models\News;
use App\Models\SettingHome;

class PostController extends Controller
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
    public function show($id)
    {
        $post = News::query()->with('media')->findOrFail($id);
        return view('post')
            ->with([
                'setting' => $this->setting,
                'post' => $post,
            ]);
    }
}
