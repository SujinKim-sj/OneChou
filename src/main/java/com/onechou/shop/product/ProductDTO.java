package com.onechou.shop.product;

import java.sql.Date;
import java.util.List;

import com.onechou.shop.qna.QnaDTO;
import com.onechou.shop.review.ReviewDTO;
import com.onechou.shop.roastery.RoasteryDTO;

public class ProductDTO {
	
	private Long num;
	private String name;
	private String info;
	private Integer price;
	private Long purchase;
	private Date regDate;
	private Long roasteryNum;
	private String roasteryName;
	private Integer deliveryFee;
	private Integer freeDelivery;
	private Integer sale;
	
	private RoasteryDTO roasteryDTO;
	private ProductFileDTO productFileDTO;
	private ProductFeatureDTO productFeatureDTO;
	private List<ProductOptionDTO> productOptionDTOs;
	private List<ReviewDTO> reviewDTOs;
	private List<QnaDTO> qnaDTOs;
	
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
	public String getRoasteryName() {
		return roasteryName;
	}
	public void setRoasteryName(String roasteryName) {
		this.roasteryName = roasteryName;
	}
	public Integer getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(Integer deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public Integer getFreeDelivery() {
		return freeDelivery;
	}
	public void setFreeDelivery(Integer freeDelivery) {
		this.freeDelivery = freeDelivery;
	}
	public Integer getSale() {
		return sale;
	}
	public void setSale(Integer sale) {
		this.sale = sale;
	}
	public RoasteryDTO getRoasteryDTO() {
		return roasteryDTO;
	}
	public void setRoasteryDTO(RoasteryDTO roasteryDTO) {
		this.roasteryDTO = roasteryDTO;
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
	public List<ProductOptionDTO> getProductOptionDTOs() {
		return productOptionDTOs;
	}
	public void setProductOptionDTOs(List<ProductOptionDTO> productOptionDTOs) {
		this.productOptionDTOs = productOptionDTOs;
	}
	public List<ReviewDTO> getReviewDTOs() {
		return reviewDTOs;
	}
	public void setReviewDTOs(List<ReviewDTO> reviewDTOs) {
		this.reviewDTOs = reviewDTOs;
	}
	public List<QnaDTO> getQnaDTOs() {
		return qnaDTOs;
	}
	public void setQnaDTOs(List<QnaDTO> qnaDTOs) {
		this.qnaDTOs = qnaDTOs;
	}
	
}
