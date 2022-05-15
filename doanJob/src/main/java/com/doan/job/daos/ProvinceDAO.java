package com.doan.job.daos;

import com.doan.job.entities.Provinces;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProvinceDAO extends JpaRepository<Provinces, String> {
}
