package com.doan.job.controllers.Investors;



import com.doan.job.entities.InvestedProjects;
import com.doan.job.entities.Users;
import com.doan.job.services.InvestorsProjectServices;
import com.doan.job.services.InvestorsServices;
import com.doan.job.services.ProjectService;
import com.doan.job.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;


@Controller
public class InvestorsController {
    @Autowired
    private InvestorsServices investorsServices;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private InvestorsProjectServices investorsProjectServices;
    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    private Environment env;

    public static final int PAGE_SIZE = 8;
    @GetMapping("/investor")
    public String getListInvestor(Model model, HttpSession session,
                                 @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable= PageRequest.of(page-1,PAGE_SIZE);
        session.getAttribute("user");
        model.addAttribute("investors", investorsServices.getAllInvestors(pageable));
        model.addAttribute("pageSize",(investorsServices.getTotalInvestor()/PAGE_SIZE)+1);
        return "investor";
    }

    @GetMapping("/investor/details/{id}")
    public String deDetailsInvestors(@PathVariable("id") Long investorsId, Model model) {
            model.addAttribute("details", investorsServices.getInvestorsById(investorsId));
            return "investorsdetails";

    }
    @PostMapping("/investor/registration")
    public String getRegistrationProject( HttpSession session,@RequestParam("id") Long id,
                                          @RequestParam("from") String from,@RequestParam("to") String to,
                                          @RequestParam("subject") String subject,@RequestParam("body") String body) throws MessagingException, UnsupportedEncodingException {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        }
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom(env.getProperty("spring.mail.username"),"Dương Văn Nhân");
        helper.setTo(to);
        helper.setText(body);
        helper.setSubject(subject);
        investorsProjectServices.registration(user,projectService.getProjectById(id));
        /*SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from)
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);*/
        javaMailSender.send(message);
        return "redirect:/startup/projectDetail/"+id;
    }

    @GetMapping("investedProjects")
    public List<InvestedProjects> getRegistrationProject(){
       return investorsProjectServices.getAll();
    }
}
