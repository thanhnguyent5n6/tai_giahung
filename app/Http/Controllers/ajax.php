<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\CustomerAccount;
class ajax extends Controller
{
	public function Blur(Request req){
		$email = $req->email;
	    $result = CustomerAccount::where("email",$email);
	    $row = $result->count();
	    echo $row;
	}
}
