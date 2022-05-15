package com.doan.job.controllers.blog;


import com.doan.job.services.BlogServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BlogController {
    @Autowired
    private BlogServices blogServices;

    @GetMapping("/blog")
    public String getAllBlog(Model model){
        model.addAttribute("blog",blogServices.getAllBlogs());
        return "blog";
    }
    @GetMapping("/blog/details/{id}")
    public String getDetailsBlog(@PathVariable Long id, Model model){
        model.addAttribute("details",blogServices.getBlogById(id));
        return "detailsBlog";
    }
}