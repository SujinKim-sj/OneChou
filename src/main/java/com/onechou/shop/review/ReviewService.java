package com.onechou.shop.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;

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
	
	public List<ReviewDTO> list(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.list(reviewDTO);
	}

}
