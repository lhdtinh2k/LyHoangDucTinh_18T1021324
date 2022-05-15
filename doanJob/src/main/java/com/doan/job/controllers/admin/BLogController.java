package com.doan.job.controllers.admin;

import com.doan.job.entities.Blogs;
import com.doan.job.entities.Users;
import com.doan.job.services.BlogServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class BLogController {
    @Autowired
    private BlogServices blogServices;

    @GetMapping("/admin/blog")
    private String getListBlog(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("blogs", blogServices.getAllBlogs());
            model.addAttribute("total", blogServices.countBlogs());
            return "listBlog";
        }
    }
    @GetMapping("/admin/blog/save")
    public String getAddBlog(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!user.getRoles().equals("admin")) {
                return "page404";
            } else {
                model.addAttribute("blogForm", new Blogs());
                return "saveBlog";
            }
        }
    }
    @PostMapping("/admin/blog/save")
    public String postUpdateBLog(Model model,@RequestParam("image") MultipartFile image,
                                 @Valid @ModelAttribute("blogForm") Blogs blogs, BindingResult bindingResult, HttpSession session) throws IOException {
        Users user = (Users) session.getAttribute("user");
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        }
        if (blogs.getId() == null || blogs.getId().equals("")) {
            String imgPresent = image.getOriginalFilename();
            Path imgPresentPath = Paths.get("src/main/resources/static/images/blog/" + imgPresent);
            Files.write(imgPresentPath, image.getBytes());
            java.util.Date posteddate = new java.util.Date();
            blogServices.saveBlog(blogs.getTitle(),blogs.getContent(),posteddate,imgPresent);
            return "redirect:/admin/blog";
        }
        String imgPresent = image.getOriginalFilename();
        Path imgPresentPath = Paths.get("src/main/resources/static/images/blog/" + imgPresent);
        Files.write(imgPresentPath, image.getBytes());
        blogServices.updateBlog(blogs.getId(),blogs.getTitle(),blogs.getContent(),imgPresent);
        return "redirect:/admin/blog";
    }
    @GetMapping("admin/saveBLog/{id}")
    public String getUpdateBLog(Model model, HttpSession session, @PathVariable("id") Long id){
        Users user = (Users) session.getAttribute("user");
        Blogs blogs = blogServices.getBlogById(id);
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else{
            model.addAttribute("blogs", blogs);
            model.addAttribute("blogForm", new Blogs(blogs.getId(),blogs.getTitle(),
                    blogs.getContent(),blogs.getPosteddate(),blogs.getImage()));
            return "saveBlog";
        }
    }
    @GetMapping("/admin/deleteBLog/{id}")
    public String deleteBLog(@PathVariable Long id, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            blogServices.deleteBlogById(id);
            return "redirect:/admin/blog";
        }
    }
}