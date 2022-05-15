package com.doan.job.services;

import com.doan.job.daos.InvestedProjectsDAO;
import com.doan.job.entities.InvestedProjects;
import com.doan.job.entities.Projects;
import com.doan.job.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InvestorsProjectServices {
    @Autowired
    private InvestedProjectsDAO investedProjectsDAO;


    @Transactional
    public void registration(Users users,Projects projects){
        investedProjectsDAO.save(new InvestedProjects(users,projects));
    }
    @Transactional
    public List<InvestedProjects> getAll(){
       return investedProjectsDAO.findAll();
    }
}
