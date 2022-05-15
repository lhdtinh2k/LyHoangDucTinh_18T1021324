package com.doan.job.daos;

import com.doan.job.entities.Blogs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BlogDAO extends JpaRepository<Blogs,Long> {
    @Query("select count(p) from Blogs p")
    int getTotalBlogs();
}
