package com.ispan6.service.chatsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.chatsystem.MessageDAO;



@Transactional
@Service
public class MessageService {
	@Autowired
	private MessageDAO messageDAO;
	
	
	public void insertOrUpdate(MessageContent msg) {
		messageDAO.save(msg);
	}
	
	//新增訊息
	public MessageContent insertMessage(String text,Integer senderId,Integer groupId) {
		MessageContent msgText=new MessageContent();
		msgText.setSenderId(senderId);
		msgText.setGroupId(groupId);
		msgText.setMessageText(text);
		messageDAO.save(msgText);
		return msgText;
	}
	//搜尋誰傳的訊息 測試
	public List<MessageContent> findWhoSender(Integer senderId) {
		
		return messageDAO.findWhoSender(senderId);
	}
}
