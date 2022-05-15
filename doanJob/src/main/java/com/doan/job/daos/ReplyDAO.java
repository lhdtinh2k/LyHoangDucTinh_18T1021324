package com.doan.job.daos;

import com.doan.job.entities.Replies;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyDAO  extends JpaRepository<Replies,Long> {
}
