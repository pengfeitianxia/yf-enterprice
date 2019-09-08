package com.yijia.enterprise.util.page;

import java.io.Serializable;

public class PageInfo implements Serializable {

	private static final long serialVersionUID = 587754556498974978L;

	// pagesize ，每一页显示多少
	private int showCount = 10;
	// 总页数
	private int totalPage;
	// 总记录数
	private int totalResult = 0;
	// 当前页数
	private int currentPage = 1;
	// 当前显示到的ID, 在mysql limit 中就是第一个参数.
	private int currentResult = -1;
	private String sortField;
	private String order;

	private Object resultObject;

	public void calculateTotalPage() {
		int rowCount = this.totalResult;
		int pageSize = this.showCount;
		if (rowCount > pageSize) {
			if (rowCount % pageSize == 0) {
				this.setTotalPage(rowCount / pageSize);
			} else {
				this.setTotalPage(1 + (rowCount / pageSize));
			}
		} else {
			this.setTotalPage(1);
		}

	}

	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public Object getResultObject() {
		return resultObject;
	}

	public void setResultObject(Object resultObject) {
		this.resultObject = resultObject;
	}

	public int getShowCount() {
		return showCount;
	}

	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}

	public int getTotalPage() {
		return totalResult % showCount == 0 ? totalResult / showCount : totalResult / showCount + 1;
	}

	public int getTotalResult() {
		return totalResult;
	}

	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCurrentResult() {
		if (currentResult == -1) {
			return showCount * (currentPage - 1);
		}
		return currentResult;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "PageInfo{" +
				"showCount=" + showCount +
				", totalPage=" + totalPage +
				", totalResult=" + totalResult +
				", currentPage=" + currentPage +
				", currentResult=" + currentResult +
				", sortField='" + sortField + '\'' +
				", order='" + order + '\'' +
				", resultObject=" + resultObject +
				'}';
	}
}
