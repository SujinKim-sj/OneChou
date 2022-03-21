package com.onechou.shop.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.cart.CartDAO.";
	
	public int add(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", cartDTO);
	}
	
}
