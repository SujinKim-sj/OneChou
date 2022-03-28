package com.onechou.shop.favorite;

import java.util.List;

public class FavoriteDTO {
	private Long num;
	private Long roastingPoint;
	private Long flavor;
	private String memberId;
	private List<CupnoteDTO> cupnoteDTOs;
	
	public List<CupnoteDTO> getCupnoteDTOs() {
		return cupnoteDTOs;
	}
	public void setCupnoteDTOs(List<CupnoteDTO> cupnoteDTOs) {
		this.cupnoteDTOs = cupnoteDTOs;
	}
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Long getRoastingPoint() {
		return roastingPoint;
	}
	public void setRoastingPoint(Long roastingPoint) {
		this.roastingPoint = roastingPoint;
	}
	public Long getFlavor() {
		return flavor;
	}
	public void setFlavor(Long flavor) {
		this.flavor = flavor;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
