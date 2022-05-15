package com.doan.job.controllers.Job;

import com.doan.job.entities.Projects;
import com.doan.job.entities.Users;
import com.doan.job.services.BlogServices;
import com.doan.job.services.CategoryService;
import com.doan.job.services.ProjectService;
import com.doan.job.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomepageController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserService userService;
    @Autowired
    private BlogServices blogServices;
    @Autowired
    private CategoryService categoryService;
    public static final int PAGE_SIZE = 8;
    @GetMapping("job/listProject")
    public String getListProject(Model model, HttpSession session,
    @RequestParam(value = "page", defaultValue = "1") int page) {
        session.getAttribute("user");
        model.addAttribute("listProjects", projectService.getAllProjects(1, PageRequest.of(page-1,PAGE_SIZE)));
        model.addAttribute("pageSize",(projectService.getTotalProject()/PAGE_SIZE)+1);
        model.addAttribute("categories", categoryService.getALlCategories());
        return "job/listProject";
    }



    @PostMapping("job/listProject")
    public String postSearchCategory(Model model, @RequestParam("categoryId") Long categoryId,
                                     @RequestParam(value = "page", defaultValue = "1") int page){
        model.addAttribute("listProjects", projectService.getProjectsByCategoryId( categoryId,1, PageRequest.of(page-1,20)));
//        model.addAttribute("pageSize",(projectService.getTotalProjectByCategoryId(categoryId)/20)+1);
        model.addAttribute("categories", categoryService.getALlCategories());
        System.out.println("da di qua");
        return "job/listProject";
    }
    @GetMapping("job/searchProject")
    public String getSearchProject(){
        return "redirect:/job/listProject";
    }

    @PostMapping("/job/searchProject")
    public String postSearchProject (Model model, @RequestParam("projectName") String projectName, @RequestParam(value = "page", defaultValue = "1") int page){
        model.addAttribute("listProjects", projectService.searchProjects( 1,"%" + projectName + "%", PageRequest.of(page-1,20)));
        model.addAttribute("pageSize",(projectService.getTotalSearchResult(1, "%" + projectName + "%")/20)+1);
        model.addAttribute("categories", categoryService.getALlCategories());
        return "job/listProject";

    }
    @PostMapping("/job/searchProjectByMount")
    public String postSearchProjectByMount (Model model, @RequestParam("mount") double amount, @RequestParam(value = "page", defaultValue = "1") int page){
        model.addAttribute("listProjects", projectService.searchProjectsByMount( 1, amount , PageRequest.of(page-1,20)));
        model.addAttribute("pageSize",(projectService.getTotalSearchProjectsByMount(1, amount)/20)+1);
        model.addAttribute("categories", categoryService.getALlCategories());
        return "job/listProject";

    }

    @GetMapping("/job/projectDetail/{id}")
    public String getHomepage(HttpSession session, Model model, @PathVariable("id") Long projectId){
        session.getAttribute("user");

        model.addAttribute("blog",blogServices.getAllBlogs());
        model.addAttribute("numComment", projectService.getNumberOfCommentByProjectId(projectId));
        model.addAttribute("comments", projectService.getAllCommentByProjectId(projectId));
        model.addAttribute("imageOfProject", projectService.getAllImageByProjectId(projectId));
        model.addAttribute("project", projectService.getProjectById(projectId));

        return "job/projectDetail";

    }

    @PostMapping("/job/voteStar")
    public String postRate (HttpServletRequest request, HttpSession session){
        String star = request.getParameter("ratedStar");
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        } else {
            if (star.equals("") || star == null) {
                star = String.valueOf(5);
            }
            float starRated = Float.parseFloat((star));
            Long projectId = Long.valueOf(request.getParameter("projectId"));
            Projects project = projectService.getProjectById(projectId);
            float totalRate = project.getTotalvoted();
            int sumRate = project.getSumvoted();

            float avgRate = (float) (Math.round(((totalRate * sumRate + starRated) / (sumRate + 1)) *10)/10);
            projectService.updateRating(projectId, (totalRate * sumRate + starRated) / (sumRate + 1), project.getSumvoted() + 1);
            return "redirect:/job/projectDetail/" + projectId;
        }
    }

    @PostMapping("/job/postComment")
    public String postComment (HttpServletRequest request, Model model, HttpSession session){
        String comment = request.getParameter("binhluan");
        Long projectId = Long.valueOf(request.getParameter("projectId"));
        String username = request.getParameter("username");
        java.util.Date posteddate = new java.util.Date();
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        } else {
            if (comment.equals("") || comment == null) {
                return "redirect:/job/projectDetail/" + projectId;
            }

            projectService.addComment(userService.getUserByUserName(username),
                    projectService.getProjectById(projectId), comment, posteddate);
            return "redirect:/job/projectDetail/" + projectId;
        }
    }


}
