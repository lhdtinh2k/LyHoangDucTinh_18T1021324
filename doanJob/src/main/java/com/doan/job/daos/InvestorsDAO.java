package com.doan.job.daos;


import com.doan.job.entities.Candidate;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface InvestorsDAO extends JpaRepository<Candidate,Long> {

    @Query("SELECT pr FROM Candidate pr WHERE pr.user.username = ?1")
    List<Candidate> findAllByUsername(String username);

    @Query("select c from Candidate c")
        List<Candidate> getInvestors(Pageable pageable);

    @Query("SELECT count (c) FROM Candidate c")
    int getTotalInvestor();
}
