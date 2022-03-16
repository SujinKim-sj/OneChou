package com.onechou.shop.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//Login - POST, GET방식
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, MemberDTO memberDTO, String remember, Model model, HttpServletResponse response) throws Exception {
		if(remember != null && remember.equals("1")) {
			//Cookie 생성
			Cookie cookie = new Cookie("remember", memberDTO.getId());
			//cookie.setPath("/");
			cookie.setMaxAge(-1);
			//응답
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		//cookie 작성 후 실행
		memberDTO = memberService.login(memberDTO);
			
		String message = "Login Fail";
		String p = "./login";
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			message = "Login Success";
			p = "../";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		String path = "common/result";
		return path;
	}

	@RequestMapping(value = "login", method = RequestMethod.GET) 
	public void login(Model model, @CookieValue(value = "remember", defaultValue = "", required = false) String rememberId) throws Exception {

	}
}
