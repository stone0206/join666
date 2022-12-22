package com.ispan6.dao.matchsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.matchsystem.MatchBean;

public interface MatchDAO extends JpaRepository<MatchBean, Integer> {
	
	@Query(value = "SELECT * from friend where (userid = ?1 or fuid=?2)and isfriend=1 ", nativeQuery = true)
	public List<MatchBean> findMyFriend(Integer id,Integer fid);
	
	
	
	@Query(value = "SELECT * from friend where userid = ?1 and isfriend=0 ", nativeQuery = true)
	public List<MatchBean> findMyInvitation(Integer id);
	
	@Query(value = "SELECT * from friend where fuid = ?1 and isfriend=0 ", nativeQuery = true)
	public List<MatchBean> findWhoSendInvitation(Integer id);
	
	@Query(value = "SELECT * from friend where userid = ?1 and fuid=?2 ", nativeQuery = true)
	public MatchBean findFriend(Integer uid,Integer fid);
	
	@Modifying
	@Query(value = "update friend set isfriend=1 where userid = ?1 and fuid=?2 ", nativeQuery = true)
	public void agreeInvitation(Integer uid,Integer fid);
}
