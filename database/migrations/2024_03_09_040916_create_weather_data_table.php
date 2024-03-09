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
        Schema::create('weather_data', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('dt');
            $table->datetime('dt_txt');
            $table->string('berlin_description');
            $table->string('berlin_main');
            $table->string('london_description');
            $table->string('london_main');
            $table->string('new_york_description');
            $table->string('new_york_main');
            $table->string('paris_description');
            $table->string('paris_main');
            $table->string('tokyo_description');
            $table->string('tokyo_main');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('weather_data');
    }
};
