package com.onechou.shop.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;
import com.onechou.shop.util.Pager;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public Long verifyDuplicated(ProductDTO productDTO, MemberDTO memberDTO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("id", memberDTO.getId());
		hashMap.put("num", productDTO.getNum());
		
		return reviewDAO.verifyDuplicated(hashMap);
	}
	
	public ProductDTO searchProduct(ProductDTO productDTO) throws Exception {
		return reviewDAO.searchProduct(productDTO);
	}
	
	public int add(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.add(reviewDTO);
	}
	
	public List<ReviewDTO> list(ReviewDTO reviewDTO, Pager pager) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		pager.setPerPage(10L);
		pager.makeRow();
		pager.makeNum(reviewDAO.getTotal(reviewDTO));
		
		hashMap.put("productNum", reviewDTO.getProductNum());
		hashMap.put("startRow", pager.getStartRow());
		hashMap.put("lastRow", pager.getLastRow());
		
		return reviewDAO.list(hashMap);
	}
	
	public int delete(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.delete(reviewDTO);
	}
	
	public int update(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.update(reviewDTO);
	}

}
