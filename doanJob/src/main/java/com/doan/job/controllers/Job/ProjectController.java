package com.doan.job.controllers.Job;

import com.doan.job.daos.UserDAO;
import com.doan.job.entities.Projects;
import com.doan.job.entities.Users;
import com.doan.job.forms.ProjectForm;
import com.doan.job.services.*;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;
    @Autowired
    private UserService userService;
    @Autowired
    private InvestorsServices investorsServices;

    @GetMapping("/user/userListProject")
    public String getUserListProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else if (user.getRoles().equals("startup")) {
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("listProjectOfUser", projectService.getAllProjectByUsername(user.getUsername()));
            return "user/userListProject";
        } else if (user.getRoles().equals("investors")) {
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("listInvesterOfUser", investorsServices.getAllProjectByUsername(user.getUsername()));
            return "user/userListProject";
        }
        return "user/userListProject";
    }

    @GetMapping("job/saveProject")
    public String getProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!user.getRoles().equals("startup")) {
                return "page404";
            }else {
                model.addAttribute("provinces", provinceService.getAllProvinces());
                model.addAttribute("categories", categoryService.getALlCategories());
                model.addAttribute("projectForm", new ProjectForm());
                return "job/saveProject";
            }
        }
    }

    @GetMapping("job/saveProject/{id}")
    public String getUpdateProject(Model model, HttpSession session, @PathVariable("id") Long projectId) {
        Users user = (Users) session.getAttribute("user");
        Projects project = projectService.getProjectById(projectId);
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!user.getUsername().equals(project.getUser().getUsername()) || project.getAceptedstatus() != 0) {
                return "page404";
            } else {
                model.addAttribute("project", project);
                model.addAttribute("provinces", provinceService.getAllProvinces());
                model.addAttribute("categories", categoryService.getALlCategories());
                model.addAttribute("projectForm", new ProjectForm(project.getId(), project.getCategory().getId(),
                        project.getProjectname(), project.getAmountcalled(), project.getProjectdetail(), project.getTitle(), project.getCountry(),
                        project.getProvince(), project.getDistrict(), project.getSubdistrict(), project.getHouseno()));
                return "job/saveProject";
            }
        }
    }

    @PostMapping("job/saveProject")
    public String postProject(Model model, @RequestParam("imageofproject") MultipartFile[]
            imageOfProject, @RequestParam("imagepresent") MultipartFile imagepresent,
                              @Valid @ModelAttribute("projectForm") ProjectForm projectForm, BindingResult bindingResult, HttpSession
                                      session) throws IOException {
        Users user = (Users) session.getAttribute("user");
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        } else {
            if (projectForm.getId() == null || projectForm.getId().equals("")) {
                java.util.Date posteddate = new java.util.Date();
                String imgPresent = imagepresent.getOriginalFilename();
                Path imgPresentPath = Paths.get("src/main/resources/static/images/projects/" + imgPresent);
                Files.write(imgPresentPath, imagepresent.getBytes());
                Projects project = projectService.saveProject(userDAO.getUsersByUsername(user.getUsername()), categoryService.getCategoryById(projectForm.getCategoryId()),
                        projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), "Việt Nam",
                        provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                        subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno(), imgPresent, posteddate);
                List<String> fileNames = new ArrayList<>();
                Arrays.asList(imageOfProject).stream().forEach(file -> {
                    String fileName = file.getOriginalFilename();
                    projectService.addImageOfProject(projectService.getProjectById(project.getId()), fileName);
                    fileNames.add(fileName);
                    Path imagePath = Paths.get("src/main/resources/static/images/projectImages/" + fileName);
                    try {
                        Files.write(imagePath, file.getBytes());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });
                return "redirect:/user/userListProject";
            } else {
                if (imagepresent.isEmpty() || imagepresent == null &&
                        imageOfProject.toString() == null || imageOfProject.toString().isEmpty()) {
                    projectService.updateProjectWithOutIMG(projectForm.getId(), categoryService.getCategoryById(projectForm.getCategoryId()),
                            projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), "Việt Nam",
                            provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                            subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno());
                } else if (imagepresent.isEmpty() || imagepresent == null) {
                    Projects project = projectService.updateProjectWithOutIMG(projectForm.getId(), categoryService.getCategoryById(projectForm.getCategoryId()),
                            projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), "Việt Nam",
                            provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                            subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno());
                    List<String> fileNames = new ArrayList<>();
                    Arrays.asList(imageOfProject).stream().forEach(file -> {
                        String fileName = file.getOriginalFilename();
                        if (projectService.checkImageExists(fileName)) {
                            projectService.deleteImageByName(fileName);
                            System.out.println(fileName);
                        }
                        projectService.addImageOfProject(projectService.getProjectById(project.getId()), fileName);
                        fileNames.add(fileName);
                        Path imagePath = Paths.get("src/main/resources/static/images/projectImages/" + fileName);
                        try {
                            Files.write(imagePath, file.getBytes());
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    });
                } else {
                    String imgPresent = imagepresent.getOriginalFilename();
                    Path imgPresentPath = Paths.get("src/main/resources/static/images/projects/" + imgPresent);
                    Files.write(imgPresentPath, imagepresent.getBytes());
                    Projects project = projectService.updateProject(projectForm.getId(), categoryService.getCategoryById(projectForm.getCategoryId()),
                            projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), "Việt Nam",
                            provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                            subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno(), imgPresent);
                    List<String> fileNames = new ArrayList<>();
                    System.out.println(fileNames);
                    Arrays.asList(imageOfProject).stream().forEach(file -> {
                        String fileName = file.getOriginalFilename();
                        if (projectService.checkImageExists(fileName)) {
                            projectService.deleteImageByName(fileName);
                        }
                        projectService.addImageOfProject(projectService.getProjectById(project.getId()), fileName);
                        fileNames.add(fileName);
                        Path imagePath = Paths.get("src/main/resources/static/images/projectImages/" + fileName);
                        try {
                            Files.write(imagePath, file.getBytes());
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    });
                }
                return "redirect:/user/userListProject";
            }
        }
        if (projectForm.getId() == null || projectForm.getId().equals("")) {
            model.addAttribute("message", "Vui lòng không để trống các trường, nhấn back để quay lại!");
            return "job/saveProject";
        } else {
            return "redirect:/job/saveProject/" + projectForm.getId();
        }
    }

    @GetMapping("/user/userListImage")
    public String getUserListImage(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("listImageOfUser", projectService.getAllImageByUsername(user.getUsername()));
            return "user/userListImage";
        }
    }


    @GetMapping("/job/acceptInvestion")
    public String getAcceptInvestion(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("countInvestors", projectService.countInvestors(user.getUsername(), 0));
            model.addAttribute("listProjectOfUser", projectService.getAllProjectByUsernameAndAcceptStatus(user.getUsername(), 0));
            return "job/acceptInvestion";
        }
    }

    @GetMapping("/job/acceptForInvestor/{projectId}/{userId}")
    public String getAcceptForInvestor(Model model, HttpSession session, @PathVariable("userId") Long userId,
                                       @PathVariable("projectId") Long projectId) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
//            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            projectService.acceptInvestor(projectId, userId);
            projectService.deleteInvestorRequest(projectId, 0);
            return "redirect:/job/acceptInvestion";
        }
    }
    @GetMapping("/job/delProject/{id}")
    public String delProject( @PathVariable("id") Long id,HttpSession session){
        projectService.delProject(id);
        return "redirect:/user/userListProject";
    }

}
