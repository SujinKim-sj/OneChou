package com.onechou.shop.payment;

public class DeliveryDTO {

	private Long num;
	private String recipient;
	private String address;
	private String recipientPhone;
	private String memo;
	private Long paymentNum;
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Long getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(Long paymentNum) {
		this.paymentNum = paymentNum;
	}
	
}
