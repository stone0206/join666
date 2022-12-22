package com.ispan6.controller.chatsystem;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.service.chatsystem.MessageService;

@Controller
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	
	
	
	
	@GetMapping("/msg/que")
	@ResponseBody
	public List<MessageContent> findWhoSender(@RequestParam Integer senderId) {
		return messageService.findWhoSender(senderId);
	}
	
	
}
