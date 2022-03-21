package com.onechou.shop.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public int add(CartDTO cartDTO) throws Exception {
		return cartDAO.add(cartDTO);
	}
}
