package com.doan.job.services;

import com.doan.job.daos.CategoryDao;
import com.doan.job.entities.Categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    @Transactional
    public List<Categories> getALlCategories(){
        return categoryDao.findAll();
    }

    @Transactional
    public Categories getCategoryById (Long id){
        return categoryDao.findById(id).get();
    }
}
