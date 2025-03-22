<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingGeneralsTable extends Migration
{
    public function up()
    {
        Schema::create('setting_generals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('url_facebook')->nullable();
            $table->string('url_discord')->nullable();
            $table->longText('meta_des')->nullable();
            $table->string('meta_keyword')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
