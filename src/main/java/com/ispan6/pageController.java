package com.ispan6;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		return "login";
	}
	
	@GetMapping("/index")
	public String backHome(Model m) {
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);
		return "index";
	}
	
	@GetMapping("/")
	public String homePage(Model m) {
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);
		return "index";
	}

	@GetMapping("/productbackend")
	public String backend() {
		return "productbackend";
	}
	
	@GetMapping("/signup")
	public String goSignUp() {
		return "signup";
	}

}
