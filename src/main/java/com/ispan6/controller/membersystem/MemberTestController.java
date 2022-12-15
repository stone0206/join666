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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.ispan6.bean.membersystem.MemberTest;
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

		MemberTest random = matchService.random1(mt.getId());
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
		List<MemberTest> rand3 = matchService.random3Members();
		m.addAttribute("rand3", rand3);

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
}
