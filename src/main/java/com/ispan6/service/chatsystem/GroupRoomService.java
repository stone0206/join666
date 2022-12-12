package com.ispan6.service.chatsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.dao.chatsystem.GroupRoomDAO;

@Transactional
@Service
public class GroupRoomService {
	@Autowired
	private GroupRoomDAO groupRoomDAO;
	
	public void insertOrUpdate(GroupRoom groupRoom) {
		groupRoomDAO.save(groupRoom);
	}
//	新增聊天室
	public void insertGroupRoom(String groupName,Integer groupType) {
		GroupRoom groupRoom = new GroupRoom();
		groupRoom.setGroupName(groupName);
		groupRoom.setGroupType(groupType);
		groupRoomDAO.save(groupRoom);
	}
	

}
