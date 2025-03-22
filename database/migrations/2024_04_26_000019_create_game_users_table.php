<?php
//
//use Illuminate\Database\Migrations\Migration;
//use Illuminate\Database\Schema\Blueprint;
//use Illuminate\Support\Facades\Schema;
//
//class CreateGameUsersTable extends Migration
//{
//    public function up()
//    {
//        Schema::create('game_users', function (Blueprint $table) {
//            $table->bigIncrements('id');
//            $table->integer('useruid')->nullable();
//            $table->string('userid')->nullable();
//            $table->string('pw')->nullable();
//            $table->datetime('joindate')->nullable();
//            $table->integer('admin')->nullable();
//            $table->integer('adminlevel')->nullable();
//            $table->integer('usequeue')->nullable();
//            $table->integer('status')->nullable();
//            $table->integer('leave')->nullable();
//            $table->datetime('leavedate')->nullable();
//            $table->string('usertype')->nullable();
//            $table->string('userip')->nullable();
//            $table->string('modiip')->nullable();
//            $table->datetime('modidate')->nullable();
//            $table->integer('point')->nullable();
//            $table->string('enpassword')->nullable();
//            $table->string('birth')->nullable();
//            $table->string('email')->nullable();
//            $table->timestamps();
//        });
//    }
//}
