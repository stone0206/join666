package com.ispan6.controller.chatsystem;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.service.chatsystem.ParticipantsService;

@Controller
public class ParticipantsController {
	@Autowired
	private ParticipantsService participantsService;
	
	@RequestMapping(path="/participants/add",method = RequestMethod.POST)
	@ResponseBody
	public String inserParticipants(@RequestParam Integer groupId,@RequestParam Integer personId) {
		participantsService.insertParticipants(groupId, personId);
		return "access";
	}
	
	@GetMapping(path="/participants/select")
	@ResponseBody
	public List<Participants> selectParticipants(@RequestParam Integer personId,Model m) {
		
		System.out.println(participantsService.selectParticipants(personId));
		return participantsService.selectParticipants(personId);
	}
}
