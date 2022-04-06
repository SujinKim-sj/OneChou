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
	
	
	@PostMapping("update")
	public void update(RoasteryDTO roasteryDTO, Model model) throws Exception {
		roasteryDTO = roasteryService.detail(roasteryDTO);
		
		model.addAttribute("roasteryDTO", roasteryDTO);
	}
	
	@PostMapping("updateResult")
	public ModelAndView updateResult(RoasteryDTO roasteryDTO, RoasteryFileDTO roasteryFileDTO, MultipartFile image) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		roasteryDTO.setRoasteryFileDTO(roasteryFileDTO);
		
		boolean result = roasteryService.update(roasteryDTO, image);
		
		String message = "로스터리 정보 업데이트에 실패했습니다.";
		
		if(result) {
			message = "로스터리 정보 업데이트에 성공했습니다.";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "./detail?num="+roasteryDTO.getNum());
		mv.setViewName("common/result");
		
		return mv;

	}
	@GetMapping("detail")
	public void detail(RoasteryDTO roasteryDTO, Model model) throws Exception {

		roasteryDTO = roasteryService.detail(roasteryDTO);
		
		model.addAttribute("roasteryDTO", roasteryDTO);
	}
	
}
