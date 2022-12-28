package com.ispan6.controller.membersystem;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ispan6.Constants;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.membersystem.UserGoogleDto;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.membersystem.MemberTestService;

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

	ServletContext ctx;

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

		MemberTest random = matchService.random1(mt.getId(),mt.getId());
		m.addAttribute("random", random);

		HttpSession session = request.getSession();

		session.setAttribute("loginUser", mt);

		return "index";

	}

	@PostMapping("/update")
	public String update1(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String account = request.getParameter("account");
		String name = request.getParameter("name");
		String address = request.getParameter("address");

		Part part = request.getPart("avator");
//		InputStream in = part.getInputStream();
		String filename = getFileName(part);
		String mimeType = ctx.getMimeType(filename);
//		String prefix="data:"+mimeType+";base64,";
		System.out.println("avator:" + filename);
		System.out.println("avator:" + mimeType);

		StringBuffer responseMsg = new StringBuffer();

		try (InputStream in = part.getInputStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = in.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			byte[] bytes = baos.toByteArray();

			System.out.println(b);

			String prefix = "data:" + mimeType + ";base64,";
			// 由於java.io.OutputStream類別無法寫出字串，因此將字串轉為位元組陣列寫出
			responseMsg.append(prefix);
			Base64.Encoder be = Base64.getEncoder();
			responseMsg.append(new String(be.encode(bytes)));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println(responseMsg.toString());
		String avator = responseMsg.toString();

		mService.updateByAcc(account, avator, name, address);
		MemberTest mt = mService.findByAcc(account);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", mt);
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
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus status, Model m) {
		HttpSession session = request.getSession();
		status.setComplete();
		session.invalidate();
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);

		return "index";
	}

	@GetMapping("/showprofile")
	public String showProfile() {
		return "showOneUser";
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

	@PostMapping("/insertMember")
	public String insertMember(@ModelAttribute("memberTest") MemberTest mt,
			@RequestParam(value = "account") String account, @RequestParam(value = "password") String password,
			HttpServletRequest request, HttpServletResponse response, Model m) {
		mt.setEmail(account);
		String avator = "data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABQAAD/4QMraHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA3LjEtYzAwMCA3OS5kYWJhY2JiLCAyMDIxLzA0LzE0LTAwOjM5OjQ0ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpCQUVGQ0RGNDQ4MkQxMUVDQTE5NUQyMjIwMEE1QzNFQSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCQUVGQ0RGMzQ4MkQxMUVDQTE5NUQyMjIwMEE1QzNFQSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjAyMSBXaW5kb3dzIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RUE0MkZDRTBDOEREMTFFQkEzRTc5MTZEREJCMzgyNjYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RUE0MkZDRTFDOEREMTFFQkEzRTc5MTZEREJCMzgyNjYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAACAgICAgICAgICAwICAgMEAwICAwQFBAQEBAQFBgUFBQUFBQYGBwcIBwcGCQkKCgkJDAwMDAwMDAwMDAwMDAwMAQMDAwUEBQkGBgkNCwkLDQ8ODg4ODw8MDAwMDA8PDAwMDAwMDwwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCADIAMgDAREAAhEBAxEB/8QAhgABAAIDAQEBAQAAAAAAAAAAAAcIBQYJAwECBAEBAQEBAQAAAAAAAAAAAAAAAAECAwQQAAIBAwICBQgIAwkAAAAAAAABAgMEBREGIQcxQVESE2FxQpPTVhcIgZEiMlJiMxRyohWhsSNTY6M0tBgRAQEBAQEBAAAAAAAAAAAAAAABEhECMf/aAAwDAQACEQMRAD8A7GHsZAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAefjUlPwnVgqn+X3l3vq6QPQAAAAAAAAAAAAAAAAAAAAAAAAAa7urdOJ2dhLvO5ms6drbLu06UdHUrVZfcpU4vTWUv7Ol8ExbwUO3pzj3jvC4rQjf1cJh22qOJsqkqa7v8Aq1I6SqPt1+z2RRzt6qKnKTk5uTcm9XJvjr26kElbO5s7y2dXo/t8nVyeMi0q2HvZyq0XDrUHJuVN9ji/On0FlF8dlbzxG+cHRzWJm4pvw72zm14lvWSTlTnp59U+tcTcvUbaUAAAAAAAAAAAAAAAAAAAAAAKPfMduavkd22+24VGrHb9vCdSinwdzcxVSUn26U3BLs49pj1VV2MgAAnL5f8Ac1fC76t8TKo1j9yU5WtxSb+z41OMqlGenbqnFfxMvmi/B0QAAAAAAAAAAAAAAAAAAAAAA5388bWrbcztyOqn3bl21ajJ+lCVtSXDzNNfQc/X1USkAABIfKe1q3fMfaFKim5wyEK0tPwUE6s/5Yss+jpOdEAAAAAAAAAAAAAAAAAAAAAAK2fMHy+uc7YW27sRQde/wtF0cpbwWs6lom5qcUul0m22vwtv0TPqClBhQABcD5eOX1zZKtvnLUHRld0XQwFCotJeFPTxLjR9Ckl3Y9q1fQ0zfmItUaAAAAAAAAAAAAAAAAAAAAAAABBG9OQW1dz3FbI4mtPbOSrtyrft6aqWtST4uUqDce63+WSXkbM3yIll8se5fF0juPGOhr+o4VlPT+DutfzEyqT9nfLztjAV6N/nrqe5ryi1Knb1KapWkZLim6WsnPT80tH1xLPKLAxiopRilGMVpGK4JJdSND6AAAAAAAAAAAAAAAAAAAAAB/BkspjcNaVL/LX9DHWVH9S6uKkacF2LWTXF9SAgrP8AzHbMxs50cNaXm4asNUq0Iq2t21+eou//ALZnQjS9+Z3cdSTeO21jbWPoq5qVrhrzuDo/3E0rEf8ApXfve1/p2D0/D+3uNP8As6jVGUs/mc3NCS/qG3MXcx9JW8q1BvzOc62n1DQkfA/MltHIThSzmNvcBUn96utLuhHzygo1Pqpl0id8RmsRn7OGQwuRt8nZz4K4t5qaT/DLTjFrrT4mhlAAAAAAAAAAAAAAAAAAAAj7mLzCxfL3DfvruP7rI3fep4nFqWkq1RLi5Pj3YR1Xef0dLRLeDn/uveW4d6ZCWRz1/O5km/21pHWNChF+jSp66RXl6X1tnO3qtWAAAAADYNt7pzu0sjTyeByFSxuYteJGL1p1Yr0KsH9mcfI15uIlF++WPMvH8w8XOahGyztgorK4xPVLXgqtJvi4Sf0xfB9TfSXqJPKAAAAAAAAAAAAAAAAA2km29EuLbA5p8y94V967uyeWdVysKVR22Hpa8IWtJtQaXU58Zvys529VoJAAAAAAABtmyN1XezNzYvP2spd21qqN9Qi/1rab0q02ujjHo16Ho+oS8HTmhXpXNCjc0JqrQuIRq0ai6JQmtYtedM6o9QAAAAAAAAAAAAAAAGLzdG5ucLl7ez/5lxZXFO10en+JOnJQ4+doDlZUp1KNSpRrU5UqtKThVpTTjKMovRpp8U0zkr8AAAAAAAAfUm2klq3wSQHUHZNreWOztq2eQhKne2uJs6V1Sn96E4UYJxl5VpozpEbQUAAAAAAAAAAAAAAAAGk5rlvsbcV3O/zG2rO6vaj1q3UVKlUm+2cqUoOT8rJwYb4McsfdOh6649qMwPgxyx906Hrrj2ozA+DHLH3ToeuuPajMD4McsfdOh6649qMwPgxyx906Hrrj2ozA+DHLH3ToeuuPajMD4McsfdOh6649qMwZTE8sdg4O7p3+M2vZ0Lyi1KjcTUq0oSXRKHiyn3Wu1cRyDeygAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/9k=";
		mt.setAvator(avator);
		mService.insertMember(mt);
		mt = mService.findByAccAndPwd(account, password);

		HttpSession session = request.getSession();

		session.setAttribute("loginUser", mt);

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
			@RequestParam(value = "name") String name) {
//		List<MemberTest> members2 = mService.findByGender(male, female);
		List<MemberTest> members2 = mService.findMem(male, female, account, name);
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
			mt.setName(user.getName());
			mt.setAvator(user.getPicture());
//		session.setAttribute("loginUser", mt);
			return "/signup3";
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
	
	@PostMapping("/sendCode")
    public String sendCode(@ModelAttribute("memberTest") MemberTest mt,
			@RequestParam(value = "account") String account, @RequestParam(value = "password") String password, HttpServletRequest request, HttpServletResponse response){
		mt.setEmail(account);
		String avator = "";
		mt.setAvator(avator);
		System.out.println("送信中");
		HttpSession session= request.getSession();
		session.setAttribute("memberTest", mt);
		boolean flag = mService.sendCode(session, mt);
		System.out.println(flag);
//        Map<String,String> map = new HashMap<>();
        if (flag){
//            map.put("msg","邮件发送成功，请前往您的邮箱进行注册验证");
            return "checkUUID";
        }else {
//            map.put("msg","邮件发送失败");
            return "/index";
        }
    }

}
