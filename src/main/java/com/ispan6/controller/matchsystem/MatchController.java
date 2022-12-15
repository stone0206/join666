package com.ispan6.controller.matchsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;

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

		return 	matchService.random1(member.getId());

	}
}
