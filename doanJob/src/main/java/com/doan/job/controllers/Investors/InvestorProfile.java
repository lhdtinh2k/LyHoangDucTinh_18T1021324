package com.doan.job.controllers.Investors;

import com.doan.job.daos.UserDAO;
import com.doan.job.entities.Candidate;
import com.doan.job.entities.Users;
import com.doan.job.forms.InvestorForm;
import com.doan.job.services.*;
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

@Controller
public class InvestorProfile {

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

    @GetMapping("/investor/timViec")
    public String getUserListProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        }
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("listInvesterOfUser", investorsServices.getAllProjectByUsername(user.getUsername()));
            return "find-job";
    }
    @GetMapping("investor/save/{id}")
    public String getUpdateInvestor(Model model, HttpSession session, @PathVariable("id") Long investorId){
        Users user = (Users) session.getAttribute("user");
        Candidate investors = investorsServices.getInvestorsById(investorId);
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else{
            if(!user.getUsername().equals(investors.getUser().getUsername())){
                return "page404";
            } else{
                model.addAttribute("investors", investors);
                model.addAttribute("provinces", provinceService.getAllProvinces());
                model.addAttribute("investorsForm", new InvestorForm(investors.getId(),investors.getUser().getId(),
                        investors.getInvestorsname(), investors.getAbbreviations(), investors.getLogo(), investors.getContent(),
                        investors.getCountry(), investors.getProvince(), investors.getDistrict(), investors.getSubdistrict(),investors.getHouseno(),investors.getSdt(),investors.getEmail()));
                return "saveCompany";
            }
        }
    }

    @PostMapping("investor/save")
    public String postUpdateInvestor(Model model, @RequestParam("logo") MultipartFile logo,
                                     @Valid @ModelAttribute("investorsForm") InvestorForm investorForm, BindingResult bindingResult, HttpSession session) throws IOException {
        Users user = (Users) session.getAttribute("user");
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        } else {
            if (investorForm.getId() == null || investorForm.getId().equals("")) {
                String imgPresent = logo.getOriginalFilename();
                if (!imgPresent.contains(".jpg") && !imgPresent.contains(".png")) {
                    model.addAttribute("message", "Invalid image file");
                    return "saveCompany";
                }
                Path imgPresentPath = Paths.get("src/main/resources/static/ndt/images/nhadautu/" + imgPresent);
                Files.write(imgPresentPath, logo.getBytes());
                investorsServices.saveInvestor(userDAO.getUsersByUsername(user.getUsername()), investorForm.getInvestorsname(), investorForm.getAbbreviations(), imgPresent, investorForm.getContent(), "Việt Nam",
                        provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
                        subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(), investorForm.getSdt(), investorForm.getEmail());
                return "redirect:/investor/company";
            } else{
                String imgPresent = logo.getOriginalFilename();
                if (!imgPresent.contains(".jpg") && !imgPresent.contains(".png")) {
                    model.addAttribute("message", "Invalid image file");
                    return "saveCompany";
                }
                Path imgPresentPath = Paths.get("src/main/resources/static/ndt/images/nhadautu/" + imgPresent);
                Files.write(imgPresentPath, logo.getBytes());
                investorsServices.updateInvestor(investorForm.getId(),
                        investorForm.getInvestorsname(), investorForm.getAbbreviations(), imgPresent, investorForm.getContent(), "Việt Nam",
                        provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
                        subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(), investorForm.getSdt(), investorForm.getEmail());
                return "redirect:/investor/company";
            }
        }
        if (investorForm.getId() == null || investorForm.getId().equals("")) {
            model.addAttribute("message", "Vui lòng không để trống các trường, nhấn back để quay lại!");
            return "saveCompany";
        } else {
            return "redirect:/investor/company";
        }
    }

    @PostMapping("investor/saveBai")
    public String postUpdateBaiDang(Model model,
                                     @Valid @ModelAttribute("investorsForm") InvestorForm investorForm, BindingResult bindingResult, HttpSession session) throws IOException {
        Users user = (Users) session.getAttribute("user");

        investorsServices.saveInvestor(user,
                investorForm.getInvestorsname(), "", "", investorForm.getContent(), "Việt Nam",
                "", "",
                "", "", "", "");
        return "redirect:/investor/timViec";

    }

    @GetMapping("investor/save")
    public String getProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!user.getRoles().equals("investors")) {
                return "page404";
            } else {
                model.addAttribute("provinces", provinceService.getAllProvinces());
                model.addAttribute("categories", categoryService.getALlCategories());
                model.addAttribute("investorsForm", new InvestorForm());
                return "savePost";
            }
        }
    }
    @GetMapping("/investor/delete/{id}")
    public String deleteInvestors(@PathVariable("id") Long investorsId) {
        investorsServices.delete(investorsId);
        return "redirect:/investor/timViec";
    }
}
