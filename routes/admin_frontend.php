<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'frontend', 'as' => 'frontend.', 'namespace' => 'Frontend', 'middleware' => ['auth:admin', 'admin', 'verified']], function () {
    Route::get('/home', 'HomeController@index')->name('home');

    // Permissions
    Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');
    Route::resource('permissions', 'PermissionsController');

    // Roles
    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');
    Route::resource('roles', 'RolesController');

    // Users
    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');
    Route::resource('users', 'UsersController');

    // Setting General
    Route::delete('setting-generals/destroy', 'SettingGeneralController@massDestroy')->name('setting-generals.massDestroy');
    Route::post('setting-generals/media', 'SettingGeneralController@storeMedia')->name('setting-generals.storeMedia');
    Route::post('setting-generals/ckmedia', 'SettingGeneralController@storeCKEditorImages')->name('setting-generals.storeCKEditorImages');
    Route::resource('setting-generals', 'SettingGeneralController');

    // Setting Home
    Route::delete('setting-homes/destroy', 'SettingHomeController@massDestroy')->name('setting-homes.massDestroy');
    Route::post('setting-homes/media', 'SettingHomeController@storeMedia')->name('setting-homes.storeMedia');
    Route::post('setting-homes/ckmedia', 'SettingHomeController@storeCKEditorImages')->name('setting-homes.storeCKEditorImages');
    Route::resource('setting-homes', 'SettingHomeController');

    // Guide Rules
    Route::delete('guide-rules/destroy', 'GuideRulesController@massDestroy')->name('guide-rules.massDestroy');
    Route::post('guide-rules/media', 'GuideRulesController@storeMedia')->name('guide-rules.storeMedia');
    Route::post('guide-rules/ckmedia', 'GuideRulesController@storeCKEditorImages')->name('guide-rules.storeCKEditorImages');
    Route::resource('guide-rules', 'GuideRulesController');

    // Guide Droplist
    Route::delete('guide-droplists/destroy', 'GuideDroplistController@massDestroy')->name('guide-droplists.massDestroy');
    Route::post('guide-droplists/media', 'GuideDroplistController@storeMedia')->name('guide-droplists.storeMedia');
    Route::post('guide-droplists/ckmedia', 'GuideDroplistController@storeCKEditorImages')->name('guide-droplists.storeCKEditorImages');
    Route::resource('guide-droplists', 'GuideDroplistController');

    // Guide Faqs
    Route::delete('guide-faqs/destroy', 'GuideFaqsController@massDestroy')->name('guide-faqs.massDestroy');
    Route::post('guide-faqs/media', 'GuideFaqsController@storeMedia')->name('guide-faqs.storeMedia');
    Route::post('guide-faqs/ckmedia', 'GuideFaqsController@storeCKEditorImages')->name('guide-faqs.storeCKEditorImages');
    Route::resource('guide-faqs', 'GuideFaqsController');

    // Setting Media
    Route::delete('setting-media/destroy', 'SettingMediaController@massDestroy')->name('setting-media.massDestroy');
    Route::post('setting-media/media', 'SettingMediaController@storeMedia')->name('setting-media.storeMedia');
    Route::post('setting-media/ckmedia', 'SettingMediaController@storeCKEditorImages')->name('setting-media.storeCKEditorImages');
    Route::resource('setting-media', 'SettingMediaController');

    // Setting Item Mall
    Route::delete('setting-item-malls/destroy', 'SettingItemMallController@massDestroy')->name('setting-item-malls.massDestroy');
    Route::post('setting-item-malls/media', 'SettingItemMallController@storeMedia')->name('setting-item-malls.storeMedia');
    Route::post('setting-item-malls/ckmedia', 'SettingItemMallController@storeCKEditorImages')->name('setting-item-malls.storeCKEditorImages');
    Route::resource('setting-item-malls', 'SettingItemMallController');

    // Setting Rankings Pv P
    Route::delete('setting-rankings-pv-ps/destroy', 'SettingRankingsPvPController@massDestroy')->name('setting-rankings-pv-ps.massDestroy');
    Route::resource('setting-rankings-pv-ps', 'SettingRankingsPvPController');

    // Setting Rankings Guild
    Route::delete('setting-rankings-guilds/destroy', 'SettingRankingsGuildController@massDestroy')->name('setting-rankings-guilds.massDestroy');
    Route::resource('setting-rankings-guilds', 'SettingRankingsGuildController');

    // Setting Download
    Route::delete('setting-downloads/destroy', 'SettingDownloadController@massDestroy')->name('setting-downloads.massDestroy');
    Route::post('setting-downloads/media', 'SettingDownloadController@storeMedia')->name('setting-downloads.storeMedia');
    Route::post('setting-downloads/ckmedia', 'SettingDownloadController@storeCKEditorImages')->name('setting-downloads.storeCKEditorImages');
    Route::resource('setting-downloads', 'SettingDownloadController');

    // Supports
    Route::delete('supports/destroy', 'SupportsController@massDestroy')->name('supports.massDestroy');
    Route::post('supports/media', 'SupportsController@storeMedia')->name('supports.storeMedia');
    Route::post('supports/ckmedia', 'SupportsController@storeCKEditorImages')->name('supports.storeCKEditorImages');
    Route::resource('supports', 'SupportsController');

    // Setting Donate
    Route::delete('setting-donates/destroy', 'SettingDonateController@massDestroy')->name('setting-donates.massDestroy');
    Route::post('setting-donates/media', 'SettingDonateController@storeMedia')->name('setting-donates.storeMedia');
    Route::post('setting-donates/ckmedia', 'SettingDonateController@storeCKEditorImages')->name('setting-donates.storeCKEditorImages');
    Route::resource('setting-donates', 'SettingDonateController');

    // Setting Boss Record
    Route::delete('setting-boss-records/destroy', 'SettingBossRecordController@massDestroy')->name('setting-boss-records.massDestroy');
    Route::resource('setting-boss-records', 'SettingBossRecordController');

    // Setting Vote
    Route::delete('setting-votes/destroy', 'SettingVoteController@massDestroy')->name('setting-votes.massDestroy');
    Route::post('setting-votes/media', 'SettingVoteController@storeMedia')->name('setting-votes.storeMedia');
    Route::post('setting-votes/ckmedia', 'SettingVoteController@storeCKEditorImages')->name('setting-votes.storeCKEditorImages');
    Route::resource('setting-votes', 'SettingVoteController');

    // Game User
    Route::delete('game-users/destroy', 'GameUserController@massDestroy')->name('game-users.massDestroy');
    Route::resource('game-users', 'GameUserController');

    Route::get('frontend/profile', 'ProfileController@index')->name('profile.index');
    Route::post('frontend/profile', 'ProfileController@update')->name('profile.update');
    Route::post('frontend/profile/destroy', 'ProfileController@destroy')->name('profile.destroy');
    Route::post('frontend/profile/password', 'ProfileController@password')->name('profile.password');
});
