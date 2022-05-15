package com.doan.job.forms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InvestorForm {
    private Long id;
    private Long userId;
    @NotBlank(message = "Vui lòng nhập tên")
    private String investorsname;
    @NotBlank(message = "Vui lòng nhập tên viết tắt")
    private String abbreviations;
    private String logo;
    @NotBlank(message = "Vui lòng nhập nội dung")
    private String content;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    @NotBlank(message = "Vui lòng nhập địa chỉ cụ thể")
    private String houseno;
    @NotBlank(message = "Vui lòng nhập số điện thoại liên lạc")
    private String sdt;
    @NotBlank(message = "Vui lòng nhập email")
    private String email;

//    public InvestorForm(Long id, @NotBlank(message = "Vui lòng nhập tên") String investorsname, @NotBlank(message = "Vui lòng nhập tên viết tắt") String abbreviations, String logo, @NotBlank(message = "Vui lòng nhập nội dung") String content, String country, String province, String district, String subdistrict, @NotBlank(message = "Vui lòng nhập địa chỉ cụ thể") String houseno, @NotBlank(message = "Vui lòng nhập số điện thoại liên lạc") String sdt, String email) {
//        this.id = id;
//        this.investorsname = investorsname;
//        this.abbreviations = abbreviations;
//        this.logo = logo;
//        this.content = content;
//        this.country = country;
//        this.province = province;
//        this.district = district;
//        this.subdistrict = subdistrict;
//        this.houseno = houseno;
//        this.sdt = sdt;
//        this.email = email;
//    }
}
