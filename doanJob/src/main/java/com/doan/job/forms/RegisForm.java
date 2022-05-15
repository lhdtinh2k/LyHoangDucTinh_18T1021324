package com.doan.job.forms;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RegisForm {
    private Long id;
    @NotBlank(message = "Vui lòng nhập tài khoản")
    private String username;
    @NotBlank(message = "Vui lòng nhập mật khẩu")
    private String password;
    private String rePassword;
    @NotBlank(message = "Vui lòng nhập họ tên")
    private String fullname;
    @NotBlank(message = "Vui lòng chọn giới tính")
    private String gender;
    @NotBlank(message = "Email không được trống")
    private String email;
    @NotBlank(message = "Vui lòng nhập số điện thoại")
    private String phone;
    @NotBlank(message = "Vui lòng nhập số thẻ CCCD hoặc CMND")
    private String cccd;
    private String birthday;
    private String province;
    private String district;
    private String subdistrict;
    @NotBlank(message = "Vui lòng nhập địa chỉ")
    private String houseno;
    private String roles;
    private String job;
    private String avataruser;

    public RegisForm(Long id,  String username, String fullname, String email,
                     String phone, String cccd, String birthday, String province, String district,
                     String subdistrict, String houseno, String job) {
        this.id = id;
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.cccd = cccd;
        this.birthday = birthday;
        this.province = province;
        this.district = district;
        this.subdistrict = subdistrict;
        this.houseno = houseno;
        this.job = job;
    }
}
