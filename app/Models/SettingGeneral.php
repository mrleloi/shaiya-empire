<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\File;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class SettingGeneral extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, HasFactory;

    public $table = 'setting_generals';

    protected $appends = [
        'icon',
        'background',
        'screenshots',
        'slides',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'title',
        'url_facebook',
        'url_discord',
        'meta_des',
        'meta_keyword',
        'video_url',
        'video_thumbnail',
        'carousel_videos',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $casts = [
        'carousel_videos' => 'array',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(300)
            ->height(200);

        $this->addMediaConversion('preview')
            ->width(800)
            ->height(600);
    }

    public function getIconAttribute()
    {
        $file = $this->getMedia('icon')->last();
        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl();
            $file->preview   = $file->getUrl();
        }

        return $file;
    }

    public function getBackgroundAttribute()
    {
        $file = $this->getMedia('background')->last();
        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl();
            $file->preview   = $file->getUrl();
        }

        return $file;
    }

    public function getScreenshotsAttribute()
    {
        $files = $this->getMedia('screenshots');
        $files->each(function ($item) {
            $item->url = $item->getUrl();
            $item->thumbnail = $item->getUrl('thumb');
            $item->preview = $item->getUrl('preview');
        });

        return $files;
    }

    public function getSlidesAttribute()
    {
        $files = $this->getMedia('slides');
        $files->each(function ($item) {
            $item->url = $item->getUrl();
            $item->thumbnail = $item->getUrl('thumb');
            $item->preview = $item->getUrl('preview');
        });

        return $files;
    }

    /**
     * Get YouTube video ID from URL
     */
    public function getYoutubeIdFromUrl($url = null)
    {
        $video_url = $url ?? $this->video_url;

        if (empty($video_url)) {
            return null;
        }

        $pattern = '/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i';
        preg_match($pattern, $video_url, $matches);

        return $matches[1] ?? null;
    }

    /**
     * Get YouTube video thumbnail
     */
    public function getVideoThumbnail($url = null, $custom_thumbnail = null)
    {
        $video_thumbnail = $custom_thumbnail ?? $this->video_thumbnail;

        if (!empty($video_thumbnail)) {
            return $video_thumbnail;
        }

        $youtubeId = $this->getYoutubeIdFromUrl($url);
        if ($youtubeId) {
            return 'https://i.ytimg.com/vi/' . $youtubeId . '/hqdefault.jpg';
        }

        return null;
    }

    /**
     * Get YouTube embed URL
     */
    public function getVideoEmbedUrl($url = null)
    {
        $video_url = $url ?? $this->video_url;
        $youtubeId = $this->getYoutubeIdFromUrl($video_url);

        if ($youtubeId) {
            return 'https://www.youtube.com/embed/' . $youtubeId . '?autoplay=1&autohide=1&border=0&egm=0&showinfo=0&showsearch=0&rel=0';
        }

        return $video_url;
    }

    /**
     * Get carousel videos array with extra info
     */
    public function getCarouselVideosWithInfo()
    {
        $videos = $this->carousel_videos ?? [];
        $result = [];

        if (!empty($videos) && is_array($videos)) {
            foreach ($videos as $video) {
                if (!empty($video['url'])) {
                    $video['embed_url'] = $this->getVideoEmbedUrl($video['url']);
                    $video['thumbnail'] = $this->getVideoThumbnail($video['url'], $video['thumbnail'] ?? null);
                    $result[] = $video;
                }
            }
        }

        return $result;
    }
}
