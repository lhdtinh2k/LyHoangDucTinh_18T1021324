<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
================================================== -->
    <meta charset="utf-8"/>
    <title>Blog</title>

    <!-- Mobile Specific Metas
================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="Construction Html5 Template"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0"/>

    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="/images/favicon.png"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css"/>
    <!-- Animation -->
    <link rel="stylesheet" href="/plugins/animate-css/animate.css"/>
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/plugins/slick/slick.css"/>
    <link rel="stylesheet" href="/css/custom.css"/>
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css"/>
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css"/>
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="body-inner">
    <!--/ Topbar end -->
    <!-- Header start -->
    <!--/ Header end -->
<%--    <div  class="banner-area" style=" width:100%;height:50px;background-image:url(/images/banner/banner1.jpg);">--%>
<%--        <div class="banner-text">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-sm-12">--%>
<%--                        <div class="banner-heading">--%>
<%--                            <h2 class="banner-title" style="color: black;opacity: 1">Blog</h2>--%>
<%--                        </div>--%>
<%--                    </div><!-- Col end -->--%>
<%--                </div><!-- Row end -->--%>
<%--            </div><!-- Container end -->--%>
<%--        </div><!-- Banner text end -->--%>
<%--    </div><!-- Banner area end -->--%>

    <section id="main-container" class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="post-content post-single">
                        <div class="navigation"><a href="/job/listProject"><i class="fas fa-home"></i>Trang chủ</a><a href="/blog">  >  Blog</a><a href="/blog"> </a></div>

                        <div class="post-content post-single">
                            <div class="post-body">
                                <div class="entry-header">
                                    <h2 class="entry-title">
                                        ${details.title}
                                    </h2>
                                </div>
                                <p>Cập nhật: ${details.posteddate} | <a href="/blog">ƯƠM TẠO KHỞI NGHIỆP</a></p>
                                <div style="text-align:center ">
                                    <div class="row no-gutters">
                                        <div class="col-10 logo_supporter"><img height="420" width="500" src="/images/blog/${details.image}"
                                                                                alt="Quỹ đổi mới công nghệ quốc gia"></div>
                                    </div>
                                </div>
                                <!-- header end -->
                                <div style="margin-top: 5%"><strong>Nôi dung:</strong></div>
                                <div class="entry-content">

                                <textarea class="form-control" id="details" style="height: 200px; color: black"
                                >${details.content}</textarea>
                                </div>
                                <div id="page-slider" class="page-slider">
                                </div><!-- Page slider end -->

                            </div>
                            <!-- post-body end -->
                        </div>


                        <!-- Post comment end -->
                    </div>
                    <!-- Content Col end -->


                </div><!-- Content Col end -->

                <div class="col-lg-4">
                    <div class="sidebar sidebar-right">
<%--                        <div class="widget recent-posts">--%>
<%--                            <h3 class="widget-title">Blog</h3>--%>
<%--                            <ul class="list-unstyled">--%>
<%--                                <c:forEach items="${blog}" var="blog">--%>
<%--                                    <li class="d-flex align-items-center">--%>
<%--                                        <div class="posts-thumb">--%>
<%--                                            <a href="#"><img loading="lazy" alt="img" width="400" height="600" src="images/blog/${blog.image}"></a>--%>
<%--                                        </div>--%>
<%--                                        <div class="post-info">--%>
<%--                                            <h4 class="entry-title">--%>
<%--                                                <a href="/blog/details/${blog.id}">${blog.title}</a>--%>
<%--                                            </h4>--%>
<%--                                        </div>--%>
<%--                                    </li><!-- 1st post end-->--%>
<%--                                </c:forEach>--%>

<%--                            </ul>--%>

<%--                        </div><!-- Recent post end -->--%>

                        <div class="widget">
                            <h3 class="widget-title">Thể loại</h3>
                            <ul class="arrow nav nav-tabs">
                                <li><a href="#">Công nghệ thông tin</a></li>
                                <li><a href="#">Tài chính - Ngân Hàng</a></li>
                                <li><a href="#">Xây dựng</a></li>
                                <li><a href="#">Cơ khí</a></li>
                                <li><a href="#">Du lịch</a></li>
                            </ul>
                        </div><!-- Categories end -->

                        <div class="widget widget-tags">
                            <h3 class="widget-title">Tags </h3>

                            <ul class="list-unstyled">
                                <li><a href="#">Công nghệ thông tin</a></li>
                                <li><a href="#">Tài chính - Ngân Hàng</a></li>
                                <li><a href="#">Xây Dựng</a></li>
                                <li><a href="#">Cơ Khí</a></li>
                                <li><a href="#">Du Lịch</a></li>
                                <li><a href="#">Viễn Thông</a></li>
                                <li><a href="#">Kinh Doanh</a></li>
                                <li><a href="#">Giáo Dục</a></li>
                            </ul>
                        </div><!-- Tags end -->


                    </div><!-- Sidebar end -->
                </div><!-- Sidebar Col end -->
            </div>

        </div>
        <!-- Main row end -->
        <!-- Conatiner end -->
    </section>

    <script>
        $(function () {
            $(".my-rating-9").starRating({
                initialRating: 5,
                disableAfterRate: false,
                onHover: function (currentIndex, currentRating, $el) {
                    console.log('index: ', currentIndex, 'currentRating: ', currentRating, ' DOM element ', $el);
                    $('.live-rating').val(currentIndex);
                },
                onLeave: function (currentIndex, currentRating, $el) {
                    console.log('index: ', currentIndex, 'currentRating: ', currentRating, ' DOM element ', $el);
                    $('.live-rating').val(currentRating);
                }
            });
        });
    </script>
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
    <script src="/js/star.js"></script>
    <!-- Template custom -->
    <script src="/js/script.js"></script>
</div>
<!-- Body inner end -->
</body>
</html>
