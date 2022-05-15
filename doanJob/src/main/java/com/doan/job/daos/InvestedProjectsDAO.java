package com.doan.job.daos;

import com.doan.job.entities.InvestedProjects;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface InvestedProjectsDAO extends JpaRepository<InvestedProjects,Long> {
    @Query("SELECT ip FROM InvestedProjects ip WHERE ip.project.id = ?1 AND ip.user.id = ?2")
    InvestedProjects getAllByProjectIdAndUserId(Long projectId, Long userId);

    @Transactional
    @Modifying
    @Query("DELETE FROM InvestedProjects WHERE project.id = ?1 AND acceptstatus = ?2")
    void deleteByProjectId(Long projectId, int acceptStatus);
}
