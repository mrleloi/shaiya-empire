<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => ['auth:admin', 'admin']], function () {
    Route::get('/dashboard', 'HomeController@index')->name('dashboard');
});

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth:admin', 'admin', 'verified']], function () {
    Route::get('/', 'HomeController@index')->name('home');

    // Permissions
    Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');
    Route::post('permissions/parse-csv-import', 'PermissionsController@parseCsvImport')->name('permissions.parseCsvImport');
    Route::post('permissions/process-csv-import', 'PermissionsController@processCsvImport')->name('permissions.processCsvImport');
    Route::resource('permissions', 'PermissionsController');

    // Roles
    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');
    Route::post('roles/parse-csv-import', 'RolesController@parseCsvImport')->name('roles.parseCsvImport');
    Route::post('roles/process-csv-import', 'RolesController@processCsvImport')->name('roles.processCsvImport');
    Route::resource('roles', 'RolesController');

    // Users
    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');
    Route::post('users/parse-csv-import', 'UsersController@parseCsvImport')->name('users.parseCsvImport');
    Route::post('users/process-csv-import', 'UsersController@processCsvImport')->name('users.processCsvImport');
    Route::resource('users', 'UsersController');

    // Setting General
    Route::delete('setting-generals/destroy', 'SettingGeneralController@massDestroy')->name('setting-generals.massDestroy');
    Route::post('setting-generals/media', 'SettingGeneralController@storeMedia')->name('setting-generals.storeMedia');
    Route::post('setting-generals/ckmedia', 'SettingGeneralController@storeCKEditorImages')->name('setting-generals.storeCKEditorImages');
    Route::post('setting-generals/parse-csv-import', 'SettingGeneralController@parseCsvImport')->name('setting-generals.parseCsvImport');
    Route::post('setting-generals/process-csv-import', 'SettingGeneralController@processCsvImport')->name('setting-generals.processCsvImport');
    Route::resource('setting-generals', 'SettingGeneralController');

    // Setting Home
    Route::delete('setting-homes/destroy', 'SettingHomeController@massDestroy')->name('setting-homes.massDestroy');
    Route::post('setting-homes/media', 'SettingHomeController@storeMedia')->name('setting-homes.storeMedia');
    Route::post('setting-homes/ckmedia', 'SettingHomeController@storeCKEditorImages')->name('setting-homes.storeCKEditorImages');
    Route::post('setting-homes/parse-csv-import', 'SettingHomeController@parseCsvImport')->name('setting-homes.parseCsvImport');
    Route::post('setting-homes/process-csv-import', 'SettingHomeController@processCsvImport')->name('setting-homes.processCsvImport');
    Route::resource('setting-homes', 'SettingHomeController');

    // Guide Rules
    Route::delete('guide-rules/destroy', 'GuideRulesController@massDestroy')->name('guide-rules.massDestroy');
    Route::post('guide-rules/media', 'GuideRulesController@storeMedia')->name('guide-rules.storeMedia');
    Route::post('guide-rules/ckmedia', 'GuideRulesController@storeCKEditorImages')->name('guide-rules.storeCKEditorImages');
    Route::post('guide-rules/parse-csv-import', 'GuideRulesController@parseCsvImport')->name('guide-rules.parseCsvImport');
    Route::post('guide-rules/process-csv-import', 'GuideRulesController@processCsvImport')->name('guide-rules.processCsvImport');
    Route::resource('guide-rules', 'GuideRulesController');

    // Guide Droplist
    Route::delete('guide-droplists/destroy', 'GuideDroplistController@massDestroy')->name('guide-droplists.massDestroy');
    Route::post('guide-droplists/media', 'GuideDroplistController@storeMedia')->name('guide-droplists.storeMedia');
    Route::post('guide-droplists/ckmedia', 'GuideDroplistController@storeCKEditorImages')->name('guide-droplists.storeCKEditorImages');
    Route::post('guide-droplists/parse-csv-import', 'GuideDroplistController@parseCsvImport')->name('guide-droplists.parseCsvImport');
    Route::post('guide-droplists/process-csv-import', 'GuideDroplistController@processCsvImport')->name('guide-droplists.processCsvImport');
    Route::resource('guide-droplists', 'GuideDroplistController');

    // Guide Faqs
    Route::delete('guide-faqs/destroy', 'GuideFaqsController@massDestroy')->name('guide-faqs.massDestroy');
    Route::post('guide-faqs/media', 'GuideFaqsController@storeMedia')->name('guide-faqs.storeMedia');
    Route::post('guide-faqs/ckmedia', 'GuideFaqsController@storeCKEditorImages')->name('guide-faqs.storeCKEditorImages');
    Route::post('guide-faqs/parse-csv-import', 'GuideFaqsController@parseCsvImport')->name('guide-faqs.parseCsvImport');
    Route::post('guide-faqs/process-csv-import', 'GuideFaqsController@processCsvImport')->name('guide-faqs.processCsvImport');
    Route::resource('guide-faqs', 'GuideFaqsController');

    // Setting Media
    Route::delete('setting-media/destroy', 'SettingMediaController@massDestroy')->name('setting-media.massDestroy');
    Route::post('setting-media/media', 'SettingMediaController@storeMedia')->name('setting-media.storeMedia');
    Route::post('setting-media/ckmedia', 'SettingMediaController@storeCKEditorImages')->name('setting-media.storeCKEditorImages');
    Route::post('setting-media/parse-csv-import', 'SettingMediaController@parseCsvImport')->name('setting-media.parseCsvImport');
    Route::post('setting-media/process-csv-import', 'SettingMediaController@processCsvImport')->name('setting-media.processCsvImport');
    Route::resource('setting-media', 'SettingMediaController');

    // Setting Item Mall
    Route::delete('setting-item-malls/destroy', 'SettingItemMallController@massDestroy')->name('setting-item-malls.massDestroy');
    Route::post('setting-item-malls/media', 'SettingItemMallController@storeMedia')->name('setting-item-malls.storeMedia');
    Route::post('setting-item-malls/ckmedia', 'SettingItemMallController@storeCKEditorImages')->name('setting-item-malls.storeCKEditorImages');
    Route::post('setting-item-malls/parse-csv-import', 'SettingItemMallController@parseCsvImport')->name('setting-item-malls.parseCsvImport');
    Route::post('setting-item-malls/process-csv-import', 'SettingItemMallController@processCsvImport')->name('setting-item-malls.processCsvImport');
    Route::resource('setting-item-malls', 'SettingItemMallController');

    // Setting Rankings Pv P
    Route::delete('setting-rankings-pv-ps/destroy', 'SettingRankingsPvPController@massDestroy')->name('setting-rankings-pv-ps.massDestroy');
    Route::post('setting-rankings-pv-ps/parse-csv-import', 'SettingRankingsPvPController@parseCsvImport')->name('setting-rankings-pv-ps.parseCsvImport');
    Route::post('setting-rankings-pv-ps/process-csv-import', 'SettingRankingsPvPController@processCsvImport')->name('setting-rankings-pv-ps.processCsvImport');
    Route::resource('setting-rankings-pv-ps', 'SettingRankingsPvPController');

    // Setting Rankings Guild
    Route::delete('setting-rankings-guilds/destroy', 'SettingRankingsGuildController@massDestroy')->name('setting-rankings-guilds.massDestroy');
    Route::post('setting-rankings-guilds/parse-csv-import', 'SettingRankingsGuildController@parseCsvImport')->name('setting-rankings-guilds.parseCsvImport');
    Route::post('setting-rankings-guilds/process-csv-import', 'SettingRankingsGuildController@processCsvImport')->name('setting-rankings-guilds.processCsvImport');
    Route::resource('setting-rankings-guilds', 'SettingRankingsGuildController');

    // Setting Download
    Route::delete('setting-downloads/destroy', 'SettingDownloadController@massDestroy')->name('setting-downloads.massDestroy');
    Route::post('setting-downloads/media', 'SettingDownloadController@storeMedia')->name('setting-downloads.storeMedia');
    Route::post('setting-downloads/ckmedia', 'SettingDownloadController@storeCKEditorImages')->name('setting-downloads.storeCKEditorImages');
    Route::post('setting-downloads/parse-csv-import', 'SettingDownloadController@parseCsvImport')->name('setting-downloads.parseCsvImport');
    Route::post('setting-downloads/process-csv-import', 'SettingDownloadController@processCsvImport')->name('setting-downloads.processCsvImport');
    Route::resource('setting-downloads', 'SettingDownloadController');

    // Supports
    Route::delete('supports/destroy', 'SupportsController@massDestroy')->name('supports.massDestroy');
    Route::post('supports/media', 'SupportsController@storeMedia')->name('supports.storeMedia');
    Route::post('supports/ckmedia', 'SupportsController@storeCKEditorImages')->name('supports.storeCKEditorImages');
    Route::post('supports/parse-csv-import', 'SupportsController@parseCsvImport')->name('supports.parseCsvImport');
    Route::post('supports/process-csv-import', 'SupportsController@processCsvImport')->name('supports.processCsvImport');
    Route::resource('supports', 'SupportsController');

    // Setting Donate
    Route::delete('setting-donates/destroy', 'SettingDonateController@massDestroy')->name('setting-donates.massDestroy');
    Route::post('setting-donates/media', 'SettingDonateController@storeMedia')->name('setting-donates.storeMedia');
    Route::post('setting-donates/ckmedia', 'SettingDonateController@storeCKEditorImages')->name('setting-donates.storeCKEditorImages');
    Route::post('setting-donates/parse-csv-import', 'SettingDonateController@parseCsvImport')->name('setting-donates.parseCsvImport');
    Route::post('setting-donates/process-csv-import', 'SettingDonateController@processCsvImport')->name('setting-donates.processCsvImport');
    Route::resource('setting-donates', 'SettingDonateController');

    // Setting Boss Record
    Route::delete('setting-boss-records/destroy', 'SettingBossRecordController@massDestroy')->name('setting-boss-records.massDestroy');
    Route::post('setting-boss-records/media', 'SettingBossRecordController@storeMedia')->name('setting-boss-records.storeMedia');
    Route::post('setting-boss-records/ckmedia', 'SettingBossRecordController@storeCKEditorImages')->name('setting-boss-records.storeCKEditorImages');
    Route::post('setting-boss-records/parse-csv-import', 'SettingBossRecordController@parseCsvImport')->name('setting-boss-records.parseCsvImport');
    Route::post('setting-boss-records/process-csv-import', 'SettingBossRecordController@processCsvImport')->name('setting-boss-records.processCsvImport');
    Route::resource('setting-boss-records', 'SettingBossRecordController');

    // Setting Vote
    Route::delete('setting-votes/destroy', 'SettingVoteController@massDestroy')->name('setting-votes.massDestroy');
    Route::post('setting-votes/media', 'SettingVoteController@storeMedia')->name('setting-votes.storeMedia');
    Route::post('setting-votes/ckmedia', 'SettingVoteController@storeCKEditorImages')->name('setting-votes.storeCKEditorImages');
    Route::post('setting-votes/parse-csv-import', 'SettingVoteController@parseCsvImport')->name('setting-votes.parseCsvImport');
    Route::post('setting-votes/process-csv-import', 'SettingVoteController@processCsvImport')->name('setting-votes.processCsvImport');
    Route::resource('setting-votes', 'SettingVoteController');

    // News
    Route::delete('newss/destroy', 'NewsController@massDestroy')->name('newss.massDestroy');
    Route::post('newss/media', 'NewsController@storeMedia')->name('newss.storeMedia');
    Route::post('newss/ckmedia', 'NewsController@storeCKEditorImages')->name('newss.storeCKEditorImages');
