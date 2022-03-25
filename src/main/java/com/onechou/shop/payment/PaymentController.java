package com.onechou.shop.payment;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onechou.shop.cart.CartDTO;
import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.util.Pager;

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
	
	@PostMapping
	public ModelAndView addResult(HttpSession session, PaymentDTO paymentDTO, DeliveryDTO deliveryDTO, String[] perPrices, String[] amounts, String[] productNums, String[] optionNums,String[] roasteryNums, String[] nums) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 받은 상품정보 파라미터들 결제상품에 담고 List에 담기
		List<PaidProductDTO> paidProductDTOs = new ArrayList<PaidProductDTO>();
		for(int i=0;i<productNums.length;i++) {
			PaidProductDTO paidProductDTO = new PaidProductDTO();
			paidProductDTO.setPerPrice(Long.parseLong(perPrices[i]));
			paidProductDTO.setAmount(Integer.parseInt(amounts[i]));
			paidProductDTO.setProductNum(Long.parseLong(productNums[i]));
			paidProductDTO.setOptionNum(Long.parseLong(optionNums[i]));
			paidProductDTO.setRoasteryNum(Long.parseLong(roasteryNums[i]));
			paidProductDTOs.add(paidProductDTO);
		}
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		// PaymentDTO에 모두 담아서 보내기
		paymentDTO.setPaidProductDTOs(paidProductDTOs);
		paymentDTO.setDeliveryDTO(deliveryDTO);
		paymentDTO.setMemberId(memberDTO.getId());
		
		// 성공적으로 Insert 시에는 결제정보테이블의 결제번호가 옴, 실패시 0이 옴
		Long result = paymentService.add(paymentDTO);
		
		if(result != 0L) {
			// 성공적으로 결제정보에 Insert 되었다면 장바구니 지우기
			for(int i=0;i<nums.length;i++) {
				CartDTO cartDTO = new CartDTO();
				cartDTO.setNum(Long.parseLong(nums[i]));
				paymentService.deleteCart(cartDTO);
			}
			
			// 상품Table의 구매수컬럼 업데이트 하기
			for(int i=0;i<paidProductDTOs.size();i++) {
				paymentService.updatePurchaseCount(paidProductDTOs.get(i));
			}
			
			// 결제번호, 날짜 paymentDTO에 담아서 보내기
			paymentDTO.setNum(result);
			
			Date date = new Date(System.currentTimeMillis());
			paymentDTO.setOrderDate(date);
			
			mv.addObject("paymentDTO", paymentDTO);
			mv.setViewName("payment/addResult");
			
			// 나중에 결제정보 디테일 페이지 완성 후 메서드 재사용!
				
		} else {
			mv.addObject("message", "결제에 실패했습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		
		
		return mv;		
	}
	
	@GetMapping
	public void list(HttpSession session, Model model, Pager pager) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		List<PaymentDTO> paymentDTOs = paymentService.list(memberDTO, pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("paymentDTOs", paymentDTOs);
		
	}
	
	
}
