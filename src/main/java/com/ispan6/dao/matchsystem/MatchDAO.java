package com.ispan6.dao.matchsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.matchsystem.MatchBean;

public interface MatchDAO extends JpaRepository<MatchBean, Integer> {
	
	@Query(value = "SELECT * from friend where userid = ?1 and isfriend=1 ", nativeQuery = true)
	public MatchBean findMyFriend(Integer id);
	
	@Query(value = "SELECT * from friend where userid = ?1 and fuid=?2 ", nativeQuery = true)
	public MatchBean findFriend(Integer uid,Integer fid);
	

	
}
