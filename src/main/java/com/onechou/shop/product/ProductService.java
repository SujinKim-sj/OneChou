package com.onechou.shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.util.FileManager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public int add(ProductDTO productDTO, MultipartFile file) throws Exception {
		
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
		}
		
		return result;
	}
	
	public List<ProductDTO> list() throws Exception {
		return productDAO.list();
	}
}
