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
    Route::ApiResource('/stock','App\Http\Controllers\Api\StockController');
    Route::ApiResource('/sale','App\Http\Controllers\Api\OrdersController');
    Route::ApiResource('/setting','App\Http\Controllers\Api\SettingsController');
    Route::ApiResource('/log','App\Http\Controllers\Api\ActivitylogsController');
    Route::ApiResource('/balance','App\Http\Controllers\Api\BanlancesController');

    //Search Route
    Route::post('/product/search',[App\Http\Controllers\Api\ProductsController::class,'index'])->name('product.search');
    Route::post('/category/search',[App\Http\Controllers\Api\CategoriesController::class,'index'])->name('category.search');
    Route::post('/brand/search',[App\Http\Controllers\Api\BrandsController::class,'index'])->name('brand.search');
    Route::post('/sale/search',[App\Http\Controllers\Api\OrdersController::class,'index'])->name('sale.search');
    Route::post('/stock/search',[App\Http\Controllers\Api\StockController::class,'index'])->name('stock.search');
    

    //Delete Purchase Items
    Route::post('/purchase/delete/{purchase_id}',[App\Http\Controllers\Api\PurchasesController::class,'delete']);  //Delete Master and Master detail of table purchase


    //Check Stock
    Route::get('/stockout',[App\Http\Controllers\Api\StockController::class,'stockout']); //check stock transfer from warehouse to warehouse
    Route::get('/today',[App\Http\Controllers\Api\PurchasesController::class,'today']); // check record stock in by current day
    Route::get('/stocksell',[App\Http\Controllers\Api\StockController::class,'stocksell']);     //check stock that total value bigger than 0
    Route::get('/stockbywarehouse/{warehouse_id}',[App\Http\Controllers\Api\StockController::class,'stockbywarehouse']);
    Route::get('/stockbyproduct/{product_id}',[App\Http\Controllers\Api\StockController::class,'stockbyproduct']);
    Route::get('/log/{from}/{to}',[App\Http\Controllers\Api\ActivitylogsController::class,'log']);  //search log from date to date
    Route::get('/showbalance',[App\Http\Controllers\Api\BanlancesController::class,'showbalance']);  //search log from date to date

});



