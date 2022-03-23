package com.onechou.shop.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.member.MemberDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.cart.CartDAO.";
	
	public int add(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", cartDTO);
	}
	
	public List<CartDTO> list(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", memberDTO);
	}
	
	public int delete(CartDTO cartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", cartDTO);
	}
	
}
