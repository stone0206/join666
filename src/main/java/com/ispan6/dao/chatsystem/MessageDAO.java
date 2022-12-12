package com.ispan6.dao.chatsystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan6.bean.chatsystem.MessageContent;

public interface MessageDAO extends JpaRepository<MessageContent, Integer> {
	
}
