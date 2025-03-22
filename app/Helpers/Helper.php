<?php

namespace App\Helpers;

class Helper
{
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
