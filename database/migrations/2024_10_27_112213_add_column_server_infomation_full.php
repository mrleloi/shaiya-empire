<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('setting_homes', function (Blueprint $table) {
            $table->longText('server_information_full')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
		//
    }
};
