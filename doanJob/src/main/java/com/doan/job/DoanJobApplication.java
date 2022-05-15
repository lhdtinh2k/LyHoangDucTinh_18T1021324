package com.doan.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DoanJobApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoanJobApplication.class, args);
		System.out.println("Đã load xong!");

//		Khi dùng security nên lưu ý về việc mật khẩu bị mã hoá :)
	}

}
