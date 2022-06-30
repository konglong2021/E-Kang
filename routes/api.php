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
    Route::ApiResource('/profile','App\Http\Controllers\Api\ProfileController');
    Route::ApiResource('/transaction','App\Http\Controllers\Api\TransactionController');



    Route::post('/sales','App\Http\Controllers\Api\OrdersController@sale'); //update transaction by id




    //Search Route
    Route::post('/product/search',[App\Http\Controllers\Api\ProductsController::class,'index'])->name('product.search');
    Route::post('/category/search',[App\Http\Controllers\Api\CategoriesController::class,'index'])->name('category.search');
    Route::post('/brand/search',[App\Http\Controllers\Api\BrandsController::class,'index'])->name('brand.search');
    Route::post('/sale/search',[App\Http\Controllers\Api\OrdersController::class,'index'])->name('sale.search');
    Route::post('/stock/search',[App\Http\Controllers\Api\StockController::class,'index'])->name('stock.search');
    Route::post('/supplier/search',[App\Http\Controllers\Api\SuppliersController::class,'index'])->name('supplier.search');
    Route::post('/transaction/search',[App\Http\Controllers\Api\TransactionController::class,'getalltransaction']); // Start From and End

    //Report
    Route::get('/saletoday',[App\Http\Controllers\Api\OrdersController::class,'todaysale']); //today Sale
    Route::get('/saletoday/{date}',[App\Http\Controllers\Api\OrdersController::class,'daysale']); //search sale by date
    Route::get('/salemonth/{month}',[App\Http\Controllers\Api\OrdersController::class,'monthsale']); //search sale by date
    Route::get('/today',[App\Http\Controllers\Api\PurchasesController::class,'today']); // check record stock in by current day
    Route::get('/today/{date}',[App\Http\Controllers\Api\PurchasesController::class,'buytoday']); // check record stock in by date
    Route::get('/monthbuy/{month}',[App\Http\Controllers\Api\PurchasesController::class,'buymonth']); // check record stock in by date
    Route::get('/buysell/{today}',[App\Http\Controllers\Api\StockController::class,'buysell']); //check buy and sell by date rang



    //Delete Purchase and Order Items
    Route::delete('/purchase/delete/{purchase_id}',[App\Http\Controllers\Api\PurchasesController::class,'delete']);  //Delete Master and Master detail of table purchase
    Route::delete('/sale/delete/{order_id}',[App\Http\Controllers\Api\OrdersController::class,'delete']);  //Delete Master and Master detail of table Order


    //Check Stock
    Route::get('/stockout',[App\Http\Controllers\Api\StockController::class,'stockout']); //check stock transfer from warehouse to warehouse
    Route::get('/track/{id}',[App\Http\Controllers\Api\StockController::class,'stockTrack']); //Track Stock in
    
  
    Route::get('/stocksell',[App\Http\Controllers\Api\StockController::class,'stocksell']);     //check stock that total value bigger than 0
    Route::get('/stockbywarehouse/{warehouse_id}',[App\Http\Controllers\Api\StockController::class,'stockbywarehouse']);
    Route::get('/stockbywarehouse/{warehouse_id}/{search}',[App\Http\Controllers\Api\StockController::class,'searchstockbywarehouse']); // /api/stockbywarehouse/1/a3s
    Route::get('/stockbyproduct/{product_id}',[App\Http\Controllers\Api\StockController::class,'stockbyproduct']);
    Route::get('/log/{from}/{to}',[App\Http\Controllers\Api\ActivitylogsController::class,'log']);  //search log from date to date
    Route::get('/showbalance',[App\Http\Controllers\Api\BanlancesController::class,'showbalance']);  //check balance
    Route::get('/showlastunitprice/{product_id}',[App\Http\Controllers\Api\PurchasesController::class,'ShowLastUnitPrice']);  //show Last unit price
    Route::post('/stock/detail',[App\Http\Controllers\Api\StockController::class,'stockdetail']); //check stock by date rang
    
    
    


    //setting
    Route::post('/user/warehouse',[App\Http\Controllers\Api\ProfileController::class,'updatewarehouse']);//user update default warehouse
    Route::post('/balance/verifybalance',[App\Http\Controllers\Api\BanlancesController::class,'verifybalance']); // Cash Balance
    Route::post('/balance/withdrawal',[App\Http\Controllers\Api\BanlancesController::class,'withdrawal']); // Cash withdraw
    Route::post('/balance/income',[App\Http\Controllers\Api\BanlancesController::class,'income']); // Cash In
});



