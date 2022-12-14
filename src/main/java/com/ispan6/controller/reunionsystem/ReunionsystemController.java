package com.ispan6.controller.reunionsystem;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.service.reunionsystem.ReunionsystemService;



@Controller
public class ReunionsystemController {
	
	@Autowired
	private ReunionsystemService wService;
	
	
//	@GetMapping("/msg/add")
//	public String insert1(Model model) {
//		Reunion m1 = new Reunion();
//		
//		model.addAttribute("workMessages", m1);
//		
//		Reunion latestMsg = wService.getLatest();
//		
//		model.addAttribute("latestMsg", latestMsg);
//		
//		return "message/addMessage";
//	}
	
	@PostMapping("/msg/post")
	public String postInsert(@ModelAttribute("workMessages") Reunion msg ) {
		// insert
		wService.insert(msg);
		
		return "redirect:/msg/add";
	}
	

	@GetMapping("/msg/page")
	public String pageList(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Reunion> page = wService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "reunion";
	}
	
	@GetMapping("/msg/insertreunion")
	public String insertreunion(Model model) {
		
		
		return "addreunion";
	}
	
	
	
	@GetMapping("/msg/detailedparty")
	public String detailedparty(Model model) {
		
		
		return "detailedparty";
	}
	
	
	
	
	
//	@ResponseBody
//	@PostMapping("/msg/insert2")
//	public WorkMessages insert2(@RequestBody WorkMessages msg) {
//		return repo.save(msg);
//	}
//	
//	@ResponseBody
//	@PostMapping("/msg/insert3")
//	public List<WorkMessages> insert3(@RequestBody List<WorkMessages> msgList){
//		return repo.saveAll(msgList);
//	}
//	
//	@ResponseBody
//	@PostMapping("/msg/All")
//	public List<WorkMessages> getAll(){
//		return repo.findAll();
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/{id}")
//	public WorkMessages findById(@PathVariable Integer id) {
//		Optional<WorkMessages> optional = repo.findById(id);
//		
//		if(optional.isPresent()) {
//			WorkMessages returnData = optional.get();
//			return returnData;
//		}
//		
//		WorkMessages errorMsg = new WorkMessages();
//		errorMsg.setText("沒有這筆資料");
//		
//		return errorMsg;
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/page")
//	public List<WorkMessages> findByPage(@RequestParam(name = "p", required = false,defaultValue = "1") Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"id");
//		Page<WorkMessages> page = repo.findAll(pgb);
//		return page.getContent();
//	}
//	
//
//	
//	@ResponseBody
//	@GetMapping("/msg/text")
//	public List<WorkMessages> findMsgByText(@RequestParam(name = "t") String text){
//		
//		return repo.findMsgByText2(text);
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/native/text")
//	public List<WorkMessages> findMsgByTextNativeQuery(@RequestParam(name = "t") String text){
//		
//		return repo.findMsgByTextNative(text);
//	}
//	
//	
//	@ResponseBody
//	@GetMapping("/msg/like/text")
//	public List<WorkMessages> findMsgLikeText(@RequestParam(name = "t") String text){
//		
////		return repo.findMsgLikeText(text);
//		return repo.findMsgLikeText2(text);
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/delete/{id}")
//	public String deleteTest(@PathVariable("id") Integer id) {
//		repo.deleteMsgById(id);
//		return "刪除OK";
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/jpql")
//	public List<WorkMessages> testJPQL(@RequestParam String text){
////		return repo.findByTextOrderByAdded(text);
//		return repo.findByTextContainingOrderByAdded(text); // 模糊搜尋
//	}

}