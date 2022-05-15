
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
    <link rel="stylesheet" href="css/customLogin.css">
    <title>Đăng ký tài khoản</title>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card register">
            <div class="card-body">
                <h2 style="color: white">Đăng ký tài khoản</h2>
                <form:form action="/saveUser" method="POST" name="formRegister" onsubmit="return validateData()" class="formRegister" modelAttribute="enrollForm" >
                    <form:hidden path="id"/>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <form:input path="username" id="username" name="username" class="form-control" placeholder="Tài khoản *" value="" />
                                <form:errors path="username" style="color: yellow"/>
                                <p id="isUsernameValid" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <form:password path="password" id="password" class="form-control" placeholder="Mật khẩu *" value="" />
                                <form:errors path="password" style="color: yellow"/>
                            </div>
                            <div class="form-group">
                                <form:password path="rePassword" id="rePassword" class="form-control" placeholder="Nhập lại mật khẩu *" value="" />
                                <form:errors path="rePassword" style="color: yellow"/>
                                <p id="isPasswordMatched" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <form:input path="fullname" class="form-control" placeholder="Họ tên *" value="" />
                                <form:errors path="fullname" style="color: yellow"/>
                            </div>
                            <div class="form-group">
                                <form:input path="phone" name="phone" maxlength="12" id="phone" minlength="10" class="form-control" placeholder="Số điện thoại *" value="" />
                                <form:errors path="phone" style="color: yellow"/>
                                <p id="isPhoneValid" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <label for="birthday" style="color: white">Ngày sinh</label>
                                <form:input path="birthday" type="date" maxlength="10" minlength="10" id="birthday" placeholder="Ngày sinh*" class="form-control" value="" />
                                <form:errors path="birthday" style="color: yellow"/>
                            </div>
                            <%--Gender--%>
<%--                            <div class="form-check">--%>
<%--                                <form:radiobutton class="form-check-input" path="gender" id="man" value="Male" checked="checked" />--%>
<%--                                <label class="form-check-label" for="man" style="color: white">--%>
<%--                                    Nam--%>
<%--                                </label>--%>
<%--                            </div>--%>
<%--                            <div class="form-check">--%>
<%--                                <form:radiobutton class="form-check-input" path="gender" value="Female" id="woman"/>--%>
<%--                                <label class="form-check-label" for="woman" style="color: white">--%>
<%--                                    Nữ--%>
<%--                                </label>--%>
<%--                            </div>--%>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <form:input type="email" path="email" name="email" id="email" class="form-control" placeholder="Email *" value="" />
                                <form:errors path="email" style="color: yellow"/>
                                <p id="isEmailValid" style="color: yellow;"></p>
                            </div>
                            <div class="form-group">
                                <form:input path="cccd" type="text" class="form-control" placeholder="CMND/CCCD *" value="" />
                                <form:errors path="cccd" style="color: yellow"/>
                            </div>
                            <h5 style="color: white">Địa chỉ của bạn:</h5>
                            <div class="form-group">
                                <form:select class="form-control" id="provinceId" path="province">
                                    <option class="hidden"  selected disabled>Tỉnh/Thành phố*</option>
                                    <form:options items="${provinces}" itemLabel="name" itemValue="id"/>
                                </form:select>
                                <p id="checkProvince" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <form:select class="form-control" id="districtId" path="district">
                                    <option class="hidden" selected disabled>Quận/Huyện*</option>
                                </form:select>
                                <p id="checkDistrict" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <form:select class="form-control" id="subdistrictId" path="subdistrict">
                                    <option class="hidden" selected disabled>Xã/Phường*</option>
                                </form:select>
                                <p id="checkSubDistrict" style="color: yellow"></p>
                            </div>
                            <div class="form-group">
                                <form:input path="houseno" class="form-control" placeholder="Địa chỉ nhà*" value="" />
                                <form:errors path="houseno" style="color: yellow"/>
                            </div>
                            <div class="form-group">
                                <form:select class="form-control" path="roles">
                                    <option class="hidden"  selected disabled>Đăng ký là(Ứng viên hoặc nhà tuyển dụng)*</option>
                                    <option value="startup">Ứng viên</option>
                                    <option value="investors">Nhà tuyển dụng</option>
                                </form:select>
                            </div>
                            <input type="submit" class="btn btn-warning"  value="Đăng ký"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script src="js/validation.js"></script>
<script src="plugins/jQuery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
</body>
</html>