package com.doan.job.daos;

import com.doan.job.entities.SubDistricts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SubDistrictDAO extends JpaRepository<SubDistricts, String> {
    @Query("SELECT sd FROM SubDistricts sd WHERE sd.district.id = ?1")
    List<SubDistricts> getSubDistrictsByDistrictId(String districtId);
}
