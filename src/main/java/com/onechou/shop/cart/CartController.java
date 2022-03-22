package com.onechou.shop.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.member.MemberDTO;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("add")
	public ModelAndView add(CartDTO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.add(cartDTO);
		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");

		return mv;
	}
	
	@GetMapping("list")
	public void list(HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<CartDTO> cartDTOs = cartService.list(memberDTO);
		
		model.addAttribute("cartDTOs", cartDTOs);
	}
}
