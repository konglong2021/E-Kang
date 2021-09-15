<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::ApiResource('/product','App\Http\Controllers\Api\ProductsController');
Route::ApiResource('/brand','App\Http\Controllers\Api\BrandsController');
Route::ApiResource('/category','App\Http\Controllers\Api\CategoriesController');
Route::ApiResource('/supplier','App\Http\Controllers\Api\SuppliersController');
Route::ApiResource('/warehouse','App\Http\Controllers\Api\WarehousesController');
Route::ApiResource('/customer','App\Http\Controllers\Api\CustomersController');
Route::ApiResource('/member','App\Http\Controllers\Api\MembersController');

// Route::post('/product/upload', ['App\Http\Controllers\Api\ProductsController','upload']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
