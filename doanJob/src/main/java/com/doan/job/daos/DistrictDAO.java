package com.doan.job.daos;

import com.doan.job.entities.Districts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DistrictDAO extends JpaRepository<Districts, String> {
    @Query("SELECT d FROM Districts d WHERE d.province.id = ?1")
    List<Districts> findDistinctByProvincesId(String id);
}
