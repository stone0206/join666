package com.ispan6.dao.chatsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.Participants;

public interface ParticipantsDAO extends JpaRepository<Participants, Integer> {
	
	//user有多少聊天室
	@Query("from Participants p where p.personId=?1")
	public List<Participants> findGroupName(Integer personId);
	
	
	public List<Participants> findAllByUserIdId(Integer personId);
}
