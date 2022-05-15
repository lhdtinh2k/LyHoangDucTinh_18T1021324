package com.doan.job.daos;

import com.doan.job.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserDAO extends JpaRepository<Users, Long> {
    @Query("SELECT count(s.username) FROM Users s WHERE s.username = ?1 AND s.passwords = ?2" )
    int findUsersByUsernameAndPassword (String username, String password);

    @Query("SELECT s FROM Users s WHERE s.username = ?1")
    Users getUsersByUsername(String username);

    @Query("SELECT count(s.username) FROM Users s WHERE s.username = ?1")
    int checkUserExist(String username);

}
