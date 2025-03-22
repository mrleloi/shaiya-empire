<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\DAO\RankDAO;

class Helper
{
    public static function getOnlineStats()
    {
        // Cache online statistics for 5 minutes to reduce database load
        return Cache::remember('online_stats', 300, function () {
            $stats = [
                'dark' => 0,
                'light' => 0,
                'total' => 0,
                'dark_percent' => 0,
                'light_percent' => 0
            ];

            // Query for AoL faction (Country = 1)
            $sql_online_light = 'SELECT
                COUNT(*) OVER() AS TotalCount
                FROM PS_GameData.dbo.Chars c
                INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
                INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
                WHERE um.Status >= 0
                AND c.Del = 0
                AND um.Leave = 1
                AND umg.Country = 1;';

            try {
                $results = DB::connection('sqlsrv_gamedata')->select($sql_online_light);
                $stats['light'] = !empty($results) ? $results[0]->TotalCount : 0;
            } catch (\Exception $e) {
                $stats['light'] = 0;
            }

            // Query for UoF faction (Country = 0)
            $sql_online_dark = 'SELECT
                COUNT(*) OVER() AS TotalCount
                FROM PS_GameData.dbo.Chars c
                INNER JOIN PS_UserData.dbo.Users_Master um ON um.UserUID = c.UserUID
                INNER JOIN PS_GameData.dbo.UserMaxGrow umg ON umg.UserUID = um.UserUID AND umg.ServerID = 1
                WHERE um.Status >= 0
                AND c.Del = 0
                AND um.Leave = 1
                AND umg.Country = 0;';

            try {
                $results = DB::connection('sqlsrv_gamedata')->select($sql_online_dark);
                $stats['dark'] = !empty($results) ? $results[0]->TotalCount : 0;
            } catch (\Exception $e) {
                $stats['dark'] = 0;
            }

            // Calculate total and percentages
            $stats['total'] = $stats['dark'] + $stats['light'];

            if ($stats['total'] > 0) {
                $stats['dark_percent'] = (int)($stats['dark'] / $stats['total'] * 100);
                $stats['light_percent'] = 100 - $stats['dark_percent'];
            } else {
                $stats['dark_percent'] = 50;
                $stats['light_percent'] = 50;
            }

            return $stats;
        });
    }

    public static function getTopPlayers($limit = 5)
    {
        // Cache top players for 15 minutes
        return Cache::remember('top_players', 900, function () use ($limit) {
            $rank_DAO = new \App\Http\Controllers\DAO\RankDAO();

            // Get AoL top players
            $aol_criteria = [
                'level' => 0,
                'class' => 0,
                'faction' => 1,
                'page' => 0,
                'pageSize' => $limit,
                'pageOrder' => 'K1',
                'pageDirection' => 'DESC'
            ];

            $aol_players = $rank_DAO->getCharacterRanks($aol_criteria);

            // Get UoF top players
            $uof_criteria = [
                'level' => 0,
                'class' => 0,
                'faction' => 2,
                'page' => 0,
                'pageSize' => $limit,
                'pageOrder' => 'K1',
                'pageDirection' => 'DESC'
            ];

            $uof_players = $rank_DAO->getCharacterRanks($uof_criteria);

            return [
                'aol' => $aol_players,
                'uof' => $uof_players
            ];
        });
    }

    public static $STATUS_ON = '1';
    public static $STATUS_OFF = '0';

    /*public static function convertGameClass($classId)
    {
        switch ($classId) {
            case 0:
                return 2;
            case 1:
                return 5;
            case 2:
                return 1;
            case 3:
                return 0;
            case 4:
                return 3;
            case 5:
                return 4;
        }
        return $classId;
    }*/
    /**
     * Convert game class ID to CSS class name
     */
    public static function convertGameClass($classId)
    {
        $classMap = [
            0 => 'cbds', // Fighter/Warrior
            1 => 'vbgs', // Defender/Guardian
            2 => 'stts', // Ranger/Assassin
            3 => 'ctts', // Archer/Hunter
            4 => 'pstp', // Mage/Pagan
            5 => 'tstt', // Priest/Oracle
        ];

        return isset($classMap[$classId]) ? $classMap[$classId] : 'cbds';
    }

    /**
     * Get the class image filename based on class ID
     */
    public static function getClassImageName($classId)
    {
        // Map class IDs to their image filenames
        $classImageMap = [
            // Fighter/Warrior
            0 => 'cbds',
            // Defender/Guardian
            1 => 'vbgs',
            // Ranger/Assassin
            2 => 'stts',
            // Archer/Hunter
            3 => 'ctts',
            // Mage/Pagan
            4 => 'pstp',
            // Priest/Oracle
            5 => 'tstt',
        ];

        return isset($classImageMap[$classId]) ? $classImageMap[$classId] : 'cbds';
    }

    public static function clearXSS($string)
    {
        $string = nl2br($string);
        $string = trim(strip_tags($string));
        $string = self::removeScripts($string);

        return $string;
    }

    public static function removeScripts($str)
    {
        $regex =
            '/(<link[^>]+rel="[^"]*stylesheet"[^>]*>)|' .
            '<script[^>]*>.*?<\/script>|' .
            '<style[^>]*>.*?<\/style>|' .
            '<!--.*?-->/is';

        return preg_replace($regex, '', $str);
    }

    public static function decodeText($str)
    {
        $encoding_list = "ISO-8859-1, ISO-8859-15, ISO-8859-9, Windows-1252, Windows-1254, ASCII, Windows-1250, Windows-1251, Windows-1253, Windows-1255, Windows-1256, Windows-1257, Windows-1258, KOI8-R, Big5, GB2312, GBK, Shift_JIS, EUC-KR, ISO-8859-2, UTF-8";
        $ls = explode(',', $encoding_list);
        foreach($ls as $i => $v) {
            $encoder = trim($v);
            try {
                $converted = iconv('UTF-8', $encoder, $str);
                return $converted;
            } catch (\Exception $e) {
                continue;
            }
        }
        return $str;
    }
}
