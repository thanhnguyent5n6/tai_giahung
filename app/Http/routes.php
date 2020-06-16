<?php
use App\Providers\Gate;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

//Route::auth();

Route::get('/home', 'HomeController@index');

include_once(app_path() . '/Http/routes/login.php');
include_once(app_path() . '/Http/routes/admin.php');
include_once(app_path() . '/Http/routes/portal.php');
