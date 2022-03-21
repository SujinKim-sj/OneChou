package com.onechou.shop.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.qna.QnaDTO;
import com.onechou.shop.review.ReviewDTO;
import com.onechou.shop.util.Pager;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.product.ProductDAO.";
	
	public int add(ProductDTO productDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", productDTO);
	}
	
	public int addFeature(ProductFeatureDTO productFeatureDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addFeature", productFeatureDTO);
	}
	
	public int addCupnote(ProductCupnoteDTO productCupnoteDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addCupnote", productCupnoteDTO);
	}
	
	public int addFile(ProductFileDTO productFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addFile", productFileDTO);
	}
	
	public int addOption(ProductOptionDTO productOptionDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addOption", productOptionDTO);
	}
	
	public List<ProductDTO> list(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", pager);
	}
	
	public Long getTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}
	
	public ProductDTO detailBasic(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailBasic", productDTO);
	}
	
	public List<ProductOptionDTO> detailOption(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"detailOption", productDTO);
	}
	
	public List<ReviewDTO> detailReview(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"detailReview", productDTO);
	}
	
	public Double getReviewAvg(ProductDTO productDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getReviewAvg", productDTO);
	}
	
	public List<QnaDTO> detailQna(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"detailQna", productDTO);
	}
	
}
