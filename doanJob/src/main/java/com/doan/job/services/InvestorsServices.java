package com.doan.job.services;

import com.doan.job.daos.InvestorsDAO;
import com.doan.job.entities.Candidate;
import com.doan.job.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InvestorsServices {
    @Autowired
    private InvestorsDAO investorsDAO;


    @Transactional
    public List<Candidate> getAllInvestors(Pageable pageable){
        return investorsDAO.getInvestors(pageable);
    }
    @Transactional
    public int getTotalInvestor(){
        return investorsDAO.getTotalInvestor();
    }

    @Transactional
    public Candidate getInvestorsById (Long id){
        return investorsDAO.findById(id).get();
    }

    @Transactional
    public List<Candidate> getAllProjectByUsername (String username){
        return investorsDAO.findAllByUsername(username);
    }
    @Transactional
    public Candidate saveInvestor (Users user, String investorsname, String abbreviations, String logo, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        return investorsDAO.save(new Candidate(user, investorsname, abbreviations, logo, content, country, province,
                district, subdistrict, houseno,sdt,email));
    }

    @Transactional
    public void delete(long id){
        investorsDAO.deleteById(id);
    }

    @Transactional
    public Candidate updateInvestorWithOutIMG (Long id, String investorsname, String abbreviations, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        Candidate investors = investorsDAO.findById(id).get();
        investors.setInvestorsname(investorsname);
        investors.setAbbreviations(abbreviations);
        investors.setContent(content);
        investors.setCountry(country);
        investors.setProvince(province);
        investors.setDistrict(district);
        investors.setSubdistrict(subdistrict);
        investors.setHouseno(houseno);
        investors.setSdt(sdt);
        investors.setEmail(email);
        return investorsDAO.save(investors);
    }
    @Transactional
    public Candidate updateInvestor (Long id, String investorsname, String abbreviations, String logo, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        Candidate investors = investorsDAO.findById(id).get();
        investors.setInvestorsname(investorsname);
        investors.setAbbreviations(abbreviations);
        investors.setLogo(logo);
        investors.setContent(content);
        investors.setCountry(country);
        investors.setProvince(province);
        investors.setDistrict(district);
        investors.setSubdistrict(subdistrict);
        investors.setHouseno(houseno);
        investors.setSdt(sdt);
        investors.setEmail(email);
        return investorsDAO.save(investors);
    }
}
