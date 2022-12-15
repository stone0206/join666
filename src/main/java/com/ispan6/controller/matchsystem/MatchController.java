package com.ispan6.controller.matchsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.matchsystem.MatchBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.membersystem.MemberTestService;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchService;
	
	
	
	@GetMapping("/addfriend")
	public String getProduct() {

		return "addfriend";
	}
	
	
	@GetMapping("/newfriend")
	@ResponseBody
	public MemberTest newfriend(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member == null) {
			return matchService.random1();
		}
		return 	matchService.random1(member.getId());

	}
	
	@GetMapping("/addNewFriend")
	@ResponseBody
	public String addNewFriend(@RequestParam Integer id,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member == null) {
			return "請先登入";
		}
		MemberTest fuid = matchService.findById(id);
		MatchBean matchBean=new MatchBean() ;
		matchBean.setUserid(member);
		matchBean.setFuid(fuid);
		matchBean.setIsFriend(0);
		matchService.addNewFriend(matchBean);
		return "送出邀請成功";
	}
}
