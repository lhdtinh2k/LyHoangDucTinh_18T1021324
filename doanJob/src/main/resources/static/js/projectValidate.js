function validateProject() {
    const amountcalled = document.forms["saveProjectForm"]["amountcalled"].value;
    // const province = document.forms["saveProjectForm"]["province"].value;
    const province = $('#provinceId').val()
    const district = $('#districtId').val()
    const subDistrict = $('#subdistrictId').val()
    const projectname = document.forms["saveProjectForm"]["projectname"].value;
    const title = document.forms["saveProjectForm"]["title"].value;
    // const district = document.forms["saveProjectForm"]["district"].value;
    // const subDistrict = document.forms["saveProjectForm"]["subdistrict"].value;
    if(projectname==""){
        $('#isNameEmpty').html("Vui lòng nhập tên cho dự án");
        return false;
    }
    if(title==""){
        $('#isTitleEmpty').html("Vui lòng nhập tiêu đề (Mục đích) của dự án");
        return false;
    }
    if(!(isNumber(amountcalled)) || amountcalled < 100000){
        // alert("Thông tin không hợp lệ!");
        $('#isNumeric').html("Vui lòng nhập số tiền > 100.000 đ");
        return false;
    }else{
        $('#isNumeric').html("");
    }
    if(province=="Tỉnh/Thành phố*"){
        // alert("Thông tin không hợp lệ!");
        $('#checkProvince').html("Vui lòng chọn Tỉnh/thành phố!");
        return false;
    }else{
        $('#checkProvince').html("");
    }
    if(district=="Quận/Huyện*" || district === ""){
        // alert("Thông tin không hợp lệ!");
        $('#checkDistrict').html("Vui lòng chọn Quận/huyện!");
        return false;
    }else{
        $('#checkDistrict').html("");
    }
    if(subDistrict=="Xã/Phường*" || subDistrict === ""){
        // alert("Thông tin không hợp lệ!");
        document.getElementById("subdistrictId").innerHTML = "";
        $('#checkSubDistrict').html("Vui lòng chọn Xã/phường!");
        return false;
    }else {
        $('#checkSubDistrict').html("");
    }
}