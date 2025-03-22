<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Resources\Json\JsonResource;

class SettingHomeResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            $this->id,
            $this->title,
            $this->header,
            $this->events_title,
            $this->created_at,
            $this->updated_at,
            $this->deleted_at,
        ];
    }
}
