package com.laptrinhjavaweb.dto;

public class ReplyComment {
	private int id;
	private int commentId;
	private String fullName;
	private String content;
	private String date;
	private long idProduct;
	private boolean status;
	private int userId;
	public int getId() {
		return id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(long idProduct) {
		this.idProduct = idProduct;
	}


	public ReplyComment(int id, int commentId, String fullName, String content, String date, long idProduct,
			boolean status, int userId) {
		super();
		this.id = id;
		this.commentId = commentId;
		this.fullName = fullName;
		this.content = content;
		this.date = date;
		this.idProduct = idProduct;
		this.status = status;
		this.userId = userId;
	}
	public ReplyComment() {
		super();
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
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
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
