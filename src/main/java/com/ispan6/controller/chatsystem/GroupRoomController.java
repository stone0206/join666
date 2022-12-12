package com.ispan6.controller.chatsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.service.chatsystem.GroupRoomService;

@Controller
public class GroupRoomController {
	@Autowired
	private GroupRoomService groupRoomService;
	
	@PostMapping("/groupRoom/add")
	@ResponseBody
	public String insertGroupRoom(@RequestParam String groupName,@RequestParam Integer groupType) {
		groupRoomService.insertGroupRoom(groupName, groupType);
		return "access";
	}
}
