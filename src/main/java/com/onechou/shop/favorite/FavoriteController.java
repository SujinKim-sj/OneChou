package com.onechou.shop.favorite;


import java.util.List;

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
	
	@RequestMapping(value ="update",method = RequestMethod.GET)
	public ModelAndView update(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		mv.addObject("member", memberDTO);
		return mv;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST )
	public String update(FavoriteDTO favoriteDTO , String [] noteNames ,Model model) throws Exception{
		int result = favoriteService.update(favoriteDTO);
		FavoriteDTO favoriteDTO2 = favoriteService.detail(favoriteDTO);
		List<CupnoteDTO> ar = favoriteService.noteList(favoriteDTO2);
		for(int i=0;i<ar.size();i++) {
			CupnoteDTO cupnoteDTO = new CupnoteDTO();
			cupnoteDTO.setFavoriteNum(favoriteDTO2.getNum());
			cupnoteDTO.setNoteName(noteNames[i]);
			cupnoteDTO.setNum(ar.get(i).getNum());
			result = favoriteService.noteUpdate(cupnoteDTO);
		}
		
		String message = "수정에 실패했습니다";
		String path = "./update";
		
		if(result > 0) {
			message = "수정에 성공했습니다";
			path = "../member/mypage";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		
		return "common/result";
	}

}
	

