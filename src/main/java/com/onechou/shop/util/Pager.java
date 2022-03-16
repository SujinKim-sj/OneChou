package com.onechou.shop.util;

public class Pager {
	private Long perPage;
	private Long page;
	private Long startRow;
	private Long lastRow;
	
	private Long startNum;
	private Long lastNum;
	
	private boolean pre;
	private boolean next;
	
	private String search;
	private String kind;
	
	public void makeRow() {
		startRow = (this.getPage()-1)*this.getPerPage()+1;
		lastRow = this.getPage()*this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			totalPage++; 
		}
		
		Long perBlock=10L;
		Long totalBlock=totalPage/perBlock;
		if(totalPage%perBlock!=0) {
			totalBlock++;
		}
		
		Long curBlock = this.getPage()/10;
		if(this.getPage()%perBlock!=0) {
			curBlock++;
		}
	
		startNum = (curBlock-1)*perBlock+1;
		lastNum=curBlock*perBlock;
		
		next=false;
		if(totalBlock>curBlock) {
			next=true;
		}
		pre=false;
		if(curBlock>1) {
			pre=true;
		}
		
		if(curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
	}
	
	
	public Long getPerPage() {
		if(perPage==null||perPage<1) {
			perPage=10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getPage() {
		if(page==null||page<1) {
			page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getLastNum() {
		return lastNum;
	}
	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	public boolean isPre() {
		return pre;
	}
	public void setPre(boolean pre) {
		this.pre = pre;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getSearch() {
		if(search==null) {
			search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}
