<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Sự kiện</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="image/png" href="/ndt/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,400i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="/ndt/css/normalize.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/ndt/css/stylee.css" />
    <link rel="stylesheet" href="/ndt/css/ext/bxslider/jquery.bxslider.css" />
    <link rel="stylesheet" href="/ndt/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/ndt/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/ndt/css/jquery.fancybox-1.3.1.css" media="screen" />
    <script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <link rel="stylesheet" href="/ndt/css/customize.css" />
    <link rel="stylesheet" href="/ndt/css/default.css" />

    <!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/ndt/plugins/bootstrap/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/ndt/plugins/fontawesome/css/all.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="/ndt/plugins/animate-css/animate.css">
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/ndt/plugins/slick/slick.css">
    <link rel="stylesheet" href="/ndt/plugins/slick/slick-theme.css">
    <!-- Colorbox -->
    <link rel="stylesheet" href="/ndt/plugins/colorbox/colorbox.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="/ndt/css/style.css">

</head>
<body>
<div class="body-inner">

    <!--/ Topbar end -->
    <!-- Header start -->
    <!--/ Header end -->
    <div id="banner-area" class="banner-area" style="background-image:url(images/banner/banner1.jpg)">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">EVENT</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">EVENT</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">All Projects</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="main-container" class="main-container">


        <div class="container">
            <div class="row subpage">
                <div class="col-sm-12 left">
                    <div class="navigation"><a href="/"><i class="fas fa-home"></i>Trang chủ ></a><a href="/danh-sach-su-kien.html">Sự kiện sắp diễn ra</a></div>
                    <div class="list_event">

                        <div class="filter_box events">
                        </div>

                        <div class="row">
                            <c:forEach items="${listEvent}" var="list">
                            <div class="col-4">

                                <div class="event_item">
                                    <a href="/events/details/${list.id}"><img src="/ndt/images/event/event1.png" alt="KHÓA TẬP HUẤN KỸ NĂNG CỐ VẤN KHỞI NGHIỆP 2021"></a>
                                    <div>
                                        <h3><a href="/events/details/${list.id}">${list.title}</a></h3>
                                        <p>${list.country} ${list.province} ${list.district} ${list.subdistrict} ${list.houseno}</p>
                                        <a href="#">Đăng ký ngay</a>
                                        <div class="calendar_event">
                                            <strong></strong>
                                            <em>${list.dayendenroll}</em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>


            </div>
        </div>
</div>

<div class="col-12">
    <div class="general-btn text-center">
        <a class="btn btn-primary" href="projects.html">View All Events</a>
    </div>
</div>

</div><!-- Content row end -->

</div><!-- Conatiner end -->
</section><!-- Main container end -->



<!-- Javascript Files
================================================== -->

<!-- initialize jQuery Library -->
<script src="/ndt/plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap jQuery -->
<script src="/ndt/plugins/bootstrap/bootstrap.min.js" defer></script>
<!-- Slick Carousel -->
<script src="/ndt/plugins/slick/slick.min.js"></script>
<script src="/ndt/plugins/slick/slick-animation.min.js"></script>
<!-- Color box -->
<script src="/ndt/plugins/colorbox/jquery.colorbox.js"></script>
<!-- shuffle -->
<script src="/ndt/plugins/shuffle/shuffle.min.js" defer></script>


<!-- Google Map API Key-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
<!-- Google Map Plugin-->
<script src="/ndt/plugins/google-map/map.js" defer></script>

<!-- Template custom -->
<script src="/ndt/js/script.js"></script>

</div><!-- Body inner end -->
</body>

</html>