package com.onechou.shop.roastery;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/roastery/**")
public class RoasteryController {
	
	@Autowired
	private RoasteryService roasteryService;
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void add(HttpSession session) throws Exception{
		session.getAttribute("member");
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(RoasteryDTO roasteryDTO,Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = roasteryService.add(roasteryDTO);
		String message = "roastery fail";
		String p = "redirect:./add";
		if(result>0) {
			message = "roastery Success";
				p = "../";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		String path = "common/result";
		return path;
	}
	
}
