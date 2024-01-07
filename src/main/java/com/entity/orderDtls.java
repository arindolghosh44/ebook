package com.entity;

public class orderDtls {

	
	@Override
	public String toString() {
		return "orderDtls [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email
				+ ", address=" + address + ", phoneNo=" + phoneNo + ", bookName=" + bookName + ", bookAuthor="
				+ bookAuthor + ", price=" + price + ", paymentType=" + paymentType + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	private int id;
	private String orderId;
	private String username;
	private String email;
	private String address;
	private String phoneNo;
	private String bookName;
	private String bookAuthor;
	private int price;
	private String paymentType;

	public orderDtls() {
		super();
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
