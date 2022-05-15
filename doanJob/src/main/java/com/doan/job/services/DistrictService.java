package com.doan.job.services;

import com.doan.job.daos.DistrictDAO;
import com.doan.job.entities.Districts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DistrictService {
    @Autowired
    private DistrictDAO districtDAO;

    @Transactional
    public List<Districts> getDistrictByProvinceId (String id){
        return districtDAO.findDistinctByProvincesId(id);
    }
    @Transactional
    public String findDistrictNameById (String id){
        return districtDAO.findById(id).get().getName();
    }
}
