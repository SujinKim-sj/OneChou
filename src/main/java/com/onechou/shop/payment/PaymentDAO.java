package com.onechou.shop.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.cart.CartDTO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.payment.PaymentDAO.";
	
	public CartDTO getCartDetail(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCartDetail", cartDTO);
	}
}
