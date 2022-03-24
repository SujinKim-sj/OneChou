package com.onechou.shop.payment;

import com.onechou.shop.product.ProductDTO;
import com.onechou.shop.product.ProductOptionDTO;

public class PaidProductDTO {

	private Long num;
	private Long perPrice;
	private Integer amount;
	private Long paymentNum;
	private Long productNum;
	private Long optionNum;
	
	private ProductDTO productDTO;
	private ProductOptionDTO productOptionDTO;
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Long getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(Long perPrice) {
		this.perPrice = perPrice;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Long getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(Long paymentNum) {
		this.paymentNum = paymentNum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public ProductOptionDTO getProductOptionDTO() {
		return productOptionDTO;
	}
	public void setProductOptionDTO(ProductOptionDTO productOptionDTO) {
		this.productOptionDTO = productOptionDTO;
	}
}
