package com.laptrinhjavaweb.dto;

import java.util.List;

public class Order {
	public Order() {
		super();
	}
	
	public Order(long id, MyUser myUser, String orderDate, boolean status, List<ListItem> items) {
		super();
		this.id = id;
		this.myUser = myUser;
		this.orderDate = orderDate;
		this.status = status;
		this.items = items;
	}

	private long id;
	private MyUser myUser;
	private String orderDate;
	private boolean status;
	private List<ListItem> items;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public MyUser getMyUser() {
		return myUser;
	}
	public void setMyUser(MyUser myUser) {
		this.myUser = myUser;
	}
	public List<ListItem> getItems() {
		return items;
	}
	public void setItems(List<ListItem> items) {
		this.items = items;
	}

}
