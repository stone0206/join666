package com.ispan6.dao.chatsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;

public interface MessageDAO extends JpaRepository<MessageContent, Integer> {
	
	@Query("from MessageContent m where m.senderId=?1")
	public List<MessageContent> findWhoSender(Integer senderId);
	
	
	//查某群組有什麼訊息
	@Query("from MessageContent m where m.groupId=?1")
	public List<MessageContent>	findeGroupMessage(Integer groupId);
}
