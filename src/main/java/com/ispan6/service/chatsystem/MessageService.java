package com.ispan6.service.chatsystem;

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
	
	
	public MessageContent insertMessage(String text,Integer senderId,Integer groupId) {
		MessageContent msgText=new MessageContent();
		MemberTest memberBean=new MemberTest();
		memberBean.setId(senderId);
		msgText.setUserId(memberBean);
		GroupRoom groupRoom=new GroupRoom();
		groupRoom.setGroupId(groupId);
		msgText.setGroupRoomId(groupRoom);
		msgText.setMessageText(text);
		messageDAO.save(msgText);
		return msgText;
	}
}
