@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$loai_sp->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-3">
						<ul class="aside-menu">
							@foreach($loai as $l)
							<li><a href="{{route('loai-san-pham',$l->id)}}">{{ $l->name }}</a></li>
							@endforeach
						</ul>
					</div>
					<div class="col-sm-9">
						<div class="beta-products-list">
							<h4>Sản phẩm mới</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm thấy {{ count($sp_theoloai) }} kết quả</p>
								<div class="clearfix"></div>
							</div>

							<div class="row">
								@foreach($sp_theoloai as $s)
								<div class="col-sm-4" style="margin-top: 20px !important">
									<div class="single-item">
										<div class="single-item-header">
											<a href="{{route('chitietsanpham',$s->id)}}"><img style="height: 250px !important; " src="source/image/product/{{ $s->image }}" alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{ $s->name }}</p>
											<p class="single-item-price">
												@if($s->promotion_price == 0)
												<span class="flash-sale">{{ number_format($s->unit_price) }} đ</span>
												@else
												<span class="flash-del">{{ number_format($s->unit_price) }} đ</span>
												<span class="flash-sale">{{ number_format($s->promotion_price) }} đ</span>
												@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('them-gio-hang',$s->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham',$s->id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								@endforeach
								
							</div>
						</div> <!-- .beta-products-list -->
						<div style="margin-left: 0%"  class="row">{{ $sp_theoloai->links() }}</div>

						<div class="space50">&nbsp;</div>

						<div class="beta-products-list">
							<h4>Sản phẩm khác</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm thấy {{count($sp_khac)}} kết quả</p>
								<div class="clearfix"></div>
							</div>
							<div class="row">
								@foreach($sp_khac as $s)
								<div class="col-sm-4">
									<div class="single-item">
										<div class="single-item-header">
											<a href="{{ route('chitietsanpham',$s->id) }}"><img style="height: 250px;" src="source/image/product/{{ $s->image }}" alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{$s->name}}</p>
											<p class="single-item-price">
												@if($s->promotion_price == 0)
												<span class="flash-sale">{{ number_format($s->unit_price) }} đ</span>
												@else
												<span class="flash-del">{{ number_format($s->unit_price) }} đ</span>
												<span class="flash-sale">{{ number_format($s->promotion_price) }} đ</span>
												@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('them-gio-hang',$s->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{ route('chitietsanpham',$s->id) }}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								@endforeach
								
							</div>
							<div class="space40">&nbsp;</div>
							<div style="margin-left: 0%"  class="row">{{ $sp_khac->render() }}</div>
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection