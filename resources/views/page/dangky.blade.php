@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Đăng kí</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('trang-chu')}} ">Home</a> / <span>Đăng kí</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="container">
		<div id="content">
			
			<form action="{{route('dang-ky')}}" method="post" class="beta-form-checkout">
				<input hidden="hidden" type="text" name="_token" value="{{csrf_token()}}">
				<div class="row">
					@if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $e)
							{{$e}}
							@endforeach
						</div>
					@endif
					@if(Session::has('thanhcong'))
 						<div class="alert alert-success">{{ Session::get('thanhcong') }}</div>
					@endif
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<h4>Đăng kí</h4>
						<div class="space20">&nbsp;</div>

						
						<div class="form-block">
							<label for="email">Email*</label>
							<input type="email" id="email" name="email" required>
							<div id="check_blur" class="text-warning"></div>
						</div>

						<div class="form-block">
							<label for="your_last_name">Họ tên*</label>
							<input type="text" id="your_last_name" name="name" required>
						</div>

						<div class="form-block">
							<label for="adress">Địa chỉ*</label>
							<input type="text" id="adress" placeholder="Street Address"  name="address" required>
						</div>


						<div class="form-block">
							<label for="phone">Số điện thoại*</label>
							<input type="text" id="phone" name="phone" required>
						</div>
						<div class="form-block">
							<label for="phone">Mật khẩu*</label>
							<input type="text" id="phone" name="password" required>
						</div>
						<div class="form-block">
							<label for="phone">Nhập lại mật khẩu*</label>
							<input type="text" id="phone" name="repassword" required>
						</div>
						<div class="form-block">
							<button type="submit" class="btn btn-primary">Đăng ký</button>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#email").blur(function(){
				var email = $("#email").val;
				$.GET("ajax.php",{email:email},function(data){
					$("#check_blur").html = data;
				});
			});
		});
	</script>	
@endsection