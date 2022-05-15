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
    <link rel="icon" type="image/png" href="images/favicon.png">

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
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css">
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/ndt/css/stylee.css">

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
                            <h1 class="banner-title">Project</h1>
                            <nav aria-label="breadcrumb">

                            </nav>
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

                    <div class="post-content post-single">
                        <div class="post-media post-image">
                            <img loading="lazy" src="/images/news/news1.jpg" class="img-fluid" alt="post-image">
                        </div>

                        <div class="post-body">
                            <div class="entry-header">
                                <div class="post-meta">
                <span class="post-author">
                  <i class="far fa-user"></i><a href="#"> Start up</a>
                </span>
                                    <span class="post-cat">
                  <i class="far fa-folder-open"></i><a href="#"> Ten Du An</a>
                </span>
                                    <span class="post-meta-date"><i class="far fa-calendar"></i> June 14, 2016</span>
                                    <span class="post-comment"><i class="far fa-comment"></i> 03<a href="#"
                                                                                                   class="comments-link">Comments</a></span>
                                </div>
                                div class="news_page">
                                <h1>${details.title}</h1>

                                <div class="brief_event">
                                    <div class="row no-gutters">
                                        <div class="col-3"><i class="far fa-clock"></i> Thời gian tổ chức:</div>
                                        <div class="col-9">${details.startday}</div>
                                    </div>
                                    <div class="row no-gutters">
                                        <div class="col-3"><i class="fas fa-user"></i> Diễn giả:</div>
                                        <div class="col-9">Nguyễn Tiến Trung</div>
                                    </div>
                                    <div class="row no-gutters">
                                        <div class="col-3"><i class="fas fa-map-marker-alt"></i> Địa điểm tổ chức:</div>
                                        <div class="col-9">${details.houseno},${details.subdistrict},${details.district}</div>
                                    </div>
                                    <div class="row no-gutters">
                                        <div class="col-3"><i class="far fa-calendar-check"></i> Ngày cập nhật:</div>
                                        <div class="col-9">${details.posteddate}</div>
                                    </div>
                                    <div class="row no-gutters">
                                        <div class="col-3"><i class="far fa-calendar-times"></i> Hạn đăng ký:</div>
                                        <div class="col-9">${details.dayendenroll}</div>
                                    </div>
                                    <p><a class="btn_register_event" href="44" rel="KHÓA TẬP HUẤN KỸ NĂNG CỐ VẤN KHỞI NGHIỆP 2021"><i class="fas fa-plus"></i> Đăng ký tham dự</a></p>
                                </div>
                            </div><!-- header end -->

                            <div class="entry-content">
                                <div class=""><strong>Nôi dung:</strong></div>
                                <div class="entry-content">

                                    <textarea class="form-control" id="details" style="height: 80vh; color: black" readonly>${details.content}</textarea>
                                </div>
                            </div>

                            <div class="tags-area d-flex align-items-center justify-content-between">
                                <div class="post-tags">
                                    <p>Tag:</p>
                                    <p>#Construction</p>
                                    <p>#Safety</p>
                                    <p>#Planning</p>
                                </div>
                                <div class="share-items">
                                    <ul class="post-social-icons list-unstyled">
                                        <li class="social-icons-head">Share:</li>
                                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div><!-- post-body end -->
                    </div><!-- post content end -->
                    <div class="like-box">
                        <h3><a class="comment-reply font-weight-bold" href="#"><i class="fas fa-thumbs-up"> 50 Likes</i></a></h3>
                        <h3><a class="comment-reply font-weight-bold" href="#"><i class="fas fa-comment"> 5 Comments</i></a></h3>
                    </div>
                    <div class="vote-box">
                        <p>Vote for project:
                            <a href="#"><i class="far fa-star"></i></a>
                            <a href="#"><i class="far fa-star "></i></a>
                            <a href="#"><i class="far fa-star "></i></a>
                            <a href="#"><i class="far fa-star"></i></a>
                            <a href="#"><i class="far fa-star"></i></a>
                        </p>
                        <button class="btn btn-success btn-sm">Vote</button>
                    </div>
                    <div class="author-box d-nlock d-sm-flex">
                        <div class="author-img mb-4 mb-md-0">
                            <img loading="lazy" src="images/news/avator1.png" alt="author">
                        </div>
                        <div class="author-info">
                            <h3>Thông tin liên hệ</h3>
                            <h3>Họ Tên<span>Nghề nghiệp</span></h3>
                            <p class="mb-2"><strong>Địa chỉ:</strong> An Hải Đông - Sơn Trà - Đà Nẵng</p>
                            <p class="mb-2"><strong>Điện thoại:</strong> 0987444333</p>
                            <p class="mb-2"><strong>Email:</strong>abc@gmail.com</p>
                            <p>Voted: 4.5 <a href="#"><i class="fa fa-star checked"></i></a>
                                <a><i class="fa fa-star checked"></i></a>
                                <a><i class="fa fa-star checked"></i></a>
                                <a><i class="fa fa-star checked"></i></a>
                                <a><i class="fa fa-star-half-alt checked"></i></a></p>
                            <button type="button" class="btn btn-primary" href="#"><i class="fas fa-envelope"></i>Liên hệ với abc@gmail.com</button>

                        </div>
                    </div> <!-- Author box end -->

                    <!-- Post comment start -->
                    <div id="comments" class="comments-area">
                        <div class="comments-form border-box">
                            <h4 class="title-normal">Add a comment</h4>

                            <form role="form">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="message" class="w-100"><textarea class="form-control required-field" id="message" placeholder="Your Comment" rows="4" required></textarea></label>
                                        </div>
                                    </div><!-- Col 12 end -->
                                </div><!-- Form row end -->
                                <div class="username">
                                    <p>Ho ten</p>
                                </div>
                                <div class="clearfix text-md-right">
                                    <button class="btn btn-primary" type="submit" aria-label="post-comment">Post Comment</button>
                                </div>
                            </form><!-- Form end -->
                        </div><!-- Comments form end -->
                        <ul class="comments-list">
                            <li>
                                <div class="comment d-flex">
                                    <img loading="lazy" class="comment-avatar" alt="author" src="images/news/avator1.png">
                                    <div class="comment-body">
                                        <div class="meta-data">
                                            <span class="comment-author mr-3">Michelle Aimber</span>
                                            <span class="comment-date float-right">January 17, 2016 at 1:38 pm</span>
                                        </div>
                                        <div class="comment-content">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                                labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen.</p>
                                        </div>
                                        <div class="text-left">
                                            <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-thumbs-up"> 10 Likes</i></a>
                                            <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-reply"> 4 Replies</i></a>
                                            <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </div>
                                </div><!-- Comments end -->

                                <ul class="comments-reply">
                                    <li>
                                        <div class="comment d-flex">
                                            <img loading="lazy" class="comment-avatar" alt="author" src="images/news/avator2.png">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author mr-3">Tom Harnandez</span>
                                                    <span class="comment-date float-right">January 17, 2016 at 1:38 pm</span>
                                                </div>
                                                <div class="comment-content">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                                        laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen.</p>
                                                </div>
                                                <div class="text-left">
                                                    <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-thumbs-up"> 10 Likes</i></a>
                                                    <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-reply"> 4 Replies</i></a>

                                                </div>
                                            </div>
                                        </div><!-- Comments end -->
                                    </li>
                                </ul><!-- comments-reply end -->
                                <div class="comment d-flex last">
                                    <img loading="lazy" class="comment-avatar" alt="author" src="images/news/avator3.png">
                                    <div class="comment-body">
                                        <div class="meta-data">
                                            <span class="comment-author mr-3">Genelia Dusteen</span>
                                            <span class="comment-date float-right">January 17, 2016 at 1:38 pm</span>
                                        </div>
                                        <div class="comment-content">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                                labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen.</p>
                                        </div>
                                        <div class="text-left">
                                            <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-thumbs-up"> 10 Likes</i></a>
                                            <a class="comment-reply font-weight-bold" href="#"><i class="fas fa-reply"> 4 Replies</i></a>
                                        </div>
                                    </div>
                                </div><!-- Comments end -->
                            </li><!-- Comments-list li end -->
                        </ul><!-- Comments-list ul end -->
                    </div><!-- Post comment end -->


                </div><!-- Content Col end -->

                <div class="col-lg-4">

                    <div class="sidebar sidebar-right">
                        <div class="widget recent-posts">
                            <h3 class="widget-title">Các tin liên quan</h3>
                            <ul class="list-unstyled">
                                <li class="d-flex align-items-center">
                                    <div class="posts-thumb">
                                        <a href="#"><img loading="lazy" alt="img" src="images/news/news1.jpg"></a>
                                    </div>
                                    <div class="post-info">
                                        <h4 class="entry-title">
                                            <a href="#">We Just Completes $17.6 Million Medical Clinic In Mid-missouri</a>
                                        </h4>
                                    </div>
                                </li><!-- 1st post end-->

                                <li class="d-flex align-items-center">
                                    <div class="posts-thumb">
                                        <a href="#"><img loading="lazy" alt="img" src="images/news/news2.jpg"></a>
                                    </div>
                                    <div class="post-info">
                                        <h4 class="entry-title">
                                            <a href="#">Thandler Airport Water Reclamation Facility Expansion Project Named</a>
                                        </h4>
                                    </div>
                                </li><!-- 2nd post end-->

                                <li class="d-flex align-items-center">
                                    <div class="posts-thumb">
                                        <a href="#"><img loading="lazy" alt="img" src="images/news/news3.jpg"></a>
                                    </div>
                                    <div class="post-info">
                                        <h4 class="entry-title">
                                            <a href="#">Silicon Bench And Cornike Begin Construction Solar Facilities</a>
                                        </h4>
                                    </div>
                                </li><!-- 3rd post end-->

                            </ul>

                        </div><!-- Recent post end -->

                        <div class="widget">
                            <h3 class="widget-title">Categories</h3>
                            <ul class="arrow nav nav-tabs">
                                <li><a href="#">Construction</a></li>
                                <li><a href="#">Commercial</a></li>
                                <li><a href="#">Building</a></li>
                                <li><a href="#">Safety</a></li>
                                <li><a href="#">Structure</a></li>
                            </ul>
                        </div><!-- Categories end -->

                        <div class="widget">
                            <h3 class="widget-title">Archives </h3>
                            <ul class="arrow nav nav-tabs">
                                <li><a href="#">Feburay 2016</a></li>
                                <li><a href="#">January 2016</a></li>
                                <li><a href="#">December 2015</a></li>
                                <li><a href="#">November 2015</a></li>
                                <li><a href="#">October 2015</a></li>
                            </ul>
                        </div><!-- Archives end -->

                        <div class="widget widget-tags">
                            <h3 class="widget-title">Tags </h3>

                            <ul class="list-unstyled">
                                <li><a href="#">Construction</a></li>
                                <li><a href="#">Design</a></li>
                                <li><a href="#">Project</a></li>
                                <li><a href="#">Building</a></li>
                                <li><a href="#">Finance</a></li>
                                <li><a href="#">Safety</a></li>
                                <li><a href="#">Contracting</a></li>
                                <li><a href="#">Planning</a></li>
                            </ul>
                        </div><!-- Tags end -->


                    </div><!-- Sidebar end -->
                </div><!-- Sidebar Col end -->

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