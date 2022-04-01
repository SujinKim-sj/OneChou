package com.onechou.shop.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.favorite.FavoriteDTO;
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
	
	public List<ProductDTO> myList(MemberDTO memberDTO, Pager pager) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		pager.setPerPage(5L);
		pager.makeRow();
		
		hashMap.put("id", memberDTO.getId());
		hashMap.put("search", pager.getSearch());
		hashMap.put("startRow", pager.getStartRow());
		hashMap.put("lastRow", pager.getLastRow());
		hashMap.put("sorting", pager.getSorting());
		
		pager.makeNum(productDAO.getMyListTotal(hashMap));
		
		return productDAO.myList(hashMap);
	}
	
	public int delete(ProductDTO productDTO) throws Exception {
		return productDAO.delete(productDTO);
	}
	
	public ProductDTO updateSearch(ProductDTO productDTO) throws Exception {
		return productDAO.updateSearch(productDTO);
	}
	
	public boolean updateResult(ProductDTO productDTO, MultipartFile file) throws Exception {
		boolean check = true;
		
		// 기존 상품 삭제 처리 (판매여부 = 0으로 수정)
		if(productDAO.delete(productDTO) < 1) {
			check = false;
			return check;
		}
		
		// 상품 테이블에 데이터 삽입
		if(productDAO.updateAdd(productDTO) < 1) {
			check = false;
		}
		
		// 상품 특성 테이블에 데이터 삽입 (add시 사용했던 쿼리문, 메서드 재사용)
		ProductFeatureDTO productFeatureDTO = productDTO.getProductFeatureDTO();
		productFeatureDTO.setProductNum(productDTO.getNum());
		if(productDAO.addFeature(productFeatureDTO) < 1) {
			check = false;
		}
		
		// 상품 컵노트 테이블에 데이터 삽입 (add시 사용했던 쿼리문, 메서드 재사용)
		List<ProductCupnoteDTO> productCupnoteDTOs = productFeatureDTO.getProductCupnoteDTOs();
		for(int i=0;i<productCupnoteDTOs.size();i++) {
			ProductCupnoteDTO productCupnoteDTO = productCupnoteDTOs.get(i);
			productCupnoteDTO.setFeatureNum(productFeatureDTO.getNum());
			if(productDAO.addCupnote(productCupnoteDTO) < 1) {
				check = false;
			}
		}
		
		// 상품 옵션 테이블에 데이터 삽입 (add시 사용했던 쿼리문, 메서드 재사용)
		List<ProductOptionDTO> productOptionDTOs = productDTO.getProductOptionDTOs();
		for(int i=0;i<productOptionDTOs.size();i++) {
			ProductOptionDTO productOptionDTO = productOptionDTOs.get(i);
			productOptionDTO.setProductNum(productDTO.getNum());
			if(productDAO.addOption(productOptionDTO) < 1) {
				check = false;
			}
		}
		
		// 상품 파일 테이블에 데이터 삽입
		// productFileDTO 는 파라미터로 fileName, oriName을 넘겨주지 않더라도 null이 아님, 
		// file은 file이 넘어오지 않으면 null, 넘어오면 null이 아님
		// 즉, file을 가지고 상품 이미지를 수정했는지 안했는지를 판단해야 함
		if(file == null) { // 수정하지 않은 경우
			ProductFileDTO productFileDTO = productDTO.getProductFileDTO();
			productFileDTO.setProductNum(productDTO.getNum());
			if(productDAO.addFile(productFileDTO) < 1) {
				check = false;
			}
		} else { // 수정한 경우
			String fileName = fileManager.save(file, "resources/upload/product/");
			ProductFileDTO productFileDTO = new ProductFileDTO();
			productFileDTO.setFileName(fileName);
			productFileDTO.setOriName(file.getOriginalFilename());
			productFileDTO.setProductNum(productDTO.getNum());
			if(productDAO.addFile(productFileDTO) < 1) {
				check = false;
			}
		}
			
		return check;
	}
	
	public FavoriteDTO getMemberFavorite(MemberDTO memberDTO) throws Exception {
		return productDAO.getMemberFavorite(memberDTO);
	}
	
	public List<ProductDTO> recommendedList(FavoriteDTO favoriteDTO, Pager pager) throws Exception {		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		pager.makeRow();
		
		hashMap.put("roastingPoint", favoriteDTO.getRoastingPoint());
		hashMap.put("flavor", favoriteDTO.getFlavor());
		hashMap.put("cupnoteDTOs", favoriteDTO.getCupnoteDTOs());
		
		hashMap.put("kind", pager.getKind());
		hashMap.put("search", pager.getSearch());
		hashMap.put("startRow", pager.getStartRow());
		hashMap.put("lastRow", pager.getLastRow());
		hashMap.put("sorting", pager.getSorting());
		
		pager.makeNum(productDAO.getRecommendedTotal(hashMap));
		
		return productDAO.recommendedList(hashMap);
	}
}
