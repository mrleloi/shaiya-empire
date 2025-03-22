<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        $permissions = [
            [
                'id'    => 1,
                'title' => 'user_management_access',
            ],
            [
                'id'    => 2,
                'title' => 'permission_create',
            ],
            [
                'id'    => 3,
                'title' => 'permission_edit',
            ],
            [
                'id'    => 4,
                'title' => 'permission_show',
            ],
            [
                'id'    => 5,
                'title' => 'permission_delete',
            ],
            [
                'id'    => 6,
                'title' => 'permission_access',
            ],
            [
                'id'    => 7,
                'title' => 'role_create',
            ],
            [
                'id'    => 8,
                'title' => 'role_edit',
            ],
            [
                'id'    => 9,
                'title' => 'role_show',
            ],
            [
                'id'    => 10,
                'title' => 'role_delete',
            ],
            [
                'id'    => 11,
                'title' => 'role_access',
            ],
            [
                'id'    => 12,
                'title' => 'user_create',
            ],
            [
                'id'    => 13,
                'title' => 'user_edit',
            ],
            [
                'id'    => 14,
                'title' => 'user_show',
            ],
            [
                'id'    => 15,
                'title' => 'user_delete',
            ],
            [
                'id'    => 16,
                'title' => 'user_access',
            ],
            [
                'id'    => 17,
                'title' => 'sites_setting_access',
            ],
            [
                'id'    => 18,
                'title' => 'setting_general_create',
            ],
            [
                'id'    => 19,
                'title' => 'setting_general_edit',
            ],
            [
                'id'    => 20,
                'title' => 'setting_general_show',
            ],
            [
                'id'    => 21,
                'title' => 'setting_general_delete',
            ],
            [
                'id'    => 22,
                'title' => 'setting_general_access',
            ],
            [
                'id'    => 23,
                'title' => 'setting_home_create',
            ],
            [
                'id'    => 24,
                'title' => 'setting_home_edit',
            ],
            [
                'id'    => 25,
                'title' => 'setting_home_show',
            ],
            [
                'id'    => 26,
                'title' => 'setting_home_delete',
            ],
            [
                'id'    => 27,
                'title' => 'setting_home_access',
            ],
            [
                'id'    => 28,
                'title' => 'guide_rule_create',
            ],
            [
                'id'    => 29,
                'title' => 'guide_rule_edit',
            ],
            [
                'id'    => 30,
                'title' => 'guide_rule_show',
            ],
            [
                'id'    => 31,
                'title' => 'guide_rule_delete',
            ],
            [
                'id'    => 32,
                'title' => 'guide_rule_access',
            ],
            [
                'id'    => 33,
                'title' => 'guide_droplist_create',
            ],
            [
                'id'    => 34,
                'title' => 'guide_droplist_edit',
            ],
            [
                'id'    => 35,
                'title' => 'guide_droplist_show',
            ],
            [
                'id'    => 36,
                'title' => 'guide_droplist_delete',
            ],
            [
                'id'    => 37,
                'title' => 'guide_droplist_access',
            ],
            [
                'id'    => 38,
                'title' => 'guide_faq_create',
            ],
            [
                'id'    => 39,
                'title' => 'guide_faq_edit',
            ],
            [
                'id'    => 40,
                'title' => 'guide_faq_show',
            ],
            [
                'id'    => 41,
                'title' => 'guide_faq_delete',
            ],
            [
                'id'    => 42,
                'title' => 'guide_faq_access',
            ],
            [
                'id'    => 43,
                'title' => 'setting_medium_create',
            ],
            [
                'id'    => 44,
                'title' => 'setting_medium_edit',
            ],
            [
                'id'    => 45,
                'title' => 'setting_medium_show',
            ],
            [
                'id'    => 46,
                'title' => 'setting_medium_delete',
            ],
            [
                'id'    => 47,
                'title' => 'setting_medium_access',
            ],
            [
                'id'    => 48,
                'title' => 'setting_item_mall_create',
            ],
            [
                'id'    => 49,
                'title' => 'setting_item_mall_edit',
            ],
            [
                'id'    => 50,
                'title' => 'setting_item_mall_show',
            ],
            [
                'id'    => 51,
                'title' => 'setting_item_mall_delete',
            ],
            [
                'id'    => 52,
                'title' => 'setting_item_mall_access',
            ],
            [
                'id'    => 53,
                'title' => 'setting_rankings_pv_p_create',
            ],
            [
                'id'    => 54,
                'title' => 'setting_rankings_pv_p_edit',
            ],
            [
                'id'    => 55,
                'title' => 'setting_rankings_pv_p_show',
            ],
            [
                'id'    => 56,
                'title' => 'setting_rankings_pv_p_delete',
            ],
            [
                'id'    => 57,
                'title' => 'setting_rankings_pv_p_access',
            ],
            [
                'id'    => 58,
                'title' => 'setting_rankings_guild_create',
            ],
            [
                'id'    => 59,
                'title' => 'setting_rankings_guild_edit',
            ],
            [
                'id'    => 60,
                'title' => 'setting_rankings_guild_show',
            ],
            [
                'id'    => 61,
                'title' => 'setting_rankings_guild_delete',
            ],
            [
                'id'    => 62,
                'title' => 'setting_rankings_guild_access',
            ],
            [
                'id'    => 63,
                'title' => 'setting_download_create',
            ],
            [
                'id'    => 64,
                'title' => 'setting_download_edit',
            ],
            [
                'id'    => 65,
                'title' => 'setting_download_show',
            ],
            [
                'id'    => 66,
                'title' => 'setting_download_delete',
            ],
            [
                'id'    => 67,
                'title' => 'setting_download_access',
            ],
            [
                'id'    => 68,
                'title' => 'support_create',
            ],
            [
                'id'    => 69,
                'title' => 'support_edit',
            ],
            [
                'id'    => 70,
                'title' => 'support_show',
            ],
            [
                'id'    => 71,
                'title' => 'support_delete',
            ],
            [
                'id'    => 72,
                'title' => 'support_access',
            ],
            [
                'id'    => 73,
                'title' => 'setting_donate_create',
            ],
            [
                'id'    => 74,
                'title' => 'setting_donate_edit',
            ],
            [
                'id'    => 75,
                'title' => 'setting_donate_show',
            ],
            [
                'id'    => 76,
                'title' => 'setting_donate_delete',
            ],
            [
                'id'    => 77,
                'title' => 'setting_donate_access',
            ],
            [
                'id'    => 78,
                'title' => 'setting_boss_record_create',
            ],
            [
                'id'    => 79,
                'title' => 'setting_boss_record_edit',
            ],
            [
                'id'    => 80,
                'title' => 'setting_boss_record_show',
            ],
            [
                'id'    => 81,
                'title' => 'setting_boss_record_delete',
            ],
            [
                'id'    => 82,
                'title' => 'setting_boss_record_access',
            ],
            [
                'id'    => 83,
                'title' => 'setting_vote_create',
            ],
            [
                'id'    => 84,
                'title' => 'setting_vote_edit',
            ],
            [
                'id'    => 85,
                'title' => 'setting_vote_show',
            ],
            [
                'id'    => 86,
                'title' => 'setting_vote_delete',
            ],
            [
                'id'    => 87,
                'title' => 'setting_vote_access',
            ],
            [
                'id'    => 88,
                'title' => 'game_user_create',
            ],
            [
                'id'    => 89,
                'title' => 'game_user_edit',
            ],
            [
                'id'    => 90,
                'title' => 'game_user_show',
            ],
            [
                'id'    => 91,
                'title' => 'game_user_delete',
            ],
            [
                'id'    => 92,
                'title' => 'game_user_access',
            ],
            [
                'id'    => 93,
                'title' => 'profile_password_edit',
            ],
        ];

        Permission::insert($permissions);
    }
}
