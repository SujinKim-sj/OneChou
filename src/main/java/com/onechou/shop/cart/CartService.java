package com.onechou.shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public int add(CartDTO cartDTO) throws Exception {
		return cartDAO.add(cartDTO);
	}
	
	public List<CartDTO> list(MemberDTO memberDTO) throws Exception {
		return cartDAO.list(memberDTO);
	}
	
	public boolean delete(List<CartDTO> cartDTOs) throws Exception {
		boolean check = true;
		for(int i=0;i<cartDTOs.size();i++) {
			int result = cartDAO.delete(cartDTOs.get(i));
			if (result < 1) {
				check = false;
			}
		}
		return check;
	}
}
