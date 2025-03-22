<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuideFaqsTable extends Migration
{
    public function up()
    {
        Schema::create('guide_faqs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->nullable();
            $table->string('header')->nullable();
            $table->longText('question_general_content')->nullable();
            $table->longText('question_technical_content')->nullable();
            $table->longText('question_game_content')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
