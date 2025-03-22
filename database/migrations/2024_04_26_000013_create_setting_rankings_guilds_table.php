<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingRankingsGuildsTable extends Migration
{
    public function up()
    {
        Schema::create('setting_rankings_guilds', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->nullable();
            $table->string('header')->nullable();
            $table->integer('num_display')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
