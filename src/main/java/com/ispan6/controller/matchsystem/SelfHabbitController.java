package com.ispan6.controller.matchsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ispan6.service.matchsystem.SelfHabbitService;

@Controller
public class SelfHabbitController {

	@Autowired
	private SelfHabbitService selfService;
	
	
}
