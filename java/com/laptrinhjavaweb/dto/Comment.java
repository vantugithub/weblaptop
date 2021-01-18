package com.laptrinhjavaweb.dto;

public class Comment {
	public Comment(Long id, Long idProduct, int idUser, String fullName, String content, String date, boolean status) {
		super();
		this.id = id;
		this.idProduct = idProduct;
		this.idUser = idUser;
		this.fullName = fullName;
		this.content = content;
		this.date = date;
		this.status = status;
	}
	public Long getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(Long idProduct) {
		this.idProduct = idProduct;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Comment() {
		super();
	}
	private Long id;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private Long idProduct;
	private int idUser;
	private String fullName;
	private String content;
	private String date;
	private boolean status;
	
}
