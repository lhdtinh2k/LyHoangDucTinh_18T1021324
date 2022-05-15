package com.doan.job.forms;

import lombok.*;

import javax.validation.constraints.NotBlank;


@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoginForm {
    @NotBlank(message = "Vui lòng nhập tài khoản")
    private String username;
    @NotBlank(message = "Vui lòng nhập mật khẩu")
    private String password;
}
