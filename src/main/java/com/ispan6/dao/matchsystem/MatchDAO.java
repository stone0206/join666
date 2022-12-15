package com.ispan6.dao.matchsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.membersystem.MemberTest;

public interface MatchDAO extends JpaRepository<MemberTest, Integer> {
	

	
}
