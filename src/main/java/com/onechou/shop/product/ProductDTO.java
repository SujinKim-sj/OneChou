package com.onechou.shop.product;

import java.sql.Date;
import java.util.List;

public class ProductDTO {
	
	private Long num;
	private String name;
	private String info;
	private Integer price;
	private Long purchase;
	private Date regDate;
	private Long roasteryNum;
	
	private ProductFileDTO productFileDTO;
	private ProductFeatureDTO productFeatureDTO;
	private List<ProductOptionDTO> productOptionDTOs;
	
	public List<ProductOptionDTO> getProductOptionDTOs() {
		return productOptionDTOs;
	}
	public void setProductOptionDTOs(List<ProductOptionDTO> productOptionDTOs) {
		this.productOptionDTOs = productOptionDTOs;
	}
	public ProductFileDTO getProductFileDTO() {
		return productFileDTO;
	}
	public void setProductFileDTO(ProductFileDTO productFileDTO) {
		this.productFileDTO = productFileDTO;
	}
	public ProductFeatureDTO getProductFeatureDTO() {
		return productFeatureDTO;
	}
	public void setProductFeatureDTO(ProductFeatureDTO productFeatureDTO) {
		this.productFeatureDTO = productFeatureDTO;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Long getPurchase() {
		return purchase;
	}
	public void setPurchase(Long purchase) {
		this.purchase = purchase;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getRoasteryNum() {
		return roasteryNum;
	}
	public void setRoasteryNum(Long roasteryNum) {
		this.roasteryNum = roasteryNum;
	}
}
