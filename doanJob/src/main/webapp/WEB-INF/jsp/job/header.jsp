<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--/ Topbar end -->
<!-- Header start -->
<header id="header" class="header-one">
    <div class="bg-white">
        <div class="container">
            <div class="logo-area">
                <div class="row align-items-center" style="height: 50px ; padding: 0px !important;">
                    <div class="logo col-lg-3 text-center text-lg-left mb-3 mb-md-5 mb-lg-0">
                        <a class="d-block" href="/job/listProject">
                            <img loading="lazy" src="/images/projectImages/logo.png" style="width: 100px" alt="JobHue">
                        </a>
                    </div><!-- logo end -->

                    <div class="col-lg-9 header-right">
                        <ul class="top-info-box">
                            <li class="header-get-a-quote">
                                <c:choose>
                                    <c:when test="${user.fullname!=null}">
                                        <a class="btn btn-info" id="userLogin" href="/user/userProfile" title="Thông tin cá nhân">${user.fullname}</a>
                                        <a class="btn btn-danger" data-toggle="modal" data-target="#logoutModal" style="color: white">
                                            Đăng xuất
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-success" id="userLogin" href="/user/userProfile" title="Thông tin cá nhân">Đăng nhập</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul><!-- Ul end -->
                    </div><!-- header right end -->
                </div><!-- logo area end -->

            </div><!-- Row end -->
        </div><!-- Container end -->
    </div>

    <div class="site-navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-dark p-0">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div id="navbar-collapse" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav mr-auto">
                                <li class="nav-item dropdown active">
                                    <a href="/job/listProject" class="nav-link dropdown-toggle" >Trang chủ</a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a href="/investor" class="nav-link dropdown-toggle" >Ứng viên</a>

                                </li>

                                <li class="nav-item"><a class="nav-link" href="/job/listProject">Việc làm</a></li>
                                <li class="nav-item"><a class="nav-link" href="/blog">Blog</a></li>
<%--                                <li class="nav-item"><a class="nav-link" href="/blog">Ươm tạo khởi nghiệp</a></li>--%>

                            </ul>
                        </div>
                    </nav>
                </div>
                <!--/ Col end -->
            </div>
            <!--/ Row end -->

            <div class="nav-search">
                <span id="search"><i class="fa fa-search"></i></span>
            </div><!-- Search end -->

            <div class="search-block" style="display: none;">
                <label for="search-field" class="w-100 mb-0">
                    <input type="text" class="form-control" id="search-field" placeholder="Type what you want and enter">
                </label>
                <span class="search-close">&times;</span>
            </div><!-- Site search end -->
        </div>
        <!--/ Container end -->

    </div>
    <!--/ Navigation end -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Bạn có muốn đăng xuất! </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal" style="font-weight: bold">TRỞ VỀ</button>
                    <a class="btn btn-primary" href="/logout">Đăng xuất</a>
                </div>
            </div>
        </div>
    </div>
</header>
