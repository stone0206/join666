package com.ispan6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "signup3";
	}

	@RequestMapping("/googlelogin")
	public String googlelogin() {
		return "redirect:https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/LoginGoogleHandler&response_type=code&client_id=378093448501-ebvinmo23u9l8lmljs9souqd3953nbqg.apps.googleusercontent.com&approval_prompt=force";
	}
	
}
