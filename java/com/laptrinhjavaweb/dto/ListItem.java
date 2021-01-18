package com.laptrinhjavaweb.dto;

public class ListItem {
	private int quantity;
	private Product product;
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public ListItem() {
		super();
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ListItem(int quantity, Product product) {
		super();
		this.quantity = quantity;
		this.product = product;
	}
	
}
