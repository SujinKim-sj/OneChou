package com.onechou.shop.payment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.cart.CartDTO;
import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.util.Pager;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	
	public List<CartDTO> getCartList(List<CartDTO> cartDTOs) throws Exception {
		
		List<CartDTO> resultList = new ArrayList<CartDTO>();
		for(int i=0;i<cartDTOs.size();i++) {
			CartDTO cartDTO = cartDTOs.get(i);
			cartDTO = paymentDAO.getCartDetail(cartDTO);
			resultList.add(cartDTO);
		}
		
		return resultList;
	}
	
	public Long add(PaymentDTO paymentDTO) throws Exception {
		boolean check = true;
		// PAYMENT 테이블에 데이터 삽입
		if(paymentDAO.addPayment(paymentDTO) < 1) {
			check = false;
			System.out.println(check);
		};
		
		// DELIVERY 테이블에 데이터 삽입
		DeliveryDTO deliveryDTO = paymentDTO.getDeliveryDTO();
		deliveryDTO.setPaymentNum(paymentDTO.getNum());
		if(paymentDAO.addDelivery(deliveryDTO) < 1) {
			check = false;
			System.out.println(check);
		}
		
		// PAIDPRODUCT 테이블에 데이터 삽입
		List<PaidProductDTO> paidProductDTOs = paymentDTO.getPaidProductDTOs();
		for(int i=0;i<paidProductDTOs.size();i++) {
			PaidProductDTO paidProductDTO = paidProductDTOs.get(i);
			paidProductDTO.setPaymentNum(paymentDTO.getNum());
			if(paymentDAO.addPaidProduct(paidProductDTO) < 1) {
				check = false;
				System.out.println(check);
			}
		}
		
		// 모든 데이터가 정상적으로 삽입되었다면 결제정보 넘버를 보내줌
		if(check) {
			return paymentDTO.getNum();
		} else {
			return 0L; // 0번이면 실패
		}
	}
	
	public int deleteCart(CartDTO cartDTO) throws Exception {
		return paymentDAO.deleteCart(cartDTO);
	}
	
	public int updatePurchaseCount(PaidProductDTO paidProductDTO) throws Exception {
		return paymentDAO.updatePurchaseCount(paidProductDTO);
	}
	
	public List<PaymentDTO> list(MemberDTO memberDTO, Pager pager) throws Exception {
		
		pager.setPerPage(5L);
		pager.makeRow();
		pager.makeNum(paymentDAO.getTotal(memberDTO));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", memberDTO.getId());
		map.put("startRow", pager.getStartRow());
		map.put("lastRow", pager.getLastRow());
		
		return paymentDAO.list(map);
	}
	
	public PaymentDTO detail(PaymentDTO paymentDTO) throws Exception {
		return paymentDAO.detail(paymentDTO);
	}
	
}
