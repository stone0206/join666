package com.ispan6.dao.matchsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.membersystem.MemberTest;

public interface MatchDAO extends JpaRepository<MemberTest, Integer> {
	

	@Query(value = "SELECT top 3* from memberTest ORDER BY NEWID()", nativeQuery = true)
	public List<MemberTest> random3Members();

}
