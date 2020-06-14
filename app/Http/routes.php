<?php
use App\Providers\Gate;
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

Route::get('/', function () {
    return view('index');
});
Route::get('index',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex',
]);
Route::get('product-type/{type}',[
	'as'=>'loai-san-pham',
	'uses'=>'PageController@getProductType',
]);
Route::get('about',[
	'as'=>'gioi-thieu',
	'uses'=>'PageController@getAbout',
]);
Route::get('contacts',[
	'as'=>'lien-he',
	'uses'=>'PageController@getContacts',
]);
Route::get('product/{id}',[
	'as'=>'chitietsanpham',
	'uses'=>'PageController@getProductDetail',
]);
Route::get('add-to-cart/{id}',[
	'as'=>'them-gio-hang',
	'uses'=>'PageController@getAddToCart',
]);
Route::post('add-to-cart/{id}',[
	'as'=>'them-gio-hang',
	'uses'=>'PageController@postAddToCart',
]);
Route::get('delete-cart/{id}',[
	'as'=>'xoa-gio-hang',
	'uses'=>'PageController@getDelItemCart',
]);

Route::get('checkout','Portal\CheckoutController@getCheckout')->name('checkout');
Route::post('post-checkout','Portal\CheckoutController@postCheckout')->name('post.checkout');

Route::get('signup','Portal\LoginController@getSignup')->name('dang-ky');
Route::post('post-signup','Portal\LoginController@postSignup')->name('dang-ky');
Route::get('signin','Portal\LoginController@getSignin')->name('dang-nhap');
Route::post('post-signin','Portal\LoginController@postSignin')->name('dang-nhap');
Route::get('signout','Portal\LoginController@postSignout')->name('dang-xuat');

Route::get('search',[
	'as'=>'tim-kiem',
	'uses'=>'PageController@getSearch',
]);

Route::get('/home','PageController@getIndex');
Route::get('','PageController@getIndex');
// ------------------admin -------------------------------
Route::auth();
Route::get('admin', function(){
	// di chuyển đến route admin/user
	return redirect(url('admin/interface'));
});
Route::group(array('prefix'=>'admin','middleware'=>'auth'),function(){
	Route::get('logout',function(){
		Auth::logout();
		return redirect('login');
	});
    Route::post('register', 'AdminAuth\AuthController@register');

    Route::get('/admin', 'AdminController@index');
	Route::get('interface',[
		'as'=>'quan-li',
		'uses'=>'AdminController@getInterface',
	]);
	Route::get('product',[
		'as'=>'ql-sp',
		'uses'=>'AdminController@getProduct',
	]);

	Route::get('product/{id}','AdminController@getProductByCategory');

	Route::get('product-type/{id}',[
		'as'=>'sp-theo-loai',
		'uses'=>"AdminController@getProductType",
	]);
	Route::get('delete-product/{id}',[
		'as'=>'xoa-sp',
		'uses'=>'AdminController@getDelProduct',
	]);
	Route::get('edit-product/{id}',[
		'as'=>'sua-sp',
		'uses'=>'AdminController@getEditProduct',
	]);
	Route::post('edit-product/{id}',[
		'as'=>'sua-sp',
		'uses'=>'AdminController@postEditProduct',
	]);
	Route::get('category',[
		'as'=>'danh-muc-sp',
		'uses'=>'AdminController@getCategory'
	]);
	Route::get('add-product',[
		'as'=>'them-sp',
		'uses'=>'AdminController@getAddProduct',
	]);
	Route::post('add-product',[
		'as'=>'them-sp',
		'uses'=>'AdminController@postAddProduct',
	]);
	Route::get('search-product',[
		'as'=>'tim-kiem-sp',
		'uses'=>'AdminController@getSearchProduct',
	]);
	// -------------- Danh muc san pham --------------------
	Route::get('edit-category/{id}',[
		'as'=>'sua-danh-muc',
		'uses'=>'AdminController@getEditCategory'
	]);
	Route::post('edit-category/{id}',[
		'as'=>'sua-danh-muc',
		'uses'=>'AdminController@postEditCategory'
	]);
	Route::get('edit-category',[
		'as'=>'them-danh-muc',
		'uses'=>'AdminController@getAddCategory'
	]);
	Route::post('edit-category',[
		'as'=>'them-danh-muc',
		'uses'=>'AdminController@postAddCategory'
	]);
	Route::get('delete-category/{id}',[
		'as'=>'xoa-danh-muc',
		'uses'=>'AdminController@getDelCategory'
	]);
	// -------------- Đơn hàng --------------------
	Route::get('bill',[
		'as'=>'don-hang',
		'uses'=>'AdminController@getBill',
	]);
	Route::get('delete-bill/{id}',[
		'as'=>'xoa-don-hang',
		'uses'=>'AdminController@getDelBill',
	]);
	Route::get('bill_detail/{id}',[
		'as'=>'chi-tiet-don-hang',
		'uses'=>'AdminController@getBillDetail',
	]);
	Route::post('change-bill/{status}','AdminController@changeStatusBill');

	Route::get('bill-deploying',[
		'as'=>'dang-giao-hang',
		'uses'=>'AdminController@getBillDeploying',
	]);
	Route::get('bill-success',[
		'as'=>'thanh-cong',
		'uses'=>'AdminController@getBillSuccess',
	]);
	Route::get('bill-false',[
		'as'=>'tra-lai',
		'uses'=>'AdminController@getBillFalse',
	]);
	Route::get('bill-destroy',[
		'as'=>'xoa-don-hang',
		'uses'=>'AdminController@getBillDestroy',
	]);
	// -------------- Tin tức --------------------
	Route::get('news',[
		'as'=>'tin-tuc',
		'uses'=>'AdminController@getNews'
	]);
	Route::get('edit-news/{id}',[
		'as'=>'sua-tin-tuc',
		'uses'=>'AdminController@getEditNews',
	]);
	Route::post('edit-news/{id}',[
		'as'=>'sua-tin-tuc',
		'uses'=>'AdminController@postEditNews',
	]);
	Route::get('delete-news/{id}',[
		'as'=>'xoa-bai-viet',
		'uses'=>'AdminController@getDelNews',
	]);
	Route::get('add-news',[
		'as'=>'them-tin-tuc',
		'uses'=>'AdminController@getAddNews',
	]);
	Route::post('add-news',[
		'as'=>'them-tin-tuc',
		'uses'=>'AdminController@postAddNews',
	]);
	Route::get('category-news',[
		'as'=>'danh-muc-tin-tuc',
		'uses'=>'AdminController@getCategoryNews',
	]);
	
	Route::get('slide',[
		'as'=>'quan-li-slide',
		'uses'=>'AdminController@getSlide',
	]);
	Route::get('edit-slide/{id}',[
		'as'=>'sua-slide',
		'uses'=>'AdminController@getEditSlide',
	]);
	Route::post('edit-slide/{id}',[
		'as'=>'sua-slide',
		'uses'=>'AdminController@postEditSlide',
	]);
	Route::get('add-slide',[
		'as'=>'them-slide',
		'uses'=>'AdminController@getAddSlide',
	]);
	Route::post('add-slide',[
		'as'=>'them-slide',
		'uses'=>'AdminController@postAddSlide',
	]);
	Route::get('delete-slide/{id}',[
		'as'=>'xoa-slide',
		'uses'=>'AdminController@getDelSlide'
	]);
	// ------------------------- Super ------------------
	Route::get('user',[
		'as'=>'quan-li-thanh-vien',
		'uses'=>'AdminController@getUser',
	])->middleware(['can:super']);
});

Route::auth();

Route::get('/home', 'HomeController@index');
