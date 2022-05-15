<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Blog</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png">

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
    <link rel="stylesheet" href="/ndt/css/aa.css">

</head>
<body>
<div class="body-inner">

    <!--/ Topbar end -->
    <!-- Header start -->
    <!--/ Header end -->
    <div  class="banner-area" style=" width:100%;height:50px;background-image:url(/images/banner/banner1.jpg);">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="banner-heading">
                            <h2 class="banner-title" style="color: black;opacity: 1">Blog</h2>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="main-container" class="main-container">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="row">
                        <c:forEach items="${blog}" var="blog">
                            <div class="post">
                                <div class="post-media post-image">
                                    <img loading="lazy" src="images/blog/${blog.image}" width="250" height="250">
                                </div>

                                <div class="post-body" style=" margin-left: 20px;">
                                    <div class="entry-header">
                                        <h2 class="entry-title">
                                            <a href="/blog/details/${blog.id}">${blog.title}</a>
                                        </h2>
                                        <span>Cập nhật: ${blog.posteddate} | <a href="/blog/details/${blog.id}">ƯƠM TẠO KHỞI NGHIỆP</a></span>
                                    </div><!-- header end -->
                                    <div class="entry-content">
                                        <p>Bí quyết thành công với 6 bước đơn giản để bắt đầu khởi nghiệp kinh doanh riêng
                                    </div>


                                    <div class="post-footer">
                                        <a href="/blog/details/${blog.id}" class="btn btn-primary">Đọc tiếp...</a>
                                    </div>


                                </div><!-- post-body end -->
                            </div><!-- 1st post end -->
                        </c:forEach>




                    </div>




                    <nav class="paging" aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-double-left"></i></a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a></li>
                        </ul>
                    </nav>

                </div><!-- Content Col end -->
                <div class="col-lg-4">
                    <div class="sidebar sidebar-right">
                        <div class="widget recent-posts">
                            <h3 class="widget-title">Blog</h3>
                            <ul class="list-unstyled">

                                <c:forEach items="${blog}" var="blog">
                                    <li class="d-flex align-items-center">
                                        <div class="posts-thumb">
                                            <a href="#"><img loading="lazy" alt="img" width="400" height="600" src="images/blog/${blog.image}"></a>
                                        </div>
                                        <div class="post-info">
                                            <h4 class="entry-title">
                                                <a href="/blog/details/${blog.id}">${blog.title}</a>
                                            </h4>
                                        </div>
                                    </li><!-- 1st post end-->
                                </c:forEach>

                            </ul>

                        </div><!-- Recent post end -->

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
            </div><!-- Main row end -->

        </div><!-- Container end -->
    </section><!-- Main container end -->




    <!-- Javascript Files
    ================================================== -->

    <!-- initialize jQuery Library -->
    <script src="plugins/jQuery/jquery.min.js"></script>
    <!-- Bootstrap jQuery -->
    <script src="plugins/bootstrap/bootstrap.min.js" defer></script>
    <!-- Slick Carousel -->
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/slick/slick-animation.min.js"></script>
    <!-- Color box -->
    <script src="plugins/colorbox/jquery.colorbox.js"></script>
    <!-- shuffle -->
    <script src="plugins/shuffle/shuffle.min.js" defer></script>


    <!-- Google Map API Key-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
    <!-- Google Map Plugin-->
    <script src="/ndt/plugins/google-map/map.js" defer></script>

    <!-- Template custom -->
    <script src="/ndt/js/script.js"></script>

</div><!-- Body inner end -->
</body>

</html>