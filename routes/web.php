<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::resource('product', App\Http\Controllers\ProductsController::class);
Route::resource('brand', App\Http\Controllers\BrandsController::class);
Route::resource('category', App\Http\Controllers\CategoriesController::class);
Route::resource('suppliers', App\Http\Controllers\SuppliersController::class);
Route::resource('warehouse', App\Http\Controllers\WarehousesController::class);
