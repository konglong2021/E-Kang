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

//Public Route
Route::post('/login',[App\Http\Controllers\Api\UsersController::class,'login']);
//Route::ApiResource('/brand','App\Http\Controllers\Api\BrandsController');
//Route::ApiResource('/category','App\Http\Controllers\Api\CategoriesController');
//Route::ApiResource('/product','App\Http\Controllers\Api\ProductsController');
//Route::ApiResource('/purchase','App\Http\Controllers\Api\PurchasesController');


// Route::post('/product/upload', ['App\Http\Controllers\Api\ProductsController','upload']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Authentication
Route::group(['middleware' => ['auth:sanctum']],function(){

    Route::post('/logout',[App\Http\Controllers\Api\UsersController::class,'logout']);
    Route::ApiResource('/brand','App\Http\Controllers\Api\BrandsController');
    Route::ApiResource('/product','App\Http\Controllers\Api\ProductsController');
    Route::ApiResource('/category','App\Http\Controllers\Api\CategoriesController');
    Route::ApiResource('/supplier','App\Http\Controllers\Api\SuppliersController');
    Route::ApiResource('/warehouse','App\Http\Controllers\Api\WarehousesController');
    Route::ApiResource('/customer','App\Http\Controllers\Api\CustomersController');
    Route::ApiResource('/member','App\Http\Controllers\Api\MembersController');
    Route::ApiResource('/user','App\Http\Controllers\Api\UsersController');
    Route::ApiResource('/purchase','App\Http\Controllers\Api\PurchasesController');
    Route::ApiResource('/permission','App\Http\Controllers\Api\PermissionsController');
    Route::ApiResource('/role','App\Http\Controllers\Api\RolesController');

    //Search Route
    Route::post('/product/search',[App\Http\Controllers\Api\ProductsController::class,'index'])->name('product.search');
    Route::post('/category/search',[App\Http\Controllers\Api\CategoriesController::class,'index'])->name('category.search');
    Route::post('/brand/search',[App\Http\Controllers\Api\BrandsController::class,'index'])->name('brand.search');
});



