<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingHomesTable extends Migration
{
    public function up()
    {
        Schema::create('setting_homes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->nullable();
            $table->string('header')->nullable();
            $table->string('events_title')->nullable();
            $table->longText('events_content')->nullable();
            $table->string('announcement_title')->nullable();
            $table->longText('announcement_content')->nullable();
            $table->longText('content_server_info')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
