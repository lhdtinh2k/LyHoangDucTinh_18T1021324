package com.doan.job.services;

import com.doan.job.daos.BlogDAO;
import com.doan.job.entities.Blogs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class BlogServices {
    @Autowired
    private BlogDAO blogDAO;

    @Transactional
    public List<Blogs> getAllBlogs(){
        return blogDAO.findAll();
    }

    @Transactional
    public int countBlogs(){
        return blogDAO.getTotalBlogs();
    }

    @Transactional
    public Blogs getBlogById (Long id){
        return blogDAO.findById(id).get();
    }

    @Transactional
    public Blogs saveBlog (String title, String content, Date posteddate, String image){
        return blogDAO.save(new Blogs(title,content,posteddate,image));
    }
    @Transactional
    public Blogs updateBlog (Long id,String title, String content, String image){
        Blogs blogs = blogDAO.findById(id).get();
        blogs.setTitle(title);

        blogs.setContent(content);
        blogs.setImage(image);
        return blogDAO.save(blogs);
    }
    @Transactional
    public void deleteBlogById(Long id){
        blogDAO.deleteById(id);
    }
}