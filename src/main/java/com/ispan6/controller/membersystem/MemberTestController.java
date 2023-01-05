package com.ispan6.controller.membersystem;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ispan6.Constants;
import com.ispan6.bean.matchsystem.HobbitBean;
import com.ispan6.bean.matchsystem.SelfHobbitBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.matchsystem.SelfHobbitDto;
import com.ispan6.dao.membersystem.UserGoogleDto;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.membersystem.MemberTestService;
import com.ispan6.service.postsystem.PostService;

@Controller
//@SessionAttribute("loginUser")
public class MemberTestController {
	@Autowired
	private MemberTestService mService;

	@Autowired
	public MemberTestController(ServletContext ctx, MemberTestService mService) {
		this.ctx = ctx;
		this.mService = mService;
	}

	@Autowired
	private MatchService matchService;

	@Autowired
	private PostService postService;
	
	ServletContext ctx;
	
	@Autowired
	private SelfHobbitDto hDto;

	@PostMapping("/login2")
	public String login2(@RequestParam String account, @RequestParam String password, Model model) {

		MemberTest mt = mService.findByAccAndPwd(account, password);
		System.out.println(mt.getEmail());
		model.addAttribute("loginUser", mt);

		return "index";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model m) {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		MemberTest mt = mService.findByAccAndPwd(account, password);
		if(mt.getBanned()==1) {
			return "/bannedpage";
		}
		MemberTest random = matchService.random1(mt.getId(), mt.getId());
		m.addAttribute("random", random);
		
		HttpSession session = request.getSession();

		session.setAttribute("loginUser", mt);
		System.out.println("登入者是:"+mt.getAccount());
		if (mt.getAccount().equals("admin")) {
			List<MemberTest> members = mService.getAllMemberTest();
			session.setAttribute("members", members);
			return "memberbackend";
		}else {

		return "redirect:/index";
		}
	}

	@PostMapping("/update")
	public String update1(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m)
			throws IOException, ServletException {
		String account = request.getParameter("account");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email= request.getParameter("email");
		String avator = "";
		Part part = request.getPart("avator");
		String filename = getFileName(part);
		String mimeType = ctx.getMimeType(filename);
//		String prefix="data:"+mimeType+";base64,";
		System.out.println(mimeType);
		if (mimeType != null) {
			StringBuffer responseMsg = new StringBuffer();

			try (InputStream in = part.getInputStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
				byte[] b = new byte[819200];
				int len = 0;
				while ((len = in.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				byte[] bytes = baos.toByteArray();

				String prefix = "data:" + mimeType + ";base64,";
				// 由於java.io.OutputStream類別無法寫出字串，因此將字串轉為位元組陣列寫出
				responseMsg.append(prefix);
				Base64.Encoder be = Base64.getEncoder();
				responseMsg.append(new String(be.encode(bytes)));
				avator = responseMsg.toString();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {
			MemberTest mt = (MemberTest) session.getAttribute("loginUser");
			avator = mt.getAvator();
		}

		mService.updateByAcc(account, avator, name, address, phone, email);
		MemberTest mt = mService.findByAcc(account);
		session.setAttribute("loginUser", mt);
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		m.addAttribute("page", page);
		return "index";
	}

	private String getFileName(Part part) {
		String header = part.getHeader("Content-Disposition");
		int slashIdx = header.lastIndexOf("\\");
		String filename;
//		System.out.println(header);
		if (slashIdx != -1) {

			filename = header.substring(slashIdx + 1, header.length() - 1);
//			System.out.println(filename);
		} else {
			int idx = header.indexOf("filename");

			filename = header.substring(idx + 10, header.length() - 1);
//			System.out.println(filename);
		}
		return filename;
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus status, Model m, @RequestParam(name="p",defaultValue = "1") Integer pageNumber) {
		HttpSession session = request.getSession();
		status.setComplete();
		session.invalidate();
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		m.addAttribute("page", page);
		return "index";
	}

	@GetMapping("/showprofile")
	public String showProfile(HttpSession session) {
		MemberTest mt= (MemberTest) session.getAttribute("loginUser");
		session.setAttribute("member", mt);
		return "userpage";
	}
	
	@GetMapping("/updateprofile")
	public String updateProfile() {
		return "showOneUser";
	}
	
	@GetMapping("/searchuser")
	public String searchUser(HttpSession session) {
		List<MemberTest> members = mService.getAllMemberTest();
		session.setAttribute("members", members);
		return "searchuser";
	}

	@PostMapping("/CheckAcc")
	public @ResponseBody String checkAcc(@RequestParam(value = "account") String account) {
		String accountState = "";

		if (mService.existsByAccount(account) != null) {
			accountState = "帳號重複";
		} else {
			accountState = "此帳號可用";
		}
		return accountState;
	}

	@PostMapping("/googleSignIn")
	public String googleSignIn(@ModelAttribute("memberTest") MemberTest mt, @RequestParam(value = "name") String name,
			@RequestParam(value = "birth") String birth, @RequestParam(value = "phone") String phone,
			@RequestParam(value = "address") String address, @RequestParam(value = "gender") Integer gender, @RequestParam(value = "hobbit") String[] hobbit,
			HttpSession session) throws ParseException {
		mt = (MemberTest) session.getAttribute("member");
		System.out.println(mt.getAccount());
		mt.setPassword("P@ssw0rd");
		mt.setName(name);
		Date date = null;
		date = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		mt.setBirth(date);
		mt.setPhone(phone);
		mt.setAddress(address);
		mt.setGender(gender);
		mService.insertMember(mt);
		mt = mService.findByAcc(mt.getAccount());
		session.setAttribute("loginUser", mt);
		
		for(int i=0;i<hobbit.length;i++) {
			SelfHobbitBean sBean = new SelfHobbitBean();
			sBean.setUserhid(mt);
			HobbitBean hb=new HobbitBean();
			hb.setId(Integer.parseInt(hobbit[i]));
			sBean.setHobbitid(hb);
			hDto.save(sBean);
			}
		
		return "index";
	}

	@PostMapping("/insertMember")
	public String insertMember(@ModelAttribute("memberTest") MemberTest mt,
			@RequestParam(value = "account") String account, @RequestParam(value = "password") String password, @RequestParam(value = "taiwan") String taiwan, @RequestParam(value = "coun") String coun,
			@RequestParam(value = "hobbit") String[] hobbit, HttpServletRequest request, HttpServletResponse response, Model m) {
		String address=taiwan+coun;
		mt.setAddress(address);
		mt.setEmail(account);
		mt.setAvator(Constants.AVATOR);
		mt.setBanned(0);
		mService.insertMember(mt);
		
		mt = mService.findByAccAndPwd(account, password);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", mt);
		
		for(int i=0;i<hobbit.length;i++) {
		SelfHobbitBean sBean = new SelfHobbitBean();
		sBean.setUserhid(mt);
		HobbitBean hb=new HobbitBean();
		hb.setId(Integer.parseInt(hobbit[i]));
		sBean.setHobbitid(hb);
		hDto.save(sBean);
		}
		return "index";
	}

	@GetMapping("/memberBackendSet")
	public String backEndSet(HttpSession session) {
		List<MemberTest> members = mService.getAllMemberTest();
		session.setAttribute("members", members);
		return "memberbackend";
	}

	@PostMapping("/findMem")
	@ResponseBody
	public List<MemberTest> findByGender(HttpSession session, @RequestParam(value = "male") Integer male,
			@RequestParam(value = "female") Integer female, @RequestParam(value = "account") String account,
			@RequestParam(value = "name") String name, 	@RequestParam(value = "address") String address) {
//		List<MemberTest> members2 = mService.findByGender(male, female);
		List<MemberTest> members2 = mService.findMem(male, female, account, name, address);
		System.out.println(members2);
		return members2;
	}

	@RequestMapping("/LoginGoogleHandler")
	public String processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String accessToken = getToken(code);
		UserGoogleDto user = getUserInfo(accessToken);
		HttpSession session = request.getSession();
		if (mService.existsByAccount(user.getEmail()) != null) {
			MemberTest mt = mService.findByAcc(user.getEmail());
			session.setAttribute("loginUser", mt);
			return "/index";
		} else
//		if (mService.existsByAccount(user.getEmail()) == null) 
		{
			MemberTest mt = new MemberTest();
			mt.setAccount(user.getEmail());
			mt.setEmail(user.getEmail());
			mt.setName(user.getName());
			mt.setAvator(user.getPicture());
			session.setAttribute("member", mt);
			return "/signup4";
		}
	}

	public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
		System.out.println(googlePojo);
		return googlePojo;
	}

	@PostMapping("/sendCode") // 寄送驗證信的註冊
	public String sendCode(@ModelAttribute("memberTest") MemberTest mt, @RequestParam(value = "account") String account, @RequestParam(value = "hobbit") String[] hobbit,
			@RequestParam(value = "password") String password, HttpServletRequest request,
			HttpServletResponse response) {
		mt.setEmail(account);
		String avator = "";
		mt.setAvator(avator);
		System.out.println("送信中");
		HttpSession session = request.getSession();
		session.setAttribute("memberTest", mt);
		session.setAttribute("hobbit", hobbit);
		boolean flag = mService.sendCode(session, mt);
		System.out.println(flag);
		if (flag) {
			return "checkUUID";
		} else {
			return "/index";
		}
	}
	
    @GetMapping("/lookCode/{token}")
    public String lookCode(@PathVariable("token")String token, HttpSession session){
    	MemberTest mt = mService.findByAcc(token);
    	session.setAttribute("member", mt);
    	return "userpage";
    }
    
    @PostMapping("/banMem")
    @ResponseBody
    public void banMem(@RequestParam(value = "banned") Integer banned, @RequestParam(value = "account") String account) {
    	System.out.println(banned+","+account);
    	mService.banMem(banned, account);
    }

}
