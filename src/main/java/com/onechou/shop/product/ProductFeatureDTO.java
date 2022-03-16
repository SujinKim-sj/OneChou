package com.onechou.shop.product;

import java.util.List;

public class ProductFeatureDTO {

	private Long num;
	private Integer roastingPoint;
	private Integer Flavor;
	private Long productNum;
	
	private List<ProductCupnoteDTO> productCupnoteDTOs;
	
	public List<ProductCupnoteDTO> getProductCupnoteDTOs() {
		return productCupnoteDTOs;
	}
	public void setProductCupnoteDTOs(List<ProductCupnoteDTO> productCupnoteDTOs) {
		this.productCupnoteDTOs = productCupnoteDTOs;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Integer getRoastingPoint() {
		return roastingPoint;
	}
	public void setRoastingPoint(Integer roastingPoint) {
		this.roastingPoint = roastingPoint;
	}
	public Integer getFlavor() {
		return Flavor;
	}
	public void setFlavor(Integer flavor) {
		Flavor = flavor;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	
}
