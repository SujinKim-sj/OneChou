package com.onechou.shop.member;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.favorite.CupnoteDTO;
import com.onechou.shop.favorite.FavoriteDTO;
import com.onechou.shop.favorite.FavoriteService;
import com.onechou.shop.roastery.RoasteryDTO;
import com.onechou.shop.roastery.RoasteryFileDTO;


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
	public void login(Model model, @CookieValue(value = "remember", defaultValue = "") String rememberId) throws Exception {
		model.addAttribute("rememberId", rememberId);
	}
	
	@RequestMapping(value = "logout" , method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join(HttpSession session,Long kind) {
		session.setAttribute("kind", kind);
		return "member/join";
	}
	@RequestMapping(value = "join",method = RequestMethod.POST)
	public String join(MemberDTO memberDTO, Model model,HttpSession session) throws Exception {
		int result = memberService.join(memberDTO);
		String message = "join Fail";
		String p = "./join";
		
		if(result>0) {
			Long kind = memberDTO.getKind();
			session.setAttribute("member", memberDTO);
			message = "join Success";
			if(kind>1) {
				p = "../favorite/add";				
			}else {
				p = "../roastery/add";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		String path = "common/result";
		return path;
	}
	
	@GetMapping("generalMemberJoin")
	public void generalMemberJoin() throws Exception {
		
	}
	
	
	@RequestMapping(value = "joinCheck", method = RequestMethod.GET)
	public String joinCheck() throws Exception{
		return "member/joinCheck";
	}
	
	@RequestMapping(value = "kindSelect", method = RequestMethod.GET)
	public void kindSelect()throws Exception{
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.mypage(memberDTO);
		if(memberDTO.getKind()==2) {
			FavoriteDTO favoriteDTO = memberService.favoriteDetail(memberDTO);
			List<CupnoteDTO> cupnoteDTOs = memberService.noteDetail(favoriteDTO);
			favoriteDTO.setCupnoteDTOs(cupnoteDTOs);
			memberDTO.setFavoriteDTO(favoriteDTO);
		}
		else if (memberDTO.getKind()==1) {
			RoasteryDTO roasteryDTO = memberService.roasteryDetail(memberDTO);
			RoasteryFileDTO roasteryFileDTO = memberService.roasteryFile(roasteryDTO);
			roasteryDTO.setRoasteryFileDTO(roasteryFileDTO);
			memberDTO.setRoasteryDTO(roasteryDTO);
		}
		mv.setViewName("member/mypage");
		mv.addObject("dto", memberDTO);
		return mv;
	} 
	
	@RequestMapping(value = "updateCheck", method = RequestMethod.GET)
	public void updateCheck()throws Exception{
	}
	
	@RequestMapping(value = "updateCheck", method = RequestMethod.POST)
	public String updateCheck(Model model,MemberDTO memberDTO,HttpSession session)throws Exception{
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		String message="Check fail";
		String path="./updateCheck";
		if(mem.getId().equals(memberDTO.getId())&&mem.getPw().equals(memberDTO.getPw())) {
			message="Check Success";
			path="./update";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		return "common/result";
	}
	
	
	@RequestMapping(value = "update",method = RequestMethod.GET)
	public void update(HttpSession session)throws Exception{
		session.getAttribute("member");
	}

	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(Model model,MemberDTO memberDTO)throws Exception{
		int result = memberService.update(memberDTO);
		String message="Update fail";
		String path="redirect:./update";
		if(result>0) {
			message = "Update success";
			path = "../";
		}
		model.addAttribute("path", path);
		model.addAttribute("message", message);
		return "common/result";
	}


















}
	
	
	
	
