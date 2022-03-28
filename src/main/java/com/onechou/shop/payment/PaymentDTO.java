package com.onechou.shop.payment;

import java.sql.Date;
import java.util.List;

public class PaymentDTO {

	private Long num;
	private Date orderDate;
	private Long totalPrice;
	private Integer method;
	private String memberId;
	
	private DeliveryDTO deliveryDTO;
	private List<PaidProductDTO> paidProductDTOs;
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getMethod() {
		return method;
	}
	public void setMethod(Integer method) {
		this.method = method;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public DeliveryDTO getDeliveryDTO() {
		return deliveryDTO;
	}
	public void setDeliveryDTO(DeliveryDTO deliveryDTO) {
		this.deliveryDTO = deliveryDTO;
	}
	public List<PaidProductDTO> getPaidProductDTOs() {
		return paidProductDTOs;
	}
	public void setPaidProductDTOs(List<PaidProductDTO> paidProductDTOs) {
		this.paidProductDTOs = paidProductDTOs;
	}

}
