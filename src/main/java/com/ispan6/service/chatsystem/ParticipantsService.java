package com.ispan6.service.chatsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.chatsystem.ParticipantsDAO;

@Transactional
@Service
public class ParticipantsService {
	@Autowired
	private ParticipantsDAO participantsDAO;
	
	//新增成員
	public void insertParticipants(Integer groupId,Integer personId) {
		Participants participants=new Participants();
		MemberTest memberTest=new MemberTest();
		memberTest.setId(personId);
		participants.setUserId(memberTest);
		GroupRoom groupRoom=new GroupRoom();
		groupRoom.setGroupId(groupId);
		participants.setGroupRoomId(groupRoom);
		participantsDAO.save(participants);
	}
//	user有幾個聊天室
	public List<Participants> selectParticipants(Integer personId) {
		
		return participantsDAO.findGroupName(personId);
		
	}
	
	public List<Participants> queryParticipants(Integer personId){
		return participantsDAO.findAllByUserIdId(personId);
	}
}
