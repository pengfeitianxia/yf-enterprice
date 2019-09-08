package com.yijia.enterprise.util.page;


import java.io.Serializable;

public class PageResult implements Serializable {

	private static final long serialVersionUID = 8762157349344397282L;
	
	private int draw;
	private int recordsTotal;
	private int recordsFiltered;
	private Object data;
	
	public PageResult() {
		// TODO Auto-generated constructor stub
	}
	
	public PageResult(PageInfo pageInfo,int draw) {
		this.draw = draw;
		this.recordsTotal = pageInfo.getTotalResult();
		this.recordsFiltered = pageInfo.getTotalResult();
		this.data = pageInfo.getResultObject();
	}
	
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
