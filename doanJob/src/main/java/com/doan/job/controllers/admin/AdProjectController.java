package com.doan.job.controllers.admin;


import com.doan.job.entities.Users;
import com.doan.job.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;


@Controller
public class                               AdProjectController {
    @Autowired
    private ProjectService projectService;

    @GetMapping("/admin")
    public String getHomePage(HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (("admin").equals(user.getRoles())){
                return "redirect:/admin/statistics";
            }
            return "page404";
        }
    }

    @GetMapping("/admin/ListProject")
    public String getProjectByStatus(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!("admin").equals(user.getRoles())){
                return "page404";
            }
            model.addAttribute("listProject", projectService.getProjectsByAceptedstatus());
            return "listProject";
        }
    }

    @GetMapping("/admin/listProject/detailsProject/{id}")
    public String getDetailsProject(@PathVariable Long id, Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!("admin").equals(user.getRoles())){
                return "page404";
            }
            model.addAttribute("project", projectService.getDetailProjectById(id));
            return "detailsProject";
        }
    }

    @GetMapping("/admin/listProject/detailsProject/acept/{id}")
    public String getAceptProject(@PathVariable("id") Long id, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!("admin").equals(user.getRoles())){
                return "page404";
            }
            projectService.acept(id);
            return "redirect:/admin/ListProject";
        }
    }

    @GetMapping("/admin/listProject/detailsProject/deny/{id}")
    public String getDenyProject(@PathVariable("id") Long id, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!("admin").equals(user.getRoles())){
                return "page404";
            }
            projectService.deny(id);
            return "redirect:/admin/ListProject";
        }
    }

    @GetMapping("/admin/statistics")
    public String getStatistics(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!("admin").equals(user.getRoles())){
                return "page404";
            }

            model.addAttribute("total", projectService.getTotalProject());
            model.addAttribute("projects", projectService.getAllProject());
            return "statistical";
        }
    }


}
