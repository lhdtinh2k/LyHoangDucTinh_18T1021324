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
    <title>Profile</title>

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
                                <li class="active"><a href="/user/userProfile">Thông tin của tôi</a></li>
                                <%--                                <li class="active"><a href="/startup/userListProject">Các dự án của tôi</a></li>--%>
                                <%--                                <li><a href="/startup/userListImage">Hình ảnh dự án</a></li>--%>
                                <%--                                <li><a href="/startup/acceptInvestion">Các yêu cầu đầu tư</a></li>--%>
                                <%--                                <li><a href="/startup/userProfile">Thông tin của tôi</a></li>--%>
                                <c:if test="${profileUser.roles == 'investors'}">
                                    <li><a href="/user/userListProject">Thông tin công ty</a></li>
                                    <%--                                    <li><a href="/startup/userListImage">Hình ảnh dự án</a></li>--%>
                                </c:if>
                                <c:if test="${profileUser.roles == 'startup'}">
                                    <li><a href="/job/saveProject">Đăng dự án</a></li>
                                    <li><a href="/user/userListProject">Các dự án của tôi</a></li>
                                    <li><a href="/user/userListImage">Hình ảnh dự án</a></li>
                                    <li><a href="/job/acceptInvestion">Các yêu cầu đầu tư</a></li>
                                </c:if>
                            </ul>
                        </div><!-- Widget end -->

                        <div class="widget">
                            <div class="quote-item quote-border">
                                <div class="quote-text-border">
                                    Thêm đoạn trích.
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
                                            <form:form action="/user/updateProfile" name="formUpdate" method="post" onsubmit="return validateProfile()" modelAttribute="updateForm"  enctype="multipart/form-data">
                                                <div class="row register-form">
                                                    <form:hidden path="id"/>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <form:input path="fullname" class="form-control" id="fullNameId" placeholder="Họ tên *" name="fullname" />
                                                            <form:errors path="fullname"/>
                                                            <p id="isNameValid" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="email" type="email" class="form-control" placeholder="email *"  />
                                                            <form:errors path="email"/>
                                                            <p id="isEmailValid" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="phone" class="form-control" placeholder="Phone *" value="" />
                                                            <form:errors path="phone"/>
                                                            <p id="isPhoneValid" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="cccd" class="form-control"  placeholder="CCCD/CMND *" value="" />
                                                            <form:errors path="cccd"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="birthday" type="date" value="${user.birthday}" class="form-control"  placeholder="CCCD/CMND *"  />
                                                            <form:errors path="birthday"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="job" class="form-control"  placeholder="Công việc *" value="" />
                                                            <form:errors path="job"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="maxl">
                                                                <label class="radio inline">
                                                                    <form:radiobutton path="gender" name="gender" value="Male"/>
                                                                    <span> Male </span>
                                                                </label>
                                                                <label class="radio inline">
                                                                    <form:radiobutton path="gender" name="gender" value="Female"/>
                                                                    <span>Female </span>
                                                                </label>
                                                            </div>
                                                            <p id="genderErrror" style="color: red"></p>
                                                            <form:errors path="gender"/>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">
                                                        <h5>Địa chỉ của bạn:</h5>
                                                        <div class="form-group">
                                                            <form:select class="form-control" id="provinceId" path="province">
                                                                <form:option value="${user.province}" selected="selected">${user.province}</form:option>
                                                                <form:options items="${provinces}" itemLabel="name" itemValue="id"/>
                                                            </form:select>
                                                            <p id="checkProvince" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:select class="form-control" id="districtId" path="district">
                                                                <form:option value="${user.district}">${user.district}</form:option>
                                                            </form:select>
                                                            <p id="checkDistrict" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:select class="form-control" id="subdistrictId" path="subdistrict">
                                                                <form:option value="${user.subdistrict}" class="hidden">${user.subdistrict}</form:option>
                                                            </form:select>
                                                            <p id="checkSubDistrict" style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <form:input path="houseno" class="form-control" placeholder="Số nhà - đường*" value="" />
                                                            <form:errors path="houseno" style="color: yellow"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Chọn ảnh đại diện</label>
                                                            <input type="file" name="avatarUser"/>
                                                        </div>
                                                        <div class="general-btn text-center">
                                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
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
    <script src="/js/validation.js"></script>
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
    <script type="text/javascript">
        $(document).ready(function(){
            $('#provinceId').on('change',function(){
                var provinceId = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: "/province/" + provinceId,
                    success: function(result) {
                        var result = JSON.parse(result);
                        var s = '';
                        for(var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#districtId').html(s);
                        $('#subdistrictId').html('<option value=""></option>')
                    }
                });
            });
            $('#districtId').on('change',function(){
                var districtId = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: "/district/" + districtId,
                    success: function(result) {
                        var result = JSON.parse(result);
                        var s = '';
                        for(var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#subdistrictId').html(s);
                    }
                });
            });
        });
    </script>
</div><!-- Body inner end -->
</body>

</html>