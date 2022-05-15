package com.doan.job.daos;

import com.doan.job.entities.Comments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentsDAO extends JpaRepository<Comments, Long> {
    @Query("SELECT cmt FROM Comments cmt WHERE cmt.project.id = ?1")
    List<Comments> findAllByProjectId(Long id);

    @Query("SELECT COUNT(cmt.project.id) FROM Comments cmt WHERE cmt.project.id = ?1")
    int findTotalCommentByProjectId(Long id);
}
