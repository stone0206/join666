package com.ispan6.controller.reunionsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.reunionsystem.Payment;
import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.bean.reunionsystem.Reunionreport;
import com.ispan6.bean.reunionsystem.Reuniontype;
import com.ispan6.service.reunionsystem.PaymentService;
import com.ispan6.service.reunionsystem.ReunionregisterService;
import com.ispan6.service.reunionsystem.ReunionreportService;
import com.ispan6.service.reunionsystem.ReunionsystemService;
import com.ispan6.service.reunionsystem.ReuniontypeService;




@Controller
public class ReunionsystemController {
	
	@Autowired
	private ReunionsystemService reunionsystemService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private ReuniontypeService reuniontypeService;
	
	@Autowired
	private ReunionregisterService reunionregisterService;
	
	@Autowired
	private ReunionreportService reunionreportService;
	
	

	
	
	@GetMapping("/msg/page")
	public String getReunion(HttpSession session) {
		//先將網頁全部重置
		List<Reunion> reunion = reunionsystemService.findAllReunion();
		List<Reuniontype> reuniontype = reuniontypeService.findAllType();
		List<Payment> payment = paymentService.findAllPayment();
		session.setAttribute("reunion", reunion);
		session.setAttribute("reuniontype", reuniontype);
		session.setAttribute("payment", payment);
		return "reunion";
	}
	
	
	
	
	
	@GetMapping("/searchByPaymentId")
	public String searchByPaymentId(@RequestParam Integer id, Model model) {
		List<Reunion> reunion = reunionsystemService.findByPaymentId(id);
		model.addAttribute("reunion", reunion);
		return "reunion";
	}


	@GetMapping("/searchByReuniontypeId")
	public String searchByReuniontypelId(@RequestParam Integer id, Model model) {
		List<Reunion> reunion = reunionsystemService.findByReuniontypelId(id);
		model.addAttribute("reunion", reunion);
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
	//新增聚會
	@PostMapping("/insertReunion")
	public String insertReunion(Reunion reunion,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		reunion.setMemberid(memberid);
		reunionsystemService.insertReunion(reunion);
		return "redirect:/msg/page";
	}
	
	//新增報名

	@GetMapping("/insertRegister")
	@ResponseBody
	public String insertRegister(@RequestParam Integer id,HttpSession session) {				
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		
		boolean flag = reunionregisterService.registerEmpty(id, memberid);
		if(flag==true) {
		Register register = new Register();
		register.setMemberid(memberid);
		register.setReunionid(id);
		reunionregisterService.insertRegister(register);
		return "報名成功";
		}
		if(flag==false) {
		return"已報名";	
		}
		return "unexpect wrong please contact with engineer";
	}
	//聚會報名審核
	@GetMapping("/searchRegisterByReunionId")
	public String searchRegisterByReunionId(@RequestParam Integer id, Model model) {
		List<Register> register = reunionregisterService.findRegisterByReunionid(id);
		model.addAttribute("register", register);
		System.out.println(register);
		return "reviewreunion";
	}
	
	//同意報名
	    @GetMapping("/agreeRegister")
		public String agreeRegisterByReunionidAndMemberid(@RequestParam Integer reunionid,Integer memberid) {
	    	 Integer count = reunionregisterService.findCountRegisterByReunionid(reunionid);
	    	Reunion reunion = reunionsystemService.findByReunionId(reunionid);
	    	System.out.println(reunion.getPeople());
	    	System.out.println(count);
	    	System.out.println(reunionid);
	    	System.out.println(memberid);
	    	 if(reunion.getPeople()>count) {
			reunionregisterService.agreeRegisterByReunionidAndMemberid(reunionid, memberid);
	    	 }
			return "reunion";
		}
	    
	  //不同意報名
	    @GetMapping("/notagreeRegister")
		public String notagreeRegisterByReunionidAndMemberid(@RequestParam Integer reunionid,Integer memberid) {
		   
			reunionregisterService.notagreeRegisterByReunionidAndMemberid(reunionid, memberid);
			return "reunion";
		}
	
	
//	@GetMapping("/insertRegister")
//		public String insertRegister(@RequestParam Integer id,HttpSession session) {				
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		int memberid = member.getId();
//		
//		boolean flag = reunionregisterService.registerEmpty(id, memberid);
//		
//		Register register = new Register();
//		register.setMemberid(memberid);
//		register.setReunionid(id);
//		reunionregisterService.insertRegister(register);
//	  return "redirect:/detailedreunion";
//	}
	
	
	
	
	
	//新增檢舉
//	@GetMapping("/insertReunionreport")
//	public String insertReunionreport(@RequestParam Integer id,HttpSession session) {
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		int memberid = member.getId();
//		Reunionreport reunionreport = new Reunionreport();
//		reunionreport.setMemberid(memberid);
//		reunionreport.setReunionid(id);
//		reunionreportService.insertReunionreport(reunionreport);
//		return "reunion";
//	}
	//新增檢舉
	@PostMapping("/insertReunionreport")
	public String insertReunionreport(Reunionreport reunionreport ,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		reunionreport.setMemberid(memberid);
		reunionreportService.insertReunionreport(reunionreport);
		return "reunion";
	}
	

//	@PostMapping("/insertRegister")
//	public String insertRegister(Register register) {
//		reunionsystemService.insertReunion(reunion);
//		return "redirect:/msg/page";
//	}
//	

	
	
	@GetMapping("/test")
	public String test(Model model) {
		
		
		return "NewFile";
	}
	
	
	
	@GetMapping("/test2")
	public String test2(Model model) {
		
		
		return "detailedreunion";
	}
	
	@GetMapping("/myreunion")	
	public String myreunion(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member != null) {
			System.out.println(member);
			List<Reunion> reunion=reunionsystemService.findAllByMemberId(member.getId());
			session.setAttribute("reunion", reunion);
			
		}
		
		
		return "myreunion";
	}
	
	@GetMapping("/detailedreunion")
	public String detailedreunion(@RequestParam Integer id, Model model,HttpSession session) {
		
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member!=null) {
		int memberid = member.getId();
		boolean flag1 = reunionreportService.reportEmpty(id, memberid);
		boolean flag = reunionregisterService.registerEmpty(id, memberid);
		model.addAttribute("flag1",flag1);
		model.addAttribute("flag",flag);
		}
		
		Reunion reunion = reunionsystemService.findByReunionId(id);
		Integer registercount = reunionregisterService.findCountRegisterByReunionid(id);
		model.addAttribute("reunion", reunion);
		model.addAttribute("registercount", registercount);
		
		return "detailedreunion";
	}
	
	@ResponseBody
	@GetMapping("/TestM")
	public MemberTest insert2(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		return member;
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