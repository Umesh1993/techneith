<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\WeatherForecastInquiryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//public route
Route::post('/login', [AuthController::class, 'login']);
Route::get("unauthorized", [AuthController::class, 'unauthorized']);
	
Route::get('/get-weather-forecast', [WeatherForecastInquiryController::class, 'getWeatherForecast']);

//protected route
Route::group(['middleware' => 'auth:sanctum'], function(){
    
    //protected admin route
    Route::group(['middleware' => ['restrictRole:admin']], function(){
        Route::post('/register', [AuthController::class, 'register']);
        Route::post('insert-event', [AdminController::class, 'insert_event']);
        Route::put('update-event', [AdminController::class, 'update_event']);
        Route::get('event-view', [AdminController::class, 'event_details']);
        Route::delete('destroy/{id}', [AdminController::class, 'destroy']);
    });

    //protected buyer route
    Route::group(['middleware' => ['restrictRole:buyer']], function(){
        Route::get('view', [AdminController::class, 'event_details']);
    });
});
