package com.onechou.shop.policy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/policy/**")
public class PolicyController {
	
	@GetMapping("service")
	public void service() throws Exception {
		
	}

}
