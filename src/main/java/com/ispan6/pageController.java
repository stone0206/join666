package com.ispan6;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class pageController {
	
	@GetMapping("/login")
	public String getLogin() {
		return "login";
	}
	
	@GetMapping("/index")
	public String backHome() {
		return "index";
	}
	

	@GetMapping("/productbackend")
	public String backend() {
		return "productbackend";
	}
	

}
