package com.laptrinhjavaweb.dto;

public class Attribute {
	public Attribute(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	private long id;
	private String name;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
