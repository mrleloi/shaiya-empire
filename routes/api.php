<?php

Route::group(['prefix' => 'v1', 'as' => 'api.', 'namespace' => 'Api\V1\Admin', 'middleware' => ['auth:sanctum']], function () {
    // Permissions
    Route::apiResource('permissions', 'PermissionsApiController');

    // Roles
    Route::apiResource('roles', 'RolesApiController');

    // Users
    Route::apiResource('users', 'UsersApiController');

    // Setting General
    Route::post('setting-generals/media', 'SettingGeneralApiController@storeMedia')->name('setting-generals.storeMedia');
    Route::apiResource('setting-generals', 'SettingGeneralApiController');

    // Setting Home
    Route::post('setting-homes/media', 'SettingHomeApiController@storeMedia')->name('setting-homes.storeMedia');
    Route::apiResource('setting-homes', 'SettingHomeApiController');

    // Guide Rules
    Route::post('guide-rules/media', 'GuideRulesApiController@storeMedia')->name('guide-rules.storeMedia');
    Route::apiResource('guide-rules', 'GuideRulesApiController');

    // Guide Droplist
    Route::post('guide-droplists/media', 'GuideDroplistApiController@storeMedia')->name('guide-droplists.storeMedia');
    Route::apiResource('guide-droplists', 'GuideDroplistApiController');

    // Guide Faqs
    Route::post('guide-faqs/media', 'GuideFaqsApiController@storeMedia')->name('guide-faqs.storeMedia');
    Route::apiResource('guide-faqs', 'GuideFaqsApiController');

    // Setting Media
    Route::post('setting-media/media', 'SettingMediaApiController@storeMedia')->name('setting-media.storeMedia');
    Route::apiResource('setting-media', 'SettingMediaApiController');

    // Setting Item Mall
    Route::post('setting-item-malls/media', 'SettingItemMallApiController@storeMedia')->name('setting-item-malls.storeMedia');
    Route::apiResource('setting-item-malls', 'SettingItemMallApiController');

    // Setting Rankings Pv P
    Route::apiResource('setting-rankings-pv-ps', 'SettingRankingsPvPApiController');

    // Setting Rankings Guild
    Route::apiResource('setting-rankings-guilds', 'SettingRankingsGuildApiController');

    // Setting Download
    Route::post('setting-downloads/media', 'SettingDownloadApiController@storeMedia')->name('setting-downloads.storeMedia');
    Route::apiResource('setting-downloads', 'SettingDownloadApiController');

    // Supports
    Route::post('supports/media', 'SupportsApiController@storeMedia')->name('supports.storeMedia');
    Route::apiResource('supports', 'SupportsApiController');

    // Setting Donate
    Route::post('setting-donates/media', 'SettingDonateApiController@storeMedia')->name('setting-donates.storeMedia');
    Route::apiResource('setting-donates', 'SettingDonateApiController');

    // Setting Boss Record
    Route::apiResource('setting-boss-records', 'SettingBossRecordApiController');

    // Setting Vote
    Route::post('setting-votes/media', 'SettingVoteApiController@storeMedia')->name('setting-votes.storeMedia');
    Route::apiResource('setting-votes', 'SettingVoteApiController');

    // Game User
    Route::apiResource('game-users', 'GameUserApiController');
});
