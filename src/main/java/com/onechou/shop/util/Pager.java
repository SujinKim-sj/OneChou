package com.onechou.shop.util;

public class Pager {

	// -- page, perPage 기본 값 초기화 밑 startRow, lastRow 계산 --
	// DB에서 한번의 조회 당 몇 개의 데이터를 가져올 것인지
	private Long page;
	private Long perPage;
	private Long startRow;
	private Long lastRow;
	
	public Long getPage() {
		if(this.page == null || this.page < 1) {
			this.page = 1L;
		}
		return page;
	}
	public Long getPerPage() {
		if(this.perPage == null || this.perPage < 1) {
			this.perPage = 6L;
		}
		return perPage;
	}
	
	public void makeRow() {
		this.startRow = (this.getPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getPerPage() * this.getPage();
	}
	
	// -- block 계산, 한 페이지네이션에 표시할 페이지 번호
	private Long startNum;
	private Long lastNum;
	private boolean pre;
	private boolean next;
	
	public void makeNum(Long totalCount) {
		
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0) {
			totalPage++;
		}
		
		Long perBlock = 10L;
		
		Long totalBlock = totalPage/perBlock;
		if(totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		Long curBlock = this.getPage()/perBlock;
		if(this.getPage()%perBlock != 0) {
			curBlock++;
		}
		
		this.startNum = (curBlock-1) * perBlock + 1;
		this.lastNum = curBlock * perBlock ;
		
		this.pre = false;
		if(curBlock > 1) {
			this.pre = true;
		}
		
		this.next = false;
		if(curBlock < totalBlock) {
			this.next = true;
		}
		
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		if(totalCount == 0) {
			this.lastNum = 0L;
		}
	}
	
	// -- 검색기능 관련
	private String kind;
	private String search;
	
	public String getKind() {
		if(this.kind == null) {
			this.kind = "col1";
		}
		return kind;
	}
	public String getSearch() {
		if(this.search == null) {
			this.search = "";
		}
		return search;
	}
	
	
	
	
	// getters and setters ...
	public void setKind(String kind) {
		this.kind = kind;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
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
	
}

