package com.onechou.shop.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(QnaDTO qnaDTO, Model model) throws Exception {
		int result = qnaService.add(qnaDTO);
		
		String message = "질문 등록에 성공했습니다.";
		String path = "../product/detail?num="+qnaDTO.getProductNum();
		
		if(result<1) {
			message = "질문 등록에 실패했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		
		return "common/result";
	}
}
