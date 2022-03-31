package com.onechou.shop.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;
import com.onechou.shop.util.Pager;

@Controller
@RequestMapping(value = "/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public ModelAndView add(QnaDTO qnaDTO, Model model) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.add(qnaDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
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
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.delete(qnaDTO);
		
		mv.addObject("result", result);
		
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("list")
	public void list(HttpSession session, ProductDTO productDTO, Model model, Pager pager) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		Long duplicateCheck = 1L;
		
		if(memberDTO != null) {
			duplicateCheck = qnaService.verifyDuplicated(productDTO, memberDTO);
			if(duplicateCheck == null) {
				duplicateCheck = 0L;
			}			
		}
		
		// memberDTO가 null인 경우에는 1(로그인 여부)
		// memberDTO가 null이 아니고, 중복되지 않은 경우에는 0
		// memberDTO가 null이 아니고, 중복된 경우에는 0보다 큰 수가 리턴됨 (리뷰번호)
		// 즉, duplicateCheck가 0인 경우에만 질문을 입력할 수 있는 입력 폼이 나와야 함
		
		
		List<QnaDTO> qnaDTOs = qnaService.list(productDTO, pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("qnaDTOs", qnaDTOs);
		model.addAttribute("check", duplicateCheck);
	}
	
	@PostMapping("update")
	public ModelAndView update(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.update(qnaDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("replyList")
	public ModelAndView replyList(QnaDTO qnaDTO, ModelAndView mv) throws Exception {
		
		List<QnaDTO> qnaDTOs = qnaService.replyList(qnaDTO);
		int replyCount = qnaDTOs.size();
			
		if(replyCount == 0) {
			mv.addObject("result", replyCount);
			mv.setViewName("common/ajaxResult");
			return mv;
		}
		
		mv.addObject("replyCount", replyCount);
		mv.addObject("qnaDTOs", qnaDTOs);
		mv.setViewName("qna/replyList");
		return mv;
	}
}
