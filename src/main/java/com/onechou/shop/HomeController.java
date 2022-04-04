package com.onechou.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.favorite.FavoriteDTO;
import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;
import com.onechou.shop.product.ProductService;
import com.onechou.shop.util.Pager;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Pager pager = new Pager();
		pager.setPerPage(3L);
		
		// 추천상품 리스트 조회해오기
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		if(memberDTO != null) {
			if(memberDTO.getKind() == 2) {
				FavoriteDTO favoriteDTO = productService.getMemberFavorite(memberDTO);
				
				List<ProductDTO> productDTOs = productService.recommendedList(favoriteDTO, pager);

				if(productDTOs.size() == 0) {
					// 상품 최신순으로 조회해오기
					List<ProductDTO> newestProductDTOs = productService.list(pager);
					mv.addObject("newestProductDTOs", newestProductDTOs);
				} else {
					mv.addObject("recommendedProductDTOs", productDTOs);					
				}
				
			} else {
				// 상품 최신순으로 조회해오기
				List<ProductDTO> productDTOs = productService.list(pager);
				mv.addObject("newestProductDTOs", productDTOs);
			}
			
		} else {
			// 상품 최신순으로 조회해오기
			List<ProductDTO> productDTOs = productService.list(pager);
			mv.addObject("newestProductDTOs", productDTOs);			
		}
		

		mv.setViewName("index");
		
		return mv;
	}
	
}
