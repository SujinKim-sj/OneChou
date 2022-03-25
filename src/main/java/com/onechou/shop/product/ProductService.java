package com.onechou.shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.qna.QnaDTO;
import com.onechou.shop.review.ReviewDTO;
import com.onechou.shop.roastery.RoasteryDTO;
import com.onechou.shop.util.FileManager;
import com.onechou.shop.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public RoasteryDTO searchRoastery(MemberDTO memberDTO) throws Exception {
		return productDAO.searchRoastery(memberDTO);
	}
	
	public boolean add(ProductDTO productDTO, MultipartFile file) throws Exception {
		boolean check = true;
		
		// PRODUCT 테이블에 데이터 삽입
		int result = productDAO.add(productDTO);
		System.out.println(result);
		
		// PRODUCTFEATURE 테이블에 데이터 삽입
		ProductFeatureDTO productFeatureDTO = productDTO.getProductFeatureDTO();
		productFeatureDTO.setProductNum(productDTO.getNum());
		int result2 = productDAO.addFeature(productFeatureDTO);
		System.out.println(result2);
		
		// PRODUCTCUPNOTE 테이블에 데이터 삽입
		List<ProductCupnoteDTO> productCupnoteDTOs = productFeatureDTO.getProductCupnoteDTOs();
		for(int i=0;i<productCupnoteDTOs.size();i++) {
			ProductCupnoteDTO productCupnoteDTO = productCupnoteDTOs.get(i);
			productCupnoteDTO.setFeatureNum(productFeatureDTO.getNum());
			int result3 = productDAO.addCupnote(productCupnoteDTO);
			System.out.println(result3);
			if (result3 < 1) {
				check = false;
			}
		}
		
		// PRODUCTFILE 테이블에 데이터 삽입
		String fileName = fileManager.save(file, "resources/upload/product/");
		ProductFileDTO productFileDTO = new ProductFileDTO();
		productFileDTO.setFileName(fileName);
		productFileDTO.setOriName(file.getOriginalFilename());
		productFileDTO.setProductNum(productDTO.getNum());
		int result4 = productDAO.addFile(productFileDTO);
		System.out.println(result4);
		
		// PRODUCTOPTION 테이블에 데이터 삽입
		List<ProductOptionDTO> productOptionDTOs = productDTO.getProductOptionDTOs();
		for(int i=0;i<productOptionDTOs.size();i++) {
			ProductOptionDTO productOptionDTO = productOptionDTOs.get(i);
			productOptionDTO.setProductNum(productDTO.getNum());
			int result5 = productDAO.addOption(productOptionDTO);
			System.out.println(result5);
			if (result5 < 1) {
				check = false;
			}
		}
		
		
		if(result < 1 && result2 < 1 && result4 < 1) {
			check = false;
		}
		
		return check;
	}
	
	public List<ProductDTO> list(Pager pager) throws Exception {
		
		pager.makeRow();
		Long totalCount = productDAO.getTotal(pager);
		pager.makeNum(totalCount);
		
		return productDAO.list(pager);
	}
	
	public ProductDTO detailBasic(ProductDTO productDTO) throws Exception {
		return productDAO.detailBasic(productDTO);
	}
	
	public List<ProductOptionDTO> detailOption(ProductDTO productDTO) throws Exception {
		return productDAO.detailOption(productDTO);
	}
	
	public List<ReviewDTO> detailReview(ProductDTO productDTO) throws Exception {
		return productDAO.detailReview(productDTO);
	}
	
	public Double getReviewAvg(ProductDTO productDTO) throws Exception {
		return productDAO.getReviewAvg(productDTO);
	}
	
	public List<QnaDTO> detailQna(ProductDTO productDTO) throws Exception {
		return productDAO.detailQna(productDTO);
	}
	
	public List<ProductDTO> myList(MemberDTO memberDTO) throws Exception {
		return productDAO.myList(memberDTO);
	}
}
