package com.onechou.shop.favorite;


import java.util.ArrayList;
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
	public void update() throws Exception{
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(FavoriteDTO favoriteDTO , String [] noteNames ,Model model) throws Exception{

		List<CupnoteDTO> cupnoteDTOs = new ArrayList<CupnoteDTO>();
		for(int i=0;i<noteNames.length;i++) {
			CupnoteDTO cupnoteDTO = new CupnoteDTO();
			cupnoteDTO.setNoteName(noteNames[i]);
			cupnoteDTOs.add(cupnoteDTO);
		}
		favoriteDTO.setCupnoteDTOs(cupnoteDTOs);
		
		boolean result = favoriteService.update(favoriteDTO);
		
		String message = "수정에 실패했습니다\\n다시시도해주세요";
		
		if(result) {
			message = "수정에 성공했습니다";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../member/mypage");
		
		return "common/result";
	}

}
	

