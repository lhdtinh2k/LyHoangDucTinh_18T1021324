package com.doan.job.services;

import com.doan.job.daos.CommentsDAO;
import com.doan.job.daos.ImageOfProjectDAO;
import com.doan.job.daos.InvestedProjectsDAO;
import com.doan.job.daos.ProjectDAO;
import com.doan.job.entities.*;
import com.doan.job.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ProjectService {
    @Autowired
    private ProjectDAO projectDAO;
    @Autowired
    private ImageOfProjectDAO imageOfProjectDAO;
    @Autowired
    private CommentsDAO commentsDAO;
    @Autowired
    private InvestedProjectsDAO investedProjectsDAO;

    @Transactional
    public List<Projects> getAllProjects(int acceptStatus,Pageable pageable){
        return projectDAO.getProjectsByTotalvoted(acceptStatus, pageable);
    }
    @Transactional
    public List<Projects> getProjectsByCategoryId(Long categoryId, int acceptStatus,Pageable pageable){
        return projectDAO.getProjectsByCategoryId(categoryId, acceptStatus, pageable);
    }

    @Transactional
    public List<Projects> searchProjects(int acceptStatus, String projectName, Pageable pageable){
        return projectDAO.searchProjects(acceptStatus, projectName, pageable);
    }

    @Transactional
    public List<Projects> searchProjectsByMount(int acceptStatus, double amount, Pageable pageable){
        return projectDAO.searchProjectsByMount(acceptStatus, amount, pageable);
    }

    @Transactional
    public int getTotalSearchProjectsByMount(int acceptedStatus, double amount){
        return projectDAO.getTotalSearchByMount(acceptedStatus, amount);
    }

    @Transactional
    public int getTotalSearchResult(int acceptedStatus, String projectName){
        return projectDAO.getTotalSearchResult(acceptedStatus, projectName);
    }

    @Transactional
    public Projects getProjectById(Long id){
        return projectDAO.findById(id).get();
    }

    @Transactional
    public Projects saveProject (Users user, Categories category, String projectName, double amountCalled, String projectDetail,
                                 String title, String country, String province, String district, String subDistrict, String houseNo, String imgPresent, Date postedDay){
        return projectDAO.save(new Projects(user, category, projectName, amountCalled, projectDetail, title, country, province,
                district, subDistrict, houseNo, imgPresent, postedDay));
    }

    @Transactional
    public Projects updateProject (Long id, Categories category, String projectName, double amountCalled, String projectDetail,
                                 String title, String country, String province, String district, String subDistrict, String houseNo, String imgPresent){
        Projects project = projectDAO.findById(id).get();
        project.setCategory(category);
        project.setProjectname(projectName);
        project.setAmountcalled(amountCalled);
        project.setProjectdetail(projectDetail);
        project.setTitle(title);
        project.setCountry(country);
        project.setProvince(province);
        project.setDistrict(district);
        project.setSubdistrict(subDistrict);
        project.setHouseno(houseNo);
        project.setImagepresent(imgPresent);
        return projectDAO.save(project);
    }

    @Transactional
    public Projects updateProjectWithOutIMG (Long id, Categories category, String projectName, double amountCalled, String projectDetail,
                                   String title, String country, String province, String district, String subDistrict, String houseNo){
        Projects project = projectDAO.findById(id).get();
        project.setCategory(category);
        project.setProjectname(projectName);
        project.setAmountcalled(amountCalled);
        project.setProjectdetail(projectDetail);
        project.setTitle(title);
        project.setCountry(country);
        project.setProvince(province);
        project.setDistrict(district);
        project.setSubdistrict(subDistrict);
        project.setHouseno(houseNo);
        return projectDAO.save(project);
    }

    @Transactional
    public void updateRating(Long id, float totalVoted, int sumVoted){
        Projects project = projectDAO.findById(id).get();
        project.setTotalvoted(totalVoted);
        project.setSumvoted(sumVoted);
        projectDAO.save(project);
    }

    @Transactional
    public int getTotalProject(){
        return projectDAO.getTotalProducts();
    }
    @Transactional
    public int getTotalProjectByCategoryId(Long categoryId){
        return projectDAO.getTotalProductsByCategoryId(categoryId);
    }

    @Transactional
    public List<Projects> getAllProjectByUsername (String username){
        return projectDAO.findAllByUsername(username);
    }


    //Image of project
    @Transactional
    public List<ImageOfProject> getAllImageByProjectId (Long id){
        return imageOfProjectDAO.findAllImageByProjectId(id);
    }
    @Transactional
    public void addImageOfProject( Projects project, String fileName){
        imageOfProjectDAO.save(new ImageOfProject(project, fileName));
    }

    @Transactional
    public boolean checkImageExists (String imageName){
        if(imageOfProjectDAO.checkImageNameExists(imageName) > 0){
            return true;
        }else{
            return false;
        }
    }

    @Transactional
    public List<ImageOfProject> getAllImageByUsername (String username){
        return imageOfProjectDAO.getALlImageByUserName(username);
    }

    @Transactional
    public void deleteImageById (Long id){
        imageOfProjectDAO.deleteById(id);
    }

    @Transactional
    public void deleteImageByName (String imageName){
        imageOfProjectDAO.deleteByImagename(imageName);
    }

    //Comments
    @Transactional
    public void addComment(Users user, Projects project, String comment, Date postedDay){
        commentsDAO.save(new Comments(user, project, comment, postedDay));
    }
    /**
     * Get list of comment by id
     * @param id
     * @return
     */
    @Transactional
    public List<Comments> getAllCommentByProjectId (Long id){
        return commentsDAO.findAllByProjectId(id);
    }

    /**
     * get number of comment
     * @param id
     * @return Number of comment
     */
    @Transactional
    public int getNumberOfCommentByProjectId (Long id){
        return commentsDAO.findTotalCommentByProjectId(id);
    }

    @Transactional
    public List<Projects> getAllProjectByUsernameAndAcceptStatus (String username, int acceptStatus){
        return projectDAO.findAllByUsernameAndInvestionStatus(username, acceptStatus);
    }

    @Transactional
    public void acceptInvestor (Long projectId, Long userId){
        InvestedProjects investedProject = investedProjectsDAO.getAllByProjectIdAndUserId(projectId, userId);
        investedProject.setAcceptstatus(1);
    }
    @Transactional
    public int countInvestors (String username, int acceptStatus){
        return projectDAO.countInvestors(username, acceptStatus);
    }


    @Transactional
    public void deleteInvestorRequest(Long projectId, int acceptStatus){
        investedProjectsDAO.deleteByProjectId(projectId, acceptStatus);
    }


    //Amin action
    @Transactional
    public Projects getDetailProjectById(Long id){
        return projectDAO.findById(id).get();
    }

    @Transactional
    public List<Projects> getProjectsByAceptedstatus(){
        return projectDAO.findProjectsByAceptedstatus();
    }

    @Transactional
    public void acept(Long id){
        Projects projects = projectDAO.findById(id).get();
        projects.setAceptedstatus(1);
        projectDAO.save(projects);
    }

    @Transactional
    public void deny(Long id){
        Projects projects = projectDAO.findById(id).get();
        projects.setAceptedstatus(0);
        projectDAO.save(projects);
    }

    @Transactional
    public List<Projects> getAllProject(){
        return projectDAO.findAll();
    }


    @Transactional
    public void delProject(Long id){ projectDAO.deleteById(id);
    }
}