//    Route::resource('newss', 'NewsController');
    Route::get('newss', 'NewsController@index')->name('newss.index');       // Hiển thị danh sách các bài viết
    Route::get('newss/create', 'NewsController@create')->name('newss.create');  // Form tạo bài viết mới
    Route::post('newss', 'NewsController@store')->name('newss.store');      // Lưu bài viết mới
    Route::get('newss/{news}', 'NewsController@show')->name('newss.show');      // Hiển thị chi tiết bài viết
    Route::get('newss/{news}/edit', 'NewsController@edit')->name('newss.edit');  // Form chỉnh sửa bài viết
    Route::put('newss/{news}', 'NewsController@update')->name('newss.update');  // Cập nhật bài viết
    Route::delete('newss/{news}', 'NewsController@destroy')->name('newss.destroy');

    // Game User
//    Route::delete('game-users/destroy', 'GameUserController@massDestroy')->name('game-users.massDestroy');
//    Route::post('game-users/parse-csv-import', 'GameUserController@parseCsvImport')->name('game-users.parseCsvImport');
//    Route::post('game-users/process-csv-import', 'GameUserController@processCsvImport')->name('game-users.processCsvImport');
//    Route::resource('game-users', 'GameUserController');

    Route::get('messenger', 'MessengerController@index')->name('messenger.index');
    Route::get('messenger/create', 'MessengerController@createTopic')->name('messenger.createTopic');
    Route::post('messenger', 'MessengerController@storeTopic')->name('messenger.storeTopic');
    Route::get('messenger/inbox', 'MessengerController@showInbox')->name('messenger.showInbox');
    Route::get('messenger/outbox', 'MessengerController@showOutbox')->name('messenger.showOutbox');
    Route::get('messenger/{topic}', 'MessengerController@showMessages')->name('messenger.showMessages');
    Route::delete('messenger/{topic}', 'MessengerController@destroyTopic')->name('messenger.destroyTopic');
    Route::post('messenger/{topic}/reply', 'MessengerController@replyToTopic')->name('messenger.reply');
    Route::get('messenger/{topic}/reply', 'MessengerController@showReply')->name('messenger.showReply');
});
