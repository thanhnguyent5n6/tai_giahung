<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from thevectorlab.net/flatlab/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Aug 2015 03:42:50 GMT -->
<head>
    <meta charset="utf-8">
    <base href="{{ asset('') }}">
    <script type="text/javascript" src="{{ asset('backend/ckeditor/ckeditor.js') }}"></script>
    <script type="text/javascript" src="backend/js/jquery-3.3.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="backend/img/favicon.html">

    <title>Admin</title>

    <!-- Bootstrap core CSS -->
    <link href="backend/css/bootstrap.min.css" rel="stylesheet">
    <link href="backend/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="backend/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="backend/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="backend/css/owl.carousel.css" type="text/css">

      <!--right slidebar-->
      <link href="backend/css/slidebars.css" rel="stylesheet">

    <!-- Custom styles for this template -->

    <link href="backend/css/style.css" rel="stylesheet">
    <link href="backend/css/style-responsive.css" rel="stylesheet" />



    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="backend/js/html5shiv.js"></script>
      <script src="backend/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <section id="container" >
      <!--header start-->
      <header class="header white-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo">Quản<span>&nbsplý</span></a>
            <!--logo end-->
            <div class="top-nav ">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder="Search">
                    </li>
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="img/avatar1_small.jpg">
                            <span class="username">{{ Auth::user()->name }}</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li><a href="{{ url('admin/interface') }}"><i class=" fa fa-suitcase"></i>Profile</a></li>
                            <li><a href="{{ url('admin/interface') }}"><i class="fa fa-cog"></i> Settings</a></li>
                            <li><a href="{{ url('admin/interface') }}"><i class="fa fa-bell-o"></i> Notification</a></li>
                            <li><a href="{{ url('admin/logout') }}"><i class="fa fa-key"></i> Đăng xuất</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
      <!--header end-->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li>
                      <a href="{{ url('admin/interface') }}">
                          <i class="fa fa-dashboard"></i>
                          <span>Menu</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-laptop"></i>
                          <span>Sản phẩm</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="{{ route('ql-sp') }}">Quản lý sản phẩm</a></li>
                          <li><a  href="{{ route(('danh-muc-sp')) }}">Danh mục sản phẩm</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-shopping-cart"></i>
                          <span>Đơn hàng</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="{{route('don-hang')}}">Đơn mới</a></li>
                          <li><a  href="{{route('dang-giao-hang')}}">Đang giao hàng</a></li>
                          <li><a  href="{{route('thanh-cong')}}">Thành công</a></li>
                          <li><a  href="{{route('tra-lai')}}">Trả về</a></li>
                          <li><a  href="{{route('xoa-don-hang')}}">Thùng rác</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-envelope"></i>
                          <span>Tin tức - bài viết</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="{{route('tin-tuc')}}">Quản lý tin bài</a></li>
                          <li><a  href="{{ route('danh-muc-tin-tuc') }}">Quản lý danh mục tin tức</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-user"></i>
                          <span>Quản trị hệ thống</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="{{ route('quan-li-thanh-vien') }}">Thống kê doanh số</a></li>
                        <li><a  href="{{ route('quan-li-thanh-vien') }}">Quản lý thành viên</a></li>
                        <li><a  href="{{ route('quan-li-thanh-vien') }}">Quản lý kho</a></li>
                          
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-bar-chart-o"></i>
                          <span>Hình ảnh - Video</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="{{ route('quan-li-slide') }}">Quản lý slide</a></li>
                      </ul>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      <!--main content start-->
      @yield('content')
      <!--main content end-->

      <!-- Right Slidebar start -->
      
      <!-- Right Slidebar end -->

      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2018 &copy; FlatLab by Devpro.
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
  

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="backend/js/jquery.js"></script>
    <script src="backend/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="backend/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="backend/js/jquery.scrollTo.min.js"></script>
    <script src="backend/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="backend/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="backend/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="backend/js/owl.carousel.js" ></script>
    <script src="backend/js/jquery.customSelect.min.js" ></script>
    <script src="backend/js/respond.min.js" ></script>

    <!--right slidebar-->
    <script src="backend/js/slidebars.min.js"></script>

    <!--common script for all pages-->
    <script src="backend/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="backend/js/sparkline-chart.js"></script>
    <script src="backend/js/easy-pie-chart.js"></script>
    <script src="backend/js/count.js"></script>

  <script>

      //owl carousel

      $(document).ready(function() {
          $("#owl-demo").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true,
			  autoPlay:true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>

<!-- Mirrored from thevectorlab.net/flatlab/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Aug 2015 03:43:32 GMT -->
</html>
