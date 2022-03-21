package com.onechou.shop.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("add")
	public String add(CartDTO cartDTO, Model model) throws Exception {
		int result = cartService.add(cartDTO);
		
		String message = "장바구니에 추가됐습니다.";
		String path = "../product/detail?num="+cartDTO.getProductNum();
		if(result < 1) {
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		
		return "common/result";
	}
}
