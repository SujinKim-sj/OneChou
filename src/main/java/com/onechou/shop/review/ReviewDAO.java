package com.onechou.shop.review;

import java.util.HashMap;
import java.util.List;

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
	
	public int add(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", reviewDTO);
	}
	
	public List<ReviewDTO> list(HashMap<String, Object> hashMap) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", hashMap);
	}

	public Long getTotal(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotal", reviewDTO);
	}
	
	public int delete(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", reviewDTO);
	}
	
	public int update(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", reviewDTO);
	}
}
