package com.onechou.shop.roastery;

public class RoasteryDTO {

	private Long num;
	private String name;
	private String info;
	private String address;
	private String memberId;
	private RoasteryFileDTO roasteryFileDTO;
	

	public RoasteryFileDTO getRoasteryFileDTO() {
		return roasteryFileDTO;
	}
	public void setRoasteryFileDTO(RoasteryFileDTO roasteryFileDTO) {
		this.roasteryFileDTO = roasteryFileDTO;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}
