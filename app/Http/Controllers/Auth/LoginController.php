<?php


namespace App\Http\Controllers\Auth;


use App\CustomerAccount;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $this->validate($request,
            [
                'username'=>'required|max:20',
                'password'=>'required|min:6|max:20',
            ],
            [
                'username.required'=>'Vui lòng nhập tên đăng nhập/email',
                'username.max'=>'Tên đăng nhập/email không quá 20 ký tự',
                'password.required'=>'Bạn chưa nhập mật khẩu',
                'password.min'=>'Mật khẩu tối thiểu 6 ký tự',
                'password.max'=>'Mật khẩu tối đa 20 ký tự'
            ]);


        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            return redirect()->route('admin.index');
        }
        return redirect()->back();
    }

    public function signUp()
    {
        return view('page.dangky');
    }

    public function postSignup(Request $req)
    {
        $this->validate($req,
            [
                'email'=>'required|email|unique:customer_account,email',
                'password'=>'required|min:6|max:20|',
                'name'=>'required',
                'repassword'=>'required|same:password|'
            ],
            [
                'email.required'=>'Vui lòng nhập',
                'email.email'=>'Không đúng định dạng email',
                'email.unique'=>'Email đã có người sử dụng',
                'password.required'=>'Nhập mật khẩu',
                'repassword.same'=>'Mật khẩu không giống nhau',
                'password.min'=>'Mật khẩu tối thiểu 6 ký tự',
                'password.max'=>'Mật khẩu tối đa 20 ký tự'
            ]);
        $user = new CustomerAccount;

        $user->email = $req->email;
        $user->name = $req->name;
        $user->password = Hash::make($req->password);
        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect()->back()->with('thanhcong','Tạo tài khoản thành công');
    }

    public function signIn()
    {
        return view('page.dangnhap');
    }

    public function postSignin(Request $req)
    {
        $email = isset($req->email) ? $req->email : '';
        $password = isset($req->password) ? $req->password : '';
        $this->validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:6|max:20',
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'password.required'=>'Vui lòng nhập password',
                'email.email'=>'Nhập không đúng định dạng',
                'password.min'=>'Mật khẩu trên 6 ký tự',
                'password.max'=>'Mật khẩu dưới 20 ký tự',
            ]);
        $credentials = array('email'=>$req->email,'password'=>$req->password);
        $check = DB::table('customer_account')->select('name','email','password')->get();

        foreach($check as $values)
        {
            if(Hash::check($password,$values->password) && $email = $values->email)
            {
                session()->put('dangnhap',$values);
                return redirect()->back()->with(['flag'=>'success','message'=>'Đăng nhập thành công']);
            }
            else
            {
                return redirect()->back()->with(['flag'=>'danger','message'=>'Đăng nhập không thành công']);
            }
        }
    }
    public function postSignout()
    {
        Session::forget('dangnhap');

        return redirect()->route('trang-chu');
    }
}