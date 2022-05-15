<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">

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
    <!-- Page Wrapper -->

    <%--    SideBar--%>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

    <%--    TopBar--%>
    <tiles:insertAttribute name="header"/>
    <!-- Begin Page Content -->
    <div class="container-fluid">

    <tiles:insertAttribute name="body"/>

    </div>
    </div>

    <!-- End of Main Content -->

    <%--    Footer--%>
    <tiles:insertAttribute name="footer"/>
    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
<%--    <a class="scroll-to-top rounded" href="#page-top">--%>
<%--    <i class="fas fa-angle-up"></i>--%>
<%--    </a>--%>

<%--    <!-- Logout Modal-->--%>
<%--    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"--%>
<%--    aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--    <div class="modal-content">--%>
<%--    <div class="modal-header">--%>
<%--    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>--%>
<%--    <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--    <span aria-hidden="true">×</span>--%>
<%--    </button>--%>
<%--    </div>--%>
<%--    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>--%>
<%--    <div class="modal-footer">--%>
<%--    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--    <a class="btn btn-primary" href="/logout">Logout</a>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>

<%--    <script type="text/javascript">--%>
<%--    $(document).ready(function(){--%>
<%--    $('#phongmayId').on('change',function(){--%>
<%--    var phongmayId = $(this).val();--%>
<%--    $.ajax({--%>
<%--    type: 'GET',--%>
<%--    url: "/chonphong/" + phongmayId,--%>
<%--    success: function(result) {--%>
<%--    var result = JSON.parse(result);--%>
<%--    var s = '';--%>
<%--    for(var i = 0; i < result.length; i++) {--%>
<%--    s += '<option value="' + result[i].mamay + '">' + result[i].mamay + '</option>';--%>
<%--    }--%>
<%--    $('#maytinhId').html(s);--%>
<%--    }--%>
<%--    });--%>

<%--    });--%>

<%--    $('#phongmayId').on('change',function(){--%>
<%--    var phongmayId = $(this).val();--%>
<%--    $.ajax({--%>
<%--    type: 'GET',--%>
<%--    url: "/chonmay/" + phongmayId,--%>
<%--    success: function(result) {--%>
<%--    var result = JSON.parse(result);--%>
<%--    var s = '';--%>
<%--    for(var i = 0; i < result.length; i++) {--%>
<%--    s += '<option value="' + result[i].maphanmem + '">' + result[i].tenphanmem + '</option>';--%>
<%--    }--%>
<%--    $('#phanmemId').html(s);--%>
<%--    }--%>
<%--    });--%>
<%--    });--%>
<%--    });--%>
<%--    </script>--%>
<%--    <script type="text/javascript">--%>
<%--    $(".chosen-select").chosen();--%>
<%--    $('button').click(function(){--%>
<%--    $(".chosen-select").val('').trigger("chosen:updated");--%>
<%--    });--%>
<%--    </script>--%>
</div>
</body>

</html>