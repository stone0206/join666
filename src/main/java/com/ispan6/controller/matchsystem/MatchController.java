package com.ispan6.controller.matchsystem;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;

@Controller
public class MatchController {

	private MatchService matchService;
	
	
	@GetMapping("/addfriend")
	public String getProduct() {

		return "addfriend";
	}
	
	@GetMapping("/random3members")
	public String random3members(Model m) {
		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3",rand3);
		return "index";
	}
}
