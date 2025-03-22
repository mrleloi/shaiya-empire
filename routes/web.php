<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

require __DIR__.'/auth.php';

Route::any('/', [\App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::any('/pages/donate.php', [\App\Http\Controllers\DonateController::class, 'index'])->name('donate');

Route::any('/pages/info.php', [\App\Http\Controllers\ServerInfoController::class, 'index'])->name('server-info');

Route::any('/pages/download.php', [\App\Http\Controllers\DownloadController::class, 'index'])->name('download');

Route::any('/rank/ranking.php', [\App\Http\Controllers\RankingsPvpController::class, 'index'])->name('rankings-pvp');
Route::any('/rank/pvpall.php', [\App\Http\Controllers\RankingsPvpController::class, 'pvpall'])->name('rankings-pvpall');
Route::any('/rank/onlykill.php', [\App\Http\Controllers\RankingsPvpController::class, 'onlykill'])->name('rankings-onlykill');
Route::any('/rank/pvpday.php', [\App\Http\Controllers\RankingsPvpController::class, 'pvpday'])->name('rankings-pvpday');
Route::any('/rank/pvpweek.php', [\App\Http\Controllers\RankingsPvpController::class, 'pvpweek'])->name('rankings-pvpweek');

Route::any('/pages/bosstime.php', [\App\Http\Controllers\MediaController::class, 'index'])->name('media');

Route::any('/pages/quydinh.php', [\App\Http\Controllers\GuideRulesController::class, 'index'])->name('guide-rules');

Route::any('/pages/huongdan.php', [\App\Http\Controllers\GuideFaqsController::class, 'index'])->name('guide-faqs');

Route::any('/post-{id}', [\App\Http\Controllers\PostController::class, 'show'])->name('post');
//Route::any('/boss-record', [\App\Http\Controllers\BossRecordController::class, 'index'])->name('boss-record');
//Route::any('/guide-droplist', [\App\Http\Controllers\GuideDroplistController::class, 'index'])->name('guide-droplist');

//Route::any('/item-mall', [\App\Http\Controllers\ItemMallController::class, 'index'])->name('item-mall');
//Route::any('/vote', [\App\Http\Controllers\VoteController::class, 'index'])->name('vote');

require __DIR__.'/auth_admin.php';
require __DIR__.'/admin_dashboard.php';
require __DIR__.'/admin_frontend.php';
