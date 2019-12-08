package com.EgorProject.VSportZale.repos;

import com.EgorProject.VSportZale.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
