package com.onechou.shop.member;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView join(Integer kind) {
		ModelAndView mv = new ModelAndView();
		
		if(kind == 2) {
			mv.setViewName("member/generalMemberJoin");
		} else {
			mv.setViewName("member/roasteryMemberJoin");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "join",method = RequestMethod.POST)
	public ModelAndView join(MemberDTO memberDTO, RoasteryDTO roasteryDTO, String roasteryName, String roasteryAddress, MultipartFile image, FavoriteDTO favoriteDTO, String[] noteNames) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 회원 유형 판단 후 파라미터 MemberDTO로 합치기
		System.out.println(memberDTO.getKind());
		if(memberDTO.getKind() == 1) {
			// 멤버테이블과 컬럼명이 같아서 파라미터명을 다르게 보냄
			roasteryDTO.setName(roasteryName);
			roasteryDTO.setAddress(roasteryAddress);
			memberDTO.setRoasteryDTO(roasteryDTO);
		} else {
			// 받은 컵노트 합쳐주기
			List<CupnoteDTO> cupnoteDTOs = new ArrayList<CupnoteDTO>();
			for(int i=0;i<noteNames.length;i++) {
				CupnoteDTO cupnoteDTO = new CupnoteDTO();
				cupnoteDTO.setNoteName(noteNames[i]);
				cupnoteDTOs.add(cupnoteDTO);
			}
			
			favoriteDTO.setCupnoteDTOs(cupnoteDTOs);
			memberDTO.setFavoriteDTO(favoriteDTO);			
		}
		
		// 데이터 삽입하기
		boolean result = memberService.join(memberDTO, image);
		
		String message = "회원가입에 성공했습니다";
		
		if(!result) {
			message = "회원가입에 실패했습니다. \n다시 시도해주세요.";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("idDuplicateCheck")
	public ModelAndView idDuplicateCheck(MemberDTO memberDTO) throws Exception {
		System.out.println(memberDTO.getId());
		ModelAndView mv = new ModelAndView();
		
		Long result = memberService.idDuplicateCheck(memberDTO);
		
		System.out.println(result);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("nicknameDuplicateCheck")
	public ModelAndView nicknameDuplicateCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Long result = memberService.nicknameDuplicateCheck(memberDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("emailDuplicateCheck")
	public ModelAndView emailDuplicateCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Long result = memberService.emailDuplicateCheck(memberDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("phoneDuplicateCheck")
	public ModelAndView phoneDuplicateCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Long result = memberService.phoneDuplicateCheck(memberDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("roasteryNameDuplicateCheck")
	public ModelAndView roasteryNameDuplicateCheck(RoasteryDTO roasteryDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Long result = memberService.roasteryNameDuplicateCheck(roasteryDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
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
		memberDTO = memberService.updateCheck(memberDTO);
		String message="Check fail";
		String path="./updateCheck";
		if(mem.getId().equals(memberDTO.getId())) {
			message="Check Success";
			path="./update";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		return "common/result";
	}
	
	
	@RequestMapping(value = "update",method = RequestMethod.GET)
	public void update(MemberDTO memberDTO)throws Exception{
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
	
	
	
	
