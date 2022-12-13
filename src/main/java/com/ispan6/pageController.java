package com.ispan6;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;
@Controller
public class pageController {
	@Autowired
	private MatchService matchService;

	
	@GetMapping("/login")
	public String getLogin(Model m) {
		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3",rand3);
		return "login";
	}
	
	@GetMapping("/index")
	public String backHome(Model m) {
		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3",rand3);
		return "index";
	}
	

	@GetMapping("/productbackend")
	public String backend() {
		return "productbackend";
	}
	

}
