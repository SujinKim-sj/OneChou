package com.onechou.shop.roastery;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.member.MemberDTO;
@Controller
@RequestMapping(value = "/roastery/**")
public class RoasteryController {
	
	@Autowired
	private RoasteryService roasteryService;
	
	
	@GetMapping("update")
	public ModelAndView update (HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		RoasteryDTO roasteryDTO = roasteryService.detail(memberDTO);
		mv.setViewName("roastery/update");
		mv.addObject("member", memberDTO);
		mv.addObject("roastery", roasteryDTO);
		return mv;
	}
	@PostMapping("update")
	public String update(RoasteryDTO roasteryDTO, MultipartFile file, Model model) throws Exception{
		int result = roasteryService.update(roasteryDTO,file);
		
		String message = "roastery update fail";
		String p = "redirect:./update";
		if(result>0) {
			message = "roastery update Success";
				p = "../member/mypage";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		String path = "common/result";
		return path;

	}
	@GetMapping("detail")
	public void detail(RoasteryDTO roasteryDTO, Model model) throws Exception {
		
		roasteryDTO = roasteryService.detail(roasteryDTO);
		
		model.addAttribute("roasteryDTO", roasteryDTO);
	}
	
}
