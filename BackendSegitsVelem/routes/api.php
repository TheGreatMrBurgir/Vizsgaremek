<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AdminOrderController;
use App\Http\Controllers\MessageController;

// Nyitott auth végpontok
Route::post('/register', [AuthController::class, 'register'])->withoutMiddleware('auth:sanctum');
Route::post('/login',    [AuthController::class, 'login'])->withoutMiddleware('auth:sanctum');

// Publikus
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{id}', [ProductController::class, 'show']);
Route::post('/products', [ProductController::class, 'store']);
Route::put('/products/{id}', [ProductController::class, 'update']);
Route::delete('/products/{id}', [ProductController::class, 'destroy']);
//Route::post('/messages', [MessageController::class, 'store']); // NEM /contact
Route::post('/contact', [MessageController::class, 'store']);

// Bejelentkezett / Admin-only
Route::middleware('auth:sanctum')->group(function () {
    // User + logout
    Route::put('/changepassword', [AuthController::class, 'passwordReset']);
    Route::get('/user', fn(Request $r) => $r->user());
    Route::post('/logout', function (Request $r) {
        $r->user()->tokens()->delete();
        return response()->json(['message' => 'Kijelentkezve']);
    });

    // Saját rendelések
    Route::get('/orders', [OrderController::class, 'index']);
    Route::post('/orders', [OrderController::class, 'store']);

    // Admin-only
    Route::get('/admin/orders', [AdminOrderController::class, 'index']);
    Route::put('/admin/orders/{id}/approve', [AdminOrderController::class, 'approve']);
    Route::put('/admin/orders/{id}/reject', [AdminOrderController::class, 'reject']);
    Route::get('/admin/messages', [MessageController::class, 'index']);
});
