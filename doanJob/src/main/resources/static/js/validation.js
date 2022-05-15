window.onload = function(e) {

    document.getElementById("rePassword").addEventListener("change", function (e) {
        console.log(e.target.value, this.value);
        const password = document.getElementById("password");
        if (password.value == this.value || this.value == "") {
            document.getElementById("isPasswordMatched").innerHTML = "Mật khẩu đã khớp ✔";
        } else {
            document.getElementById("isPasswordMatched").innerHTML = "Mật khẩu không trùng khớp ✘ ";
        }
    });

    document.getElementById("phone").addEventListener("change", function (e) {
        console.log(e.target.value, this.value);
        if (isPhoneValid(this.value)) {
            document.getElementById("isPhoneValid").innerHTML = "";
        } else {
            document.getElementById("isPhoneValid").innerHTML = "Số điện thoại không hợp lệ ";
        }
    });

    document.getElementById("email").addEventListener("change", function (e) {
        console.log(e.target.value, this.value);
        if (validateEmail(this.value)) {
            document.getElementById("isEmailValid").innerHTML = "";
        } else {
            document.getElementById("isEmailValid").innerHTML = "Email không hợp lệ! ";
        }
    });

    // document.getElementById("maKH").addEventListener("change", function (e) {
    //     console.log(e.target.value, this.value);
    //     if (checkMaKH(this.value)) {
    //         document.getElementById("isMaKHValid").innerHTML = " ID Correct! ";
    //     } else {
    //         document.getElementById("isMaKHValid").innerHTML = " ID invalid! ";
    //     }
    // });
}
function isNumber(number) {
    var numbers = /^[0-9]+$/;
    return number.match(numbers)
}
function isPhoneValid(str) {
    return /(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/.test(number);;
}

function isAlphabet(text) {
    var re = text.match(/^[a-z0-9]+$/i);
    if (re == null) {
        return false
    } else {
        return true
    }
}


function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validateProfile() {
    const fullName = document.forms["formUpdate"]["fullname"].value;
    const gender = document.forms["formUpdate"]["gender"].value;
    const email = document.forms["formUpdate"]["email"].value;
    const phone = document.forms["formUpdate"]["phone"].value;
    const province = document.forms["formUpdate"]["province"].value;
    const district = document.forms["formUpdate"]["district"].value;
    const subDistrict = document.forms["formUpdate"]["subdistrict"].value;
    if(fullName == "" || fullName == null){
        // alert("Thông tin không hợp lệ!");
        $('#isNameValid').html("Vui lòng nhập họ tên!");
        return false;
    }
    if (email == "" || !validateEmail(email)) {
        // alert("Thông tin không hợp lệ!");
        $('#isEmailValid').html("Email không hợp lệ!");
        return false;
    }
    if (phone == "" || !isPhoneValid(phone)) {
        // alert("Thông tin không hợp lệ!");
        $('#isPhoneValid').html("Số điện thoại không hợp lệ!");
        return false;
    }
    if(gender==""){
        // alert("Thông tin không hợp lệ")
        $('#genderErrror').html("Vui lòng chọn giới tính");
        return false;
    }
    if(province=="Tỉnh/Thành phố*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkProvince').html("Vui lòng chọn Tỉnh/thành phố!");
        return false;
    }
    if(district=="Quận/Huyện*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkDistrict').html("Vui lòng chọn Quận/huyện!");
        return false;
    }
    if(subDistrict=="Xã/Phường*" || subDistrict ==""){
        // alert("Thông tin không hợp lệ!");
        document.getElementById("subdistrictId").innerHTML = "";
        $('#checkSubDistrict').html("Vui lòng chọn Xã/phường!");
        return false;
    }
}


function validateData() {
    const phone = document.forms["formRegister"]["phone"].value;
    const email = document.forms["formRegister"]["email"].value;
    const username = document.forms["formRegister"]["username"].value;
    const password = document.forms["formRegister"]["password"].value;
    const rePassword = document.forms["formRegister"]["rePassword"].value;
    const province = document.forms["formRegister"]["province"].value;
    const district = document.forms["formRegister"]["district"].value;
    const subDistrict = document.forms["formRegister"]["subdistrict"].value;
    if (username == "" || !isAlphabet(username)) {
        // alert("Thông tin không hợp lệ!");
        $('#isUsernameValid').html("Tên đăng nhập không hợp lệ!");
        return false;
    }
    if(password != rePassword || password == ""){
        // alert("Thông tin không hợp lệ!");
        $('#isPasswordMatched').html("Mật khẩu không trùng khớp!");
        return false;
    }
    if (phone == "" || !isPhoneValid(phone)) {
        // alert("Thông tin không hợp lệ!");
        $('#isPhoneValid').html("Số điện thoại không hợp lệ!");
        return false;
    }
    if (email == "" || !validateEmail(email)) {
        // alert("Thông tin không hợp lệ!");
        $('#isEmailValid').html("Email không hợp lệ!");
        return false;
    }

    if(province=="Tỉnh/Thành phố*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkProvince').html("Vui lòng chọn Tỉnh/thành phố!");
        return false;
    }
    if(district=="Quận/Huyện*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkDistrict').html("Vui lòng chọn Quận/huyện!");
        return false;
    }
    if(subDistrict=="Xã/Phường*" || subDistrict ==""){
        // alert("Thông tin không hợp lệ!");
        document.getElementById("subdistrictId").innerHTML = "";
        $('#checkSubDistrict').html("Vui lòng chọn Xã/phường!");
        return false;
    }
}

function validateInvestor() {
    const province = document.forms["saveInvestorForm"]["province"].value;
    const investorsname = document.forms["saveInvestorForm"]["investorsname"].value;
   // const abbreviations = document.forms["saveInvestorForm"]["abbreviations"].value;
    const abbreviations = $('#abbreviations').val();
    const district = document.forms["saveInvestorForm"]["district"].value;
    const subDistrict = document.forms["saveInvestorForm"]["subdistrict"].value;
    if(investorsname===""){
        $('#isNameEmpty').html("Vui lòng nhập tên cho công ty");
        return false;
    }else {
        $('#isNameEmpty').html("");
    }
    if(abbreviations===""){
        $('#isTitleEmpty').html("Vui lòng nhập tên viết tắt của công ty");
        return false;
    }else {
        $('#isTitleEmpty').html("");
    }
    if(province=="Tỉnh/Thành phố*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkProvince').html("Vui lòng chọn Tỉnh/thành phố!");
        return false;
    }else{
        $('#checkProvince').html("");
    }
    if(district=="Quận/Huyện*" || district == ""){
        // alert("Thông tin không hợp lệ!");
        $('#checkDistrict').html("Vui lòng chọn Quận/huyện!");
        return false;
    }else{
        $('#checkDistrict').html("");
    }
    if(subDistrict=="Xã/Phường*" || subDistrict ==""){
        // alert("Thông tin không hợp lệ!");
        document.getElementById("subdistrictId").innerHTML = "";
        $('#checkSubDistrict').html("Vui lòng chọn Xã/phường!");
        return false;
    }else {
        $('#checkSubDistrict').html("");
    }
    return true;
}