<?php
Route::get('/login','Auth\LoginController@index')->name('login');
Route::post('/login','Auth\LoginController@login')->name('post.login');