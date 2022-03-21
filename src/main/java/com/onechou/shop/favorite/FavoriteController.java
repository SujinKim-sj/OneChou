package com.onechou.shop.favorite;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/favorite/**")
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(value ="add",method = RequestMethod.GET)
	public void add(HttpSession session) throws Exception{
		session.getAttribute("member");
	}
	@RequestMapping(value = "add", method = RequestMethod.POST )
	public String add(FavoriteDTO favoriteDTO,CupnoteDTO cupnoteDTO, Model model) throws Exception{
		int result = favoriteService.add(favoriteDTO);
		result = favoriteService.noteAdd(cupnoteDTO);
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
