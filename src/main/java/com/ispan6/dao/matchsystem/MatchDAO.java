package com.ispan6.dao.matchsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.membersystem.MemberTest;

public interface MatchDAO extends JpaRepository<MemberTest, Integer> {
	

	@Query(value = "SELECT top 3* from memberTest where m_id != ?1 ORDER BY NEWID()", nativeQuery = true)
	public List<MemberTest> random3Members(Integer id);
	

	@Query(value = "SELECT top 3* from memberTest  ORDER BY NEWID()", nativeQuery = true)
	public List<MemberTest> random3Members();
	

	@Query(value = "SELECT top 1* from memberTest where m_id != ?1 ORDER BY NEWID()", nativeQuery = true)
	public MemberTest random1(Integer id);
	

	@Query(value = "SELECT top 1* from memberTest ORDER BY NEWID()", nativeQuery = true)
	public MemberTest random1();
	
}
