package com.entity;

public class PageQueryVo {

	private Integer page = 1; 		  // 当前页数
	private Integer start;           //起始位置
	private Integer size = 8; 		// 每页显示条数
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
}
