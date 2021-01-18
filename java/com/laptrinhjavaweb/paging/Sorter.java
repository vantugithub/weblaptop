package com.laptrinhjavaweb.paging;

public class Sorter {
	private String sortBy;
	private String sortName;
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public Sorter(String sortBy, String sortName) {
		super();
		this.sortBy = sortBy;
		this.sortName = sortName;
	}
	public Sorter() {
		super();
	}
	
}
