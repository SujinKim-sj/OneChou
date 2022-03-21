package com.onechou.shop.cart;

public class CartDTO {

	private Long num;
	private Integer amount;
	private Long perPrice;
	private String memberId;
	private Long productNum;
	private Long optionNum;
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Long getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(Long perPrice) {
		this.perPrice = perPrice;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
}
