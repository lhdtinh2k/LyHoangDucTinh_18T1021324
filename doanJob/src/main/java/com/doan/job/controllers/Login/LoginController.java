package com.doan.job.controllers.Login;

import com.doan.job.entities.Users;
import com.doan.job.forms.LoginForm;
import com.doan.job.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String getLogin(Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(user != null){
            return "redirect:/job/listProject";
        }
        model.addAttribute("loginForm", new LoginForm());
        return "login";
    }

    @PostMapping("/login")
    public String postLogin(Model model, @Valid @ModelAttribute("loginForm") LoginForm loginForm, BindingResult bindingResult,
    HttpSession session){
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }
        String username = loginForm.getUsername().trim();
        //Ma hoa
        String password = loginForm.getPassword().trim();
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

        if(userService.loginUser(username, myHash) == 1){
            Users user = userService.getUserByUserName(username);
            session.setAttribute("user", user);
            if(("startup").equals(user.getRoles())){
                return "redirect:/job/listProject";
            } else if (("investors").equals(user.getRoles())) {
                return "redirect:/investor";
            } else if (("admin").equals(user.getRoles())) {
                return "redirect:/admin/";
            }
        }
        model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "/login";
    }


}
