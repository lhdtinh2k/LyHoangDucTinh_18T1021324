package com.doan.job.daos;

import com.doan.job.entities.News;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsDAO extends JpaRepository<News,Long> {
}
