package com.onechou.shop.payment;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onechou.shop.cart.CartDTO;

@Controller
@RequestMapping(value = "/payment/**")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("add")
	public void add(String[] nums, Model model) throws Exception {
		
		List<CartDTO> cartDTOs = new ArrayList<CartDTO>();
		for(int i=0;i<nums.length;i++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setNum(Long.parseLong(nums[i]));
			cartDTOs.add(cartDTO);
		}
		
		cartDTOs = paymentService.getCartList(cartDTOs);
		
		model.addAttribute("cartDTOs", cartDTOs);
	}
	
	
}
