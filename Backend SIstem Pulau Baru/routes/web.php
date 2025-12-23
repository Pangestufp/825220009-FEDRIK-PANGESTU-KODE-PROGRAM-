<?php

use Illuminate\Support\Facades\Route;


Route::get('/login', function () {
    return response()->json([
        'message' => 'Unauthorized'
    ], 401);
})->name('login');

Route::get('/Ping', function () {
    return response()->json([
        'message' => 'true'
    ], 200);
});