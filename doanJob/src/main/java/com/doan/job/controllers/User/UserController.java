package com.doan.job.controllers.User;


import com.doan.job.entities.Users;
import com.doan.job.forms.RegisForm;
import com.doan.job.forms.UserForm;
import com.doan.job.services.DistrictService;
import com.doan.job.services.ProvinceService;
import com.doan.job.services.SubDistrictService;
import com.doan.job.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;


    @GetMapping("/register")
    public String getRegister(Model model) {
        model.addAttribute("provinces", provinceService.getAllProvinces());
        model.addAttribute("enrollForm", new RegisForm());
        return "register";
    }

    @PostMapping("/saveUser")
    public String postRegister(Model model, @Valid @ModelAttribute("enrollForm") RegisForm regisForm, BindingResult bindingResult, HttpSession session) {
        model.addAttribute("provinces", provinceService.getAllProvinces());
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        }
        if (userService.checkUserExist(regisForm.getUsername()) == 1) {
            bindingResult.rejectValue("username", "error.user", "Tài khoản đã tồn tại");
        } else {
            if (!regisForm.getPassword().equals(regisForm.getRePassword())) {
                bindingResult.rejectValue("rePassword", "error.user", "Mật khẩu không khớp nhau");
            } else {
                if (regisForm.getBirthday() == null || regisForm.getBirthday().equals("")) {
                    bindingResult.rejectValue("birthday", "error.user", "Vui lòng chọn ngày sinh");
                } else {
                    Date tgiansd = Date.valueOf(regisForm.getBirthday());
                    java.util.Date date = new java.util.Date();
                    if (tgiansd.after(date)) {
                        bindingResult.rejectValue("birthday", "error.user", "Hãy chọn ngày sinh nhỏ hơn!");
                    } else {

                        //Ma hoa
                        String password = regisForm.getPassword();
                        MessageDigest md = null;
                        try {
                            md = MessageDigest.getInstance("MD5");
                        } catch (NoSuchAlgorithmException e) {
                            e.printStackTrace();
                        }
                        md.update(password.getBytes());
                        byte[] digest = md.digest();
                        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
                        System.out.println("My Hash: " + myHash);


                        userService.userRegister(regisForm.getUsername(), myHash, regisForm.getFullname(), regisForm.getGender(),
                                regisForm.getEmail(), regisForm.getPhone(), regisForm.getCccd(), Date.valueOf(regisForm.getBirthday()), "Việt Nam",
                                provinceService.findProvinceNameById(regisForm.getProvince()), districtService.findDistrictNameById(regisForm.getDistrict()),
                                subDistrictService.findSubDistrictNameById(regisForm.getSubdistrict()), regisForm.getHouseno(), regisForm.getRoles(), "empty.png");
                        Users user = userService.getUserByUserName(regisForm.getUsername());
                        session.setAttribute("user", user);
                        if (("startup").equals(user.getRoles())) {
                            return "redirect:/job/listProject";
                        } else if (("investors").equals(user.getRoles())) {
                            return "redirect:/job/listProject";
                        }else if (("admin").equals(user.getRoles())) {
                            return "redirect:/admin";
                        }
                    }
                }
            }
        }
        model.addAttribute("message", "Vui lòng điền đầy đủ thông tin!");
        return "register";
    }

    @GetMapping("/user/userProfile")
    public String getUserProfile(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            return "user/userProfile";
        }
    }

    @GetMapping("/user/updateProfile")
    public String getUpdateProfile(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            Users getUser = userService.getUserByUserName(user.getUsername());
            model.addAttribute("profileUser", getUser);
            model.addAttribute("updateForm", new UserForm(getUser.getId(), getUser.getFullname(),
                    getUser.getEmail(), getUser.getPhone(), getUser.getCccd(), user.getBirthday().toString(),
                    getUser.getProvince(), user.getDistrict(), getUser.getSubdistrict(), getUser.getHouseno(), getUser.getJob(), getUser.getAvataruser()));
            model.addAttribute("provinces", provinceService.getAllProvinces());
            return "user/updateProfile";
        }
    }

    @PostMapping("/user/updateProfile")
    public String postUpdateProfile(Model model, @Valid @ModelAttribute("updateForm") UserForm userForm, BindingResult bindingResult
            , @RequestParam("avatarUser") MultipartFile avatarUser, HttpSession session) throws IOException {
        model.addAttribute("provinces", provinceService.getAllProvinces());
        Date birthDay;
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        } else {
            if (userForm.getBirthday() == null || userForm.getBirthday().equals("")) {
                Users user = (Users) session.getAttribute("user");
                LocalDateTime datetime = LocalDateTime.parse(user.getBirthday().toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
                String newDateFormat = datetime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                userForm.setBirthday(newDateFormat);
//                userForm.setBirthday(user.getBirthday().toString());
//                bindingResult.rejectValue("birthday", "error.user", "Vui lòng chọn ngày sinh" );
            } else {
                birthDay = Date.valueOf(userForm.getBirthday());
                java.util.Date date = new java.util.Date();
                if (birthDay.after(date)) {
                    bindingResult.rejectValue("birthday", "error.user", "Hãy chọn ngày sinh nhỏ hơn!");
                    return "user/updateProfile";
                }
            }
            String filename;
            if (avatarUser == null || avatarUser.getOriginalFilename().equals("")) {
                filename = null;
            } else {
                filename = avatarUser.getOriginalFilename();
                Path imgPresentPath = Paths.get("src/main/resources/static/images/userImages/" + filename);
                Files.write(imgPresentPath, avatarUser.getBytes());
            }
//                    if(userForm.getProvince())
            try {
                int a = Integer.parseInt(userForm.getProvince());
                userService.updateProfile(userForm.getId(), userForm.getFullname(), userForm.getGender(),
                        userForm.getEmail(), userForm.getPhone(), userForm.getCccd(), Date.valueOf(userForm.getBirthday()),
                        provinceService.findProvinceNameById(userForm.getProvince()), districtService.findDistrictNameById(userForm.getDistrict()),
                        subDistrictService.findSubDistrictNameById(userForm.getSubdistrict()), userForm.getHouseno(), userForm.getJob(), filename);

            } catch (NumberFormatException e) {
                userService.updateProfile(userForm.getId(), userForm.getFullname(), userForm.getGender(),
                        userForm.getEmail(), userForm.getPhone(), userForm.getCccd(), Date.valueOf(userForm.getBirthday()),
                        userForm.getProvince(), userForm.getDistrict(), userForm.getSubdistrict(), userForm.getHouseno(), userForm.getJob(), filename);
            }
            return "redirect:/user/userProfile";

        }
        return "user/updateProfile";
    }
}
