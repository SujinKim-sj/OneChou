package com.onechou.shop.payment;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.cart.CartDTO;

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
	
}
