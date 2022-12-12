package com.ispan6.controller.matchsystem;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Demo {

	@GetMapping("/addfriend")
	public String getProduct() {

		return "addfriend";
	}
}
