package com.doan.job.controllers.Job;

import com.doan.job.services.DistrictService;
import com.doan.job.services.SubDistrictService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class JsonSelectedProvince {
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;

    @GetMapping("/province/{provinceId}")
    public @ResponseBody
    String getDistrict(@PathVariable("provinceId") String provinceId, HttpSession session) {
        session.setAttribute("provinceId", provinceId);
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
            ajaxResponse = mapper.writeValueAsString(districtService.getDistrictByProvinceId(provinceId));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }
    @GetMapping("/district/{districtId}")
    public @ResponseBody
    String getSubDistrict(@PathVariable("districtId") String districtId, HttpSession session) {
        session.setAttribute("districtId", districtId);
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
            ajaxResponse = mapper.writeValueAsString(subDistrictService.getSubDistrictByDistrictId(districtId));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }
}
