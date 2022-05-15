package com.doan.job.services;

import com.doan.job.daos.UserDAO;
import com.doan.job.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDAO userDAO;

    @Transactional
    public List<Users> getAllUser (){
        return userDAO.findAll();
    }
    @Transactional
    public int loginUser(String username, String password){
        return userDAO.findUsersByUsernameAndPassword(username, password);
    }
    @Transactional
    public Users getUserByUserName(String username){
        return userDAO.getUsersByUsername(username);
    }
    @Transactional
    public int checkUserExist(String username){
        return userDAO.checkUserExist(username);
    }

    @Transactional
    public void userRegister (String username, String password, String fullname, String  gender, String email, String phone,
                          String CCCD, Date birthDay, String country, String province, String district, String subDistrict,
                          String houseno, String role, String avatarUser){
        userDAO.save(new Users(username, password, fullname, gender, email, phone, CCCD, birthDay,
                country, province, district, subDistrict, houseno, role, avatarUser));
    }

    @Transactional
    public void updateProfile(Long id, String fullname, String gender, String email, String phone, String CCCD, Date birthday,
                         String province, String district, String subDistrict, String houseno, String job,String avatarUser){
        Users user = userDAO.findById(id).get();
        if(avatarUser == null || avatarUser.equals("")){
        user.setFullname(fullname);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone(phone);
        user.setCccd(CCCD);
        user.setBirthday(birthday);
        user.setProvince(province);
        user.setDistrict(district);
        user.setSubdistrict(subDistrict);
        user.setHouseno(houseno);
        user.setJob(job);
        userDAO.save(user);
        }else{
            user.setFullname(fullname);
            user.setGender(gender);
            user.setEmail(email);
            user.setPhone(phone);
            user.setCccd(CCCD);
            user.setBirthday(birthday);
            user.setProvince(province);
            user.setDistrict(district);
            user.setSubdistrict(subDistrict);
            user.setHouseno(houseno);
            user.setJob(job);
            user.setAvataruser(avatarUser);
            userDAO.save(user);
        }
    }
    @Transactional
    public void deleteUserById(Long id){
        userDAO.deleteById(id);
    }
}
