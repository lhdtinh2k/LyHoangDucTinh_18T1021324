
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Doanh nghiệp</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="/image/png" href="/images/favicon.png">

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
    <style>
        figure{
            width: 45%;
        }
        img {

            width: 100%;
        }
    </style>
</head>
<body>
<div class="body-inner">
    <!--/ Header end -->
    <c:if test="${user.roles == 'startup'}">
        <section id="main-container" class="main-container">
            <div class="container">
                <div class="row">
                    <div class="col-lg mb-5 mb-lg-0">
                        <h1 style="margin-bottom: 10%">Dự án của bạn</h1>
                        <form:form action="/startup/saveProject" method="POST" modelAttribute="investorsForm" enctype="multipart/form-data">
                            <form:hidden path="id"/>
                            <h5 style="color: red">${message}</h5>
                            <div class="form-group">
                                <label for="categoryId">Danh mục dự án</label>
                                <form:select class="form-control" id="categoryId" path="categoryId">
                                    <form:options items="${categories}" itemLabel="categoryname" itemValue="id"/>
                                    <form:errors path="categoryId"/>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="projectname">Tên dự án</label>
                                <form:input path="projectname" class="form-control" id="projectname"  placeholder="Nhập tên dự án"/>
                                <form:errors path="projectname"/>
                            </div>
                            <div class="form-group">
                                <label for="title">Tiêu đề cho dự án (Mục đích)</label>
                                <form:input path="title" class="form-control" id="title"/>
                                <form:errors path="title"/>
                            </div>
                            <div class="form-group">
                                <label for="amountcalled">Số tiền muốn kêu gọi</label>
                                <form:input path="amountcalled" class="form-control" id="amountcalled" />
                                <form:errors path="amountcalled"/>
                            </div>
                            <div class="form-group">
                                <label for="projectdetail">Mô tả chi tiết dự án</label>
                                <form:textarea path="projectdetail" class="form-control"  id="projectdetail" style="height: 60vh; color: black" ></form:textarea>
                                <form:errors path="projectdetail"/>
                            </div>
                            <div class="form-group" >
                                <label style="margin-top: 2%">Địa chỉ dự án:</label>
                            </div>
                            <div class="form-row">
                                <div class="form-group col">
                                    <label for="provinceId">Tỉnh/Thành phố: </label>
                                    <form:select class="form-control" id="provinceId" path="province">
                                        <form:options items="${provinces}" itemLabel="name" itemValue="id"/>
                                    </form:select>
                                </div>
                                <div class="form-group col">
                                    <label for="districtId">Quận/Huyện: </label>
                                    <form:select class="form-control" id="districtId" path="district">
                                        <option selected value="">Chọn Quận Huyện</option>
                                    </form:select>
                                </div>
                                <div class="form-group col">
                                    <label for="subdistrictId">Xã/Phường: </label>
                                    <form:select class="form-control" id="subdistrictId" path="subdistrict">
                                        <option selected value="">Chọn Xã Phường</option>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="housenoId">Địa chỉ nhà - Đường/Thôn:</label>
                                <form:input type="text" class="form-control" id="housenoId" path="houseno"/>
                                <form:errors path="houseno"/>
                            </div>
                            <label>Lưu ý: </label>
                            <div class="form-group">
                                <label for="imagepresent">Chọn ảnh đại diện dự án</label><br>
                                <input type="file" name="imagepresent" id="imagepresent">
                            </div>

                            <div class="form-group">
                                <label>Chọn ảnh cho dự án</label>
                                <input type="file" multiple id="imageOfProject" name="imageofproject" onchange="preview()" style="display: none;">
                                <label for="imageOfProject" style="background-color: orange; cursor: pointer; padding: 10px; margin-top: 2%;">
                                    <i class="fas fa-upload"></i>Chọn ảnh
                                </label>
                                <div id="images" style="display: flex;"></div>
                            </div>
                            <button type="submit" class="btn btn-primary">Đăng dự án</button>
                        </form:form>
                    </div><!-- Content Col end -->

                </div><!-- Main row end -->

            </div><!-- Container end -->
        </section><!-- Main container end -->
    </c:if>

    <c:if test="${user.roles == 'investors'}">
        <section id="main-container" class="main-container">
            <div class="container">
                <div class="row">
                    <div class="col-lg mb-5 mb-lg-0">
                        <h1 style="margin-bottom: 10%">Đăng bài tìm việc làm</h1>
                        <form:form action="/investor/saveBai" method="POST" name="investorsForm" modelAttribute="investorsForm"  onsubmit="return validateInvestor()" enctype="multipart/form-data">
                            <form:hidden path="id"/>
                            <h5 style="color: red">${message}</h5>
                            <div class="form-group">
                                <label for="investorsname">Nhập tiêu đề</label>
                                <form:input path="investorsname" class="form-control"  placeholder="Nhập tiêu đề"/>
                            </div>
                            <div class="form-group">
                                <label for="content">Mô tả</label>
                                <form:textarea path="content" class="form-control"  id="content" style="height: 200px; color: black" ></form:textarea>

                            </div>

                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form:form>

                    </div><!-- Content Col end -->

                </div><!-- Main row end -->

            </div><!-- Container end -->
        </section><!-- Main container end -->
    </c:if>
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
    <script src="/js/validation.js"></script>
    <!-- Template custom -->
    <script src="/js/script.js"></script>
    <script src="/js/multipleImageJS.js"></script>
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