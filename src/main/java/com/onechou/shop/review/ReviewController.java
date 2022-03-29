package com.onechou.shop.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;

@Controller
@RequestMapping(value = "/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("add")
	public ModelAndView add(HttpSession session, ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		// 중복 검사하기
		Long result = reviewService.verifyDuplicated(productDTO, memberDTO);
		
		if(result != null) { // 중복 있음
			mv.addObject("message", "이미 작성한 리뷰가 있습니다.");
			mv.addObject("path", "../payment/list");
			mv.setViewName("common/result");
			return mv;
		}
		
		// 리뷰를 작성하려는 상품정보 불러오기
		productDTO = reviewService.searchProduct(productDTO);
		
		// 상품이 판매중지되었는지 확인
		if(productDTO.getSale() == 0) {
			mv.addObject("message", "판매가 중지되었거나 수정된 상품입니다.");
			mv.addObject("path", "../payment/list");
			mv.setViewName("common/result");
			return mv;
		}
		
		mv.addObject("productDTO", productDTO);
		mv.setViewName("review/add");
		
		return mv;
	}
	
	@PostMapping("addResult")
	public ModelAndView addResult(ReviewDTO reviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.add(reviewDTO);
		
		String message = "리뷰 등록에 성공했습니다.";
		
		if(result < 1) {
			message = "리뷰 등록에 실패했습니다.";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "../payment/list");
		mv.setViewName("common/result");
		
		return mv;
	}
}
