package com.onechou.shop.payment;

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
	
	@PostMapping("addResult")
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
			
			// 결제완료 페이지로 보내기 (detail페이지의 connectionPath = 1로)

			mv.setViewName("redirect:./detail?num="+result+"&connectionPath=1");

				
		} else {
			mv.addObject("message", "결제에 실패했습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		
		
		return mv;		
	}
	
	@GetMapping("list")
	public void list(HttpSession session, Model model, Pager pager) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		List<PaymentDTO> paymentDTOs = paymentService.list(memberDTO, pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("paymentDTOs", paymentDTOs);
		
	}
	
	@GetMapping("detail")
	public void detail(PaymentDTO paymentDTO, Model model, String connectionPath) throws Exception {
		paymentDTO = paymentService.detail(paymentDTO);
		
		model.addAttribute("connectionPath", connectionPath);
		model.addAttribute("paymentDTO", paymentDTO);
		
	}
	
	@GetMapping("shipmentList")
	public void shipmentList(HttpSession session, Pager pager, Model model, String shipmentStatus) throws Exception {
		
		if(shipmentStatus == null) {
			shipmentStatus = "0";
		}
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		List<PaymentDTO> paymentDTOs = paymentService.getShipmentProductList(memberDTO, pager, shipmentStatus);
		
		model.addAttribute("shipmentStatus", shipmentStatus);
		model.addAttribute("pager", pager);
		model.addAttribute("paymentDTOs", paymentDTOs);
	}
	
	@PostMapping("shipmentAdd")
	public void shipmentAdd(PaidProductDTO paidProductDTO, Model model) throws Exception {
		
		// 결제상품 정보 불러오기
		PaymentDTO paymentDTO = paymentService.getShipmentProductDetail(paidProductDTO);
		
		model.addAttribute("paymentDTO", paymentDTO);
	}
	
	@PostMapping("shipmentAddResult")
	public ModelAndView shipmentAddResult(PaidProductDTO paidProductDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = paymentService.shipmentUpdate(paidProductDTO);
		
		String message = "배송 정보 등록에 성공했습니다.";
		if(result == 0) {
			message = "배송 정보 등록에 실패했습니다.\n다시 시도해주세요";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "./shipmentList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
}
