package com.ispan6.controller.chatsystem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.chatsystem.GroupRoomService;
import com.ispan6.service.chatsystem.MessageService;
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
	
	@Autowired
	private MessageService messageService;
	
	
//	新增群組
	@RequestMapping(path = "/participants/add", method = RequestMethod.POST)
	@ResponseBody
	public String inserParticipants(@RequestParam Integer groupId, @RequestParam Integer personId) {
		participantsService.insertParticipants(groupId, personId);
		return "access";
	}

	// 成功 未完成 查群組 可能不需要
	@GetMapping(path = "/participants/select")
	@ResponseBody
	public List<GroupRoom> selectParticipants(@RequestParam Integer personId) {
		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(participantsService.selectParticipants(personId));

		return gList;
	}
	
	//查群組jpa 可能不需要
//	@GetMapping(path = "/participants/query")
//	@ResponseBody
//	public List<Participants> queryParticipants(@RequestParam Integer personId) {
//		return participantsService.queryParticipants(personId);
//	}

	// 搜尋誰傳的訊息 自己是哪個群組 群組名
	@GetMapping(path = "/participants/select1",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String,Object> selectParticipantsTest(HttpSession session,Model m) {
		
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		
		if(member != null) {
			Integer personId=Integer.valueOf(member.getId());
			System.out.println("personId"+personId);
			List<Participants> pList = participantsService.selectParticipants(personId);
			HashSet<Integer> userId = new HashSet<Integer>();
			
			List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(pList);
			for (int i = 0; i < gList.size(); i++) {
				GroupRoom g = gList.get(i);
				Set<Participants> pFile = g.getParticipants();
				for(Participants p:pFile) {
					userId.add(p.getPersonId());
					System.out.println("personId"+p.getPersonId());
				}
	
	
			}
			List<MemberTest> mList = mService.senderFile(userId);
			for (int i = 0; i < mList.size(); i++) {
				System.out.println(mList.get(i));
			}
			
			
			Map<String,Object> message=new HashMap<String,Object>();
			message.put("groomList", gList);
			message.put("memList", mList);
			message.put("userId", member.getId());
//			m.addAttribute("groomList", gList);
//			m.addAttribute("memList", mList);
//			session.setAttribute("groomList",gList);
//			session.setAttribute("memList",mList);
			return message;
		}
		return null;
	}
	
	
	//查member
	@GetMapping(path = "/memberTest/select")
	@ResponseBody
	public List<MemberTest> selectMember (@RequestParam Integer personId){
		List<Participants> pList = participantsService.selectParticipants(personId);
		HashSet<Integer> userId = new HashSet<Integer>();
		
		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(pList);
		for (int i = 0; i < gList.size(); i++) {
			GroupRoom g = gList.get(i);
			Set<Participants> pFile = g.getParticipants();
			for(Participants p:pFile) {
				userId.add(p.getPersonId());
				System.out.println("personId"+p.getPersonId());
			}


		}
		List<MemberTest> mList = mService.senderFile(userId);
		
		return mList;
	}
	
	
	@GetMapping(path = "/groupRoom/selectMessage")
	@ResponseBody
	public List<GroupRoom> selectMessage() {
		ArrayList<Integer> al=new ArrayList<Integer>();
		al.add(2);
		List<GroupRoom> g= groupRoomService.selectGroupRoom(al);
		return g;
	}
	
	@GetMapping(path = "/member/selectMessage")
	@ResponseBody
	public List<MemberTest> memberMessage() {
		HashSet<Integer> id = new HashSet<Integer>();
		id.add(2);
		List<MemberTest> mList = mService.senderFile(id);
		
		return mList;
	}
	// 測試 查聊天室資料 可能不需要
//	@GetMapping(path = "/participants/select2")
//	@ResponseBody
//	public List<Participants> findGroupFile(@RequestParam Integer participantsId) {
//		return participantsService.findGroupFile(participantsId);
//	}
	
	
	
	
	
	
	//Message
	
	//查某群組有什麼訊息
	@PostMapping(path = "/member/selectMessage")
	@ResponseBody
	public Map<String,Object>	findeGroupMessage(@RequestParam Integer groupId){
		HashSet<Integer> userId = new HashSet<Integer>();
		List<MessageContent> mesList=messageService.findeGroupMessage(groupId);
		for (int i = 0; i < mesList.size(); i++) {
			MessageContent g = mesList.get(i);
			userId.add(g.getSenderId());
			System.out.println(g.getSenderId());


		}
		
		List<MemberTest> mList = mService.senderFile(userId);
		Map<String,Object> message=new HashMap<String,Object>();
		message.put("memList", mList);
		message.put("messageList", mesList);
		
		return message;
		
	}
	
	//新增訊息
		@PostMapping(path="/msg/add",produces = "application/json; charset=UTF-8")
		@ResponseBody
		public MessageContent insertMessage(@RequestParam String text,@RequestParam Integer senderId,@RequestParam Integer groupId,Model m) {
			MessageContent msgText = messageService.insertMessage(text, senderId, groupId);
			System.out.println(msgText.getMessageId());
			return msgText;
		}
}
