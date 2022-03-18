package com.onechou.shop.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<ProductDTO> list() throws Exception {
		return sqlSession.selectList(NAMESPACE+"list");
	}
	
}
