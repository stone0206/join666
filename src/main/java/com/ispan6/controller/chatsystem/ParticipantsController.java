package com.ispan6.controller.chatsystem;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.chatsystem.GroupRoom;

import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.chatsystem.GroupRoomService;
import com.ispan6.service.chatsystem.ParticipantsService;
import com.ispan6.service.membersystem.MemberTestService;


@Controller
public class ParticipantsController {
	
	@Autowired
	private ParticipantsService participantsService;
	
	@Autowired
	private GroupRoomService groupRoomService;
	
	@Autowired
	private MemberTestService mService;
	
	
	@RequestMapping(path = "/participants/add", method = RequestMethod.POST)
	@ResponseBody
	public String inserParticipants(@RequestParam Integer groupId, @RequestParam Integer personId) {
		participantsService.insertParticipants(groupId, personId);
		return "access";
	}

	// 成功 未完成
	@GetMapping(path = "/participants/select")
	@ResponseBody
	public List<GroupRoom> selectParticipants(@RequestParam Integer personId) {
		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(participantsService.selectParticipants(personId));

		return gList;
	}

	@GetMapping(path = "/participants/query")
	@ResponseBody
	public List<Participants> queryParticipants(@RequestParam Integer personId) {
		return participantsService.queryParticipants(personId);
	}

	// 搜尋誰傳的訊息 測試
	@GetMapping(path = "/participants/select1")
	@ResponseBody
	public List<MemberTest>selectParticipantsTest(@RequestParam Integer personId,Model m) {
		
		List<Participants> pList = participantsService.selectParticipants(personId);
		HashSet<Integer> userId = new HashSet<Integer>();
		
		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(pList);
		for (int i = 0; i < gList.size(); i++) {
			GroupRoom g = gList.get(i);
			Set<Participants> pFile = g.getParticipants();
			for(Participants p:pFile) {
				userId.add(p.getPersonId());
				System.out.println(p.getPersonId());
			}


		}
		List<MemberTest> mList = mService.senderFile(userId);
		for (int i = 0; i < mList.size(); i++) {
			System.out.println(mList.get(i));
		}

		
		
//		m.addAttribute("gList",gList);
//		m.addAttribute("mList",mList);
//		m.addAttribute("pList",pList);
		return mList;
	}

	// 測試
	@GetMapping(path = "/participants/select2")
	@ResponseBody
	public List<Participants> findGroupFile(@RequestParam Integer participantsId) {
		return participantsService.findGroupFile(participantsId);
	}
}
