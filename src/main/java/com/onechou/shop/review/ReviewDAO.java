package com.onechou.shop.review;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.product.ProductDTO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.review.ReviewDAO.";
	
	public Long verifyDuplicated(HashMap<String, Object> hashMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"verifyDuplicated", hashMap);
	}
	
	public ProductDTO searchProduct(ProductDTO productDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"searchProduct", productDTO);
	}
}
