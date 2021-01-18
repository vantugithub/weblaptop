package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.dto.User;

public interface UseRepository extends JpaRepository<User, Long> {
	User findOneByUserNameAndStatus(String username,int status);
}
