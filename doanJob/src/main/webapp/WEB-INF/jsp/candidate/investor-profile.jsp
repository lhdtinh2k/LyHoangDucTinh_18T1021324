<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Nhà đầu tư</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="/image/png" href="images/favicon.png">

    <!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="/plugins/animate-css/animate.css">
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/plugins/slick/slick.css">
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css">
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css">

</head>
<body>
<div class="body-inner">
    <!--/ Header end -->
    <div  class="banner-area" style=" width:100%;height:50px;background-image:url(/images/banner/banner1.jpg);">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="banner-heading">
                            <h2 class="banner-title" style="color: black;opacity: 1">Thông tin cá nhân</h2>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="main-container" class="main-container">
        <div class="container">
            <div class="row">

                <div class="col-xl-3 col-lg-4">
                    <div class="sidebar sidebar-left">
                        <div class="widget">
                            <h3 class="widget-title">Danh Mục</h3>
                            <ul class="nav service-menu">
                                <li class="active"><a href="/startup/userProfile">Thông tin của tôi</a></li>
                                    <li><a href="/startup/userListProject">Các dự án đang đầu tư</a></li>
                                    <li><a href="/startup/userListImage">Thông tin công ty</a></li>
                            </ul>
                        </div><!-- Widget end -->

                        <div class="widget">
                            <div class="quote-item quote-border">
                                <div class="quote-text-border">
                                    This is my quote.
                                </div>

                                <div class="quote-item-footer">
                                    <img loading="lazy" class="testimonial-thumb" src="/images/userImages/${user.avataruser}" alt="Ảnh đại diện">
                                    <div class="quote-item-info">
                                        <h3 class="quote-author">${user.fullname}</h3>
                                        <span class="quote-subtext">${user.job}</span>
                                    </div>
                                </div>
                            </div><!-- Quote item end -->

                        </div><!-- Widget end -->

                    </div><!-- Sidebar end -->
                </div><!-- Sidebar Col end -->

                <div class="col-xl-8 col-lg-8">
                    <div class="content-inner-page">
                        <h3 class="register-heading">Thông tin cá nhân</h3>
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Họ tên</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <p>${user.fullname}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Email</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <p>${user.email}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Số điện thoại</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <p>${user.phone}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Ngày sinh</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <p><fmt:formatDate pattern = "dd-MM-yyyy" value = "${user.birthday}" /></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Chuyên môn</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <p>${user.job}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="general-btn text-center">
                                            <a class="btn btn-primary" href="/startup/updateProfile">Chỉnh sửa thông tin cá nhân</a>
                                        </div>
                                    </div>
                                </div><!-- Content row end -->
                            </div><!-- Conatiner end -->
                            <!-- Main container end -->
                        </div><!-- Content inner end -->
                    </div><!-- Content Col end -->
                </div><!-- Content Col end -->
            </div><!-- Main row end -->
        </div><!-- Conatiner end -->
    </section><!-- Main container end -->
    <!-- Javascript Files
    ================================================== -->
    <!-- initialize jQuery Library -->
    <script src="/plugins/jQuery/jquery.min.js"></script>
    <!-- Bootstrap jQuery -->
    <script src="/plugins/bootstrap/bootstrap.min.js" defer></script>
    <!-- Slick Carousel -->
    <script src="/plugins/slick/slick.min.js"></script>
    <script src="/plugins/slick/slick-animation.min.js"></script>
    <!-- Color box -->
    <script src="/plugins/colorbox/jquery.colorbox.js"></script>
    <!-- shuffle -->
    <script src="/plugins/shuffle/shuffle.min.js" defer></script>
    <!-- Google Map API Key-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
    <!-- Google Map Plugin-->
    <script src="/plugins/google-map/map.js" defer></script>
    <!-- Template custom -->
    <script src="/js/script.js"></script>
</div><!-- Body inner end -->
</body>

</html>