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
    <title>Dự án</title>

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
    <div id="banner-area" class="banner-area" style="background-image:url(/images/banner/banner1.jpg)">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Thông tin cá nhân</h1>
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
                                <li><a href="/user/userProfile">Thông tin của tôi</a></li>
                                <%--                                <li class="active"><a href="/startup/userListProject">Các dự án của tôi</a></li>--%>
                                <%--                                <li><a href="/startup/userListImage">Hình ảnh dự án</a></li>--%>
                                <%--                                <li><a href="/startup/acceptInvestion">Các yêu cầu đầu tư</a></li>--%>
                                <%--                                <li><a href="/startup/userProfile">Thông tin của tôi</a></li>--%>
                                <c:if test="${profileUser.roles == 'investors'}">
                                    <li class="active"><a href="/user/userListProject">Thông tin công ty</a></li>
                                    <%--                                    <li><a href="/startup/userListImage">Hình ảnh dự án</a></li>--%>
                                </c:if>
                                <c:if test="${profileUser.roles == 'startup'}">
                                    <li><a href="/user/userListProject">Các dự án của tôi</a></li>
                                    <li ><a href="/user/userListImage">Hình ảnh dự án</a></li>
                                    <li class="active"><a href="/startup/acceptInvestion">Các yêu cầu đầu tư</a></li>
                                </c:if>
                            </ul>
                        </div><!-- Widget end -->

                        <div class="widget">
                            <div class="quote-item quote-border">
                                <div class="quote-text-border">
                                    Thêm đoạn trích.
                                </div>

                                <div class="quote-item-footer">
                                    <img loading="lazy" class="testimonial-thumb" src="/images/userImages/${profileUser.avataruser}" alt="testimonial">
                                    <div class="quote-item-info">
                                        <h3 class="quote-author">${profileUser.fullname}</h3>
                                        <span class="quote-subtext">${profileUser.job}</span>
                                    </div>
                                </div>
                            </div><!-- Quote item end -->

                        </div><!-- Widget end -->

                    </div><!-- Sidebar end -->
                </div><!-- Sidebar Col end -->

                <div class="col-xl-8 col-lg-8">
                    <div class="content-inner-page">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th scope="col"><div style="width: 200px">Tên dự án</div></th>
                                    <th scope="col"><div style="width: 100px">Danh mục </th>
                                    <th scope="col">Số tiền kêu gọi</th>
                                    <th scope="col"><div style="width: 120px">Nhà đầu tư</div></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listProjectOfUser}" var="project">
                                    <tr>
                                        <td>${project.projectname}</td>
                                        <td>${project.category.categoryname}</td>
                                        <td><fmt:formatNumber value="${project.amountcalled}" maxFractionDigits="0"/> VND</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${project.investedProjects != null}">
                                                    <c:forEach items="${project.investedProjects}" var="investion">
                                                        <div>${investion.user.username}
                                                            <a href="/startup/acceptForInvestor/${project.id}/${investion.user.id}" class="btn btn-success btn-sm btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-check"></i>
                                                        </span>
                                                                <span class="text">Chấp nhận</span>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>Chưa có người đầu tư</div>
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div><!-- Content inner end -->
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