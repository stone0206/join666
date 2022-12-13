package com.ispan6.controller.membersystem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.membersystem.MemberTestService;

@Controller
//@SessionAttribute("loginUser")
public class MemberTestController {
	@Autowired
	private MemberTestService mService;
	
	@Autowired
	private MatchService matchService;

	
	
	@PostMapping("/login2")
	public String login(@RequestParam String account, @RequestParam String password, Model model) {
		
		MemberTest mt = mService.findByAccAndPwd(account, password);
		System.out.println(mt.getEmail());
		model.addAttribute("loginUser", mt);
		
		return "index";
	}
	
	@PostMapping("/login")
	public String login2(HttpServletRequest request, HttpServletResponse response,Model m) {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		MemberTest mt = mService.findByAccAndPwd(account, password);

		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3",rand3);
		HttpSession session= request.getSession();
		
		session.setAttribute("loginUser", mt);
		
		return "index";
	}
	
	@PostMapping("/update")
	public String update1(HttpServletRequest request, HttpServletResponse response) {
		String account = request.getParameter("account");
		String avator = request.getParameter("avator");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		System.out.println("avator:"+avator);
		mService.updateByAcc(account, avator, name, address);
		
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus status,Model m) {
		HttpSession session= request.getSession();
		status.setComplete();
		session.invalidate();
		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3",rand3);
		return "index";
	}
	
	@GetMapping("/showprofile")
	public String showProfile() {
		return "showOneUser";
	}
}
