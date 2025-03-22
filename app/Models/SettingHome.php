<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class SettingHome extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, HasFactory;

    public $table = 'setting_homes';

    protected $appends = [
        'logo',
//        'slide_images',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'title',
        'header',
        'events_title',
//        'events_content',
//        'announcement_title',
//        'announcement_content',
        'content_server_info',
        'server_information_full',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb');
        $this->addMediaConversion('preview');
//        $this->addMediaConversion('thumb')->fit('crop', 50, 50);
//        $this->addMediaConversion('preview')->fit('crop', 120, 120);
    }

    public function getLogoAttribute()
    {
        $file = $this->getMedia('logo')->last();
        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl();
            $file->preview   = $file->getUrl();
//            $file->thumbnail = $file->getUrl('thumb');
//            $file->preview   = $file->getUrl('preview');
        }

        return $file;
    }

    /*public function getSlideImagesAttribute()
    {
        $files = $this->getMedia('slide_images');
        $files->each(function ($item) {
            $item->url       = $item->getUrl();
            $item->thumbnail = $item->getUrl();
            $item->preview   = $item->getUrl();
//            $item->thumbnail = $item->getUrl('thumb');
//            $item->preview   = $item->getUrl('preview');
        });

        return $files;
    }*/
}
