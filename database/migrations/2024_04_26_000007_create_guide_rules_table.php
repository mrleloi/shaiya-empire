<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuideRulesTable extends Migration
{
    public function up()
    {
        Schema::create('guide_rules', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->nullable();
            $table->string('header')->nullable();
            $table->string('play_nice_policies_title')->nullable();
            $table->longText('play_nice_policies_content')->nullable();
            $table->string('tos_title')->nullable();
            $table->longText('tos_content')->nullable();
            $table->string('agreement_title')->nullable();
            $table->longText('agreement_content')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
