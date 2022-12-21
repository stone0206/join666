package com.ispan6.controller.reunionsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.reunionsystem.Reunionreport;
import com.ispan6.service.reunionsystem.ReunionreportService;

@Controller
public class reunionbackendController {

	@Autowired
	private ReunionreportService ReunionreportService;
	
	@GetMapping("/msg/reunionbackend")
	public String reunionbackend(Model model) {
		
		List<Reunionreport> reunionreport = ReunionreportService.getAllReunionreport();
		model.addAttribute("reunionreport",reunionreport);
		return "reunionbackend";
	}
	@GetMapping("/msg/testGet")
	@ResponseBody
	public Reunionreport test(Model model) {
		
		List<Reunionreport> reunionreport = ReunionreportService.getAllReunionreport();
		model.addAttribute("reunionreport",reunionreport);
		return reunionreport.get(0);
	}
	//deleteReunionreport
	
	@GetMapping("/deleteReunionreport")
	public String deleteReunionreport(@RequestParam Integer id) {
		ReunionreportService.deleteReunionreport(id);
		return "redirect:/msg/reunionbackend";
	}
	

}
