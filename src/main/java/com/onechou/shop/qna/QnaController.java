package com.onechou.shop.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public void reply(QnaDTO qnaDTO, Model model) throws Exception {
		qnaDTO = qnaService.detail(qnaDTO);
		
		model.addAttribute("qnaDTO", qnaDTO);
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public ModelAndView reply(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.reply(qnaDTO);
		
		String message = "답변 등록에 성공했습니다.";
		String path = "../product/detail?num="+qnaDTO.getProductNum();
		
		if(result<1) {
			message = "질문 등록에 실패했습니다.";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/result");
		
		return mv;
	}
}
