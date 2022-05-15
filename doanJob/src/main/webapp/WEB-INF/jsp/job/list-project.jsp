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
    <title>Danh sách việc làm</title>

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
    <div  class="banner-area" style=" width:100%;height:50px;background-image:url(/images/banner/banner1.jpg);">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="banner-heading">
                            <h2 class="banner-title" style="color: black;opacity: 1">Việc làm</h2>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->


    <h5 style="margin-top: 3%; margin-left: 5%">Tìm kiếm theo danh mục hoặc theo tên các dự án: </h5>
    <div class="container-fluid">
        <!-- Control the column width, and how they should appear on different devices -->
        <div class="row">
            <form action="/job/listProject" method="post" class="form-inline" style="margin-top: 2%; margin-left: 5%">
                <div class="input-group">
                    <p>Chọn danh mục</p>
                    <div class="form-outline">

                        <select id="category" class="form-control" name="categoryId">
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.categoryname}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <form action="/job/searchProject" method="post" class="form-inline" style="margin-top: 2%; margin-left: 5%">
                <div class="input-group">
                    <div class="form-outline">
                        <input type="text" class="form-control" name="projectName" placeholder="Nhập tên dự án cần tìm"/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <form action="/job/searchProjectByMount" method="post" class="form-inline" style="margin-top: 2%; margin-left: 5%">
                <div class="input-group">
                    <div class="form-outline">
                        <input type="text" class="form-control" name="mount" placeholder="Mức lương từ..."/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <section id="main-container" class="main-container pb-2">
        <div class="container">
            <div class="row subpage">
                <div class="col-sm-12 left">
                    <div class="navigation"><a style="font-weight: bold" href="/job/listProject"><i class="fas fa-home"></i>Trang chủ ></a><a style="font-weight: bold" href="/">Việc làm</a></div>
                    <div class="list_project">
                        <div class="row">
                            <c:choose>
                            <c:when test="${listProjects!=null}">
                            <c:forEach items="${listProjects}" var="project">
                                <div class="col-12 col-sm-6 col-md-3 item">
                                    <div>
                                        <a href="/job/projectDetail/${project.id}"><img loading="lazy" src="/images/projects/${project.imagepresent}"
                                                                                            style="height: 300px; width: 300px;"  class="img-fluid" alt="team-img"></a>
                                        <div class="item_b">
                                            <a href="/job/projectDetail/${project.id}"><h3 class="ts-name">${project.projectname}</h3></a>
                                            <h5>Được đánh giá: ${project.totalvoted}</h5>
                                            <h4 style=" color: orangered">Mức lương từ: <fmt:formatNumber value="${project.amountcalled}" maxFractionDigits="0"/> VND</h4>
                                                <a href="/job/projectDetail/${project.id}"><p class="ts-description">${project.projectdetail}</p></a>
                                            <span><a href="/job/projectDetail/${project.id}">Xem chi tiết</a></span>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            </c:when>
                                <c:otherwise>
                                    <h2>Không có kết quả</h2>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>

                </div>

            </div>
            <div style=" margin-top: 5%; display: flex; justify-content: center; ">
                <nav aria-label="..." >
                    <ul class="pagination pagination-lg">
                        <%-- Dưới đây là phân trang cho sản phẩm--%>
                        <c:forEach begin="1" end="${pageSize}" varStatus="index">
                            <li class="page-item"><a  class="page-link" href="/job/listProject?page=${index.index}">${index.index}</a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
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
<script src="/plugins/google-map/map.js" defer></script>

<!-- Template custom -->
<script src="/ndt/js/script.js"></script>

</div><!-- Body inner end -->
</body>

</html>