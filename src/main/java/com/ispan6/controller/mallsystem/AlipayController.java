package com.ispan6.controller.mallsystem;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.service.mallsystem.AlipayService;
import com.ispan6.service.mallsystem.OrderBeanService;

@Controller
public class AlipayController {
	
	@Autowired
	private AlipayService alipayService;
	
	@PostMapping("/alipay")
	@ResponseBody
	public String tradePagePay(@RequestParam Integer orderId) {
		String formStr = alipayService.payPageCreate(orderId);
		return formStr;
	}
	
	
}
