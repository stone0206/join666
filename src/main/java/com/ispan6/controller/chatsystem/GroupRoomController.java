package com.ispan6.controller.chatsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.service.chatsystem.GroupRoomService;

@Controller
public class GroupRoomController {
	@Autowired
	private GroupRoomService groupRoomService;
	
	@PostMapping("/groupRoom/add")
	@ResponseBody
	public String insertGroupRoom(@RequestParam String groupName,@RequestParam Integer groupType) {
		groupRoomService.insertGroupRoom(groupName, groupType);
		return "success";
	}
	
	@GetMapping("/userHaveGroup/selcet")
	@ResponseBody
	public List<GroupRoom> userHaveGroupSelect(@RequestBody List<Participants> pList) {
		
		
		
		return groupRoomService.userHaveGroupSelect(pList);
	}
}
