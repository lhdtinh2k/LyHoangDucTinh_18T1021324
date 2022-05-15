
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="fontawesome-free-5.15.4-web/css/all.css">
    <title>Login</title>
<style>
    label,h1{
        color: #0d0d0d;
    }
</style>
</head>
<body style=" background-color: white; background-size: cover; object-fit: cover">
    <div class="container">
        <a class="d-block" href="/job/listProject">
            <img loading="lazy" src="/images/projectImages/logo.png" style="width: 80px" alt="job">
            Trang chủ
        </a>
        <section class="vh-100" style="background-color: white;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="https://www.luyenthithukhoa.vn/attachments/00-jpg.28394/"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center" >
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form:form action="/login" modelAttribute="loginForm" method="POST" style=" color: white" class="form">
                                            <h1>Đăng nhập</h1>
                                            <p style="color: red; ">${message}</p>
                                            <div class="form-group">
                                                <label for="username">Tài khoản</label>
                                                <form:input path="username"  class="form-control" id="username" placeholder="Nhập tài khoản"/>
                                                <form:errors path="username"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Mật khẩu</label>
                                                <form:password path="password" class="form-control" id="password" placeholder="Nhập mật khẩu"/>
                                                <form:errors path="password"/>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                                            <div class="form-group" style="margin-top: 2%">
                                                <label>Hoặc</label>
                                                <br>
                                                <a href="/register" class="register">Đăng ký tài khoản ở đây!</a>
                                            </div>
                                        </form:form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>