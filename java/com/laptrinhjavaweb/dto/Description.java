package com.laptrinhjavaweb.dto;

public class Description extends Product {
	private String title;
	private String headContent;
	private String footContent;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHeadContent() {
		return headContent;
	}
	public void setHeadContent(String headContent) {
		this.headContent = headContent;
	}
	public String getFootContent() {
		return footContent;
	}
	public void setFootContent(String footContent) {
		this.footContent = footContent;
	}
	public Description(String title, String headContent, String footContent) {
		super();
		this.title = title;
		this.headContent = headContent;
		this.footContent = footContent;
	}
	public Description() {
		super();
	}

}
