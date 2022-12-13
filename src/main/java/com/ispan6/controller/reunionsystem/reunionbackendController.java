package com.ispan6.controller.reunionsystem;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.bean.reunionsystem.Reunion;

@Controller
public class reunionbackendController {

	
	@GetMapping("/msg/reunionbackend")
	public String reunionbackend(Model model) {
	
		return "reunionbackend";
	}
}
