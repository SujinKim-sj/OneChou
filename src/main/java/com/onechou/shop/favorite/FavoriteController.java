package com.onechou.shop.favorite;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.member.MemberDTO;


@Controller
@RequestMapping(value = "/favorite/**")
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(value ="add",method = RequestMethod.GET)
	public ModelAndView add(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		mv.addObject("member", memberDTO);
		return mv;
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST )
	public String add(FavoriteDTO favoriteDTO, HttpServletRequest request ,Model model) throws Exception{
		String noteName = request.getParameter("noteName");
		int result = favoriteService.add(favoriteDTO,noteName);
		
		if(result>0) {
			System.out.println("성공");
		}else
		{
			System.out.println("실패");
		}
		
		String message = "favorite Fail";
		String p = "./add";
		if(result>0) {
			message = "favorite Success";
				p = "../";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		String path = "common/result";
		return path;
	}
	
	
	
	
}
