package com.doan.job.daos;

import com.doan.job.entities.Categories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao extends JpaRepository<Categories,Long> {
}
