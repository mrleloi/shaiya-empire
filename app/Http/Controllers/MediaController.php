<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\SettingHome;
use App\Models\SettingMedium;
use Illuminate\Http\Request;

class MediaController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
        $this->setting = SettingMedium::query()->first();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $sql = 'SELECT [MobName]
         ,MAX([ActionTime]) AS LatestActionTime
    FROM [PS_GameLog].[dbo].[Boss_Death_Log]
    GROUP BY [MobName] ORDER BY MobName ASC;';
        $results = [];
        try {
            $results = \DB::connection('sqlsrv_gamelog')->select($sql);
        } catch (\Exception) {
            $results = [];
        }
        $results = collect($results);

        $settingsTime = $this->setting->content;
        $settingsTime = explode(',', $settingsTime);

        // Add color settings for boss names (you can adjust these mappings as needed)
        $bossColors = [
            // Add more boss color mappings as needed
        ];

        foreach ($results as $i => $boss) {
            $boss->RowIndex = $i + 1; // Index for each row
            $actionTime = Carbon::parse($boss->LatestActionTime); // Convert ActionTime to Carbon object
            $respawnHours = isset($settingsTime[$i]) ? (int) $settingsTime[$i] : 0; // Get respawn time from settings

            // Store action time and respawn hours for view
            $boss->actionTime = $actionTime;
            $boss->respawnHours = $respawnHours . ' giờ'; // Format for display

            // Format the action time as a readable date string
            $boss->formattedActionTime = $actionTime->format('d/m/Y H:i:s');

            // Store whether boss has special styling
            $boss->hasColor = isset($bossColors[$boss->MobName]);
            $boss->colorCode = $boss->hasColor ? $bossColors[$boss->MobName] : '';

            // Handle cases where respawn time is 0 (undefined)
            if ($respawnHours == 0) {
                $boss->timeWait = 'Chưa có dữ liệu';
                $boss->nextRespawnTimestamp = 'Chưa có dữ liệu';
                continue;
            }

            // Calculate the next respawn time
            $nextRespawnTime = clone $actionTime;
            $nextRespawnTime->addHours($respawnHours);

            // Store timestamp for JavaScript countdown
            $boss->nextRespawnTimestamp = $nextRespawnTime->timestamp * 1000; // Convert to milliseconds for JS

            // If the next respawn time is in the future, calculate time left
            $now = Carbon::now();
            if ($nextRespawnTime->greaterThan($now)) {
                $timeLeft = $nextRespawnTime->diff($now);

                // Format the remaining time in days, hours, and minutes
                if ($timeLeft->d > 0) {
                    $boss->timeWait = $timeLeft->format('%d ngày %h giờ %i phút');
                } else {
                    $boss->timeWait = $timeLeft->format('%h giờ %i phút');
                }
            } else {
                $boss->timeWait = 'Boss đã hồi sinh';
            }
        }

        return view('boss-time')
            ->with([
                'setting' => $this->setting,
                'bossList' => $results
            ]);
    }
}
