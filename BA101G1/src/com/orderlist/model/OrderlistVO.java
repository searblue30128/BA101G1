package com.orderlist.model;

public class OrderlistVO {
	private String  order_id;
	private String pro_id;
	private Integer order_amount;
	private Integer price;
	
	private byte[] pro_image;
	private String pro_name;
	
	
	
	
	public OrderlistVO() {
		super();
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public Integer getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(Integer order_amount) {
		this.order_amount = order_amount;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public byte[] getPro_image() {
		return pro_image;
	}
	public void setPro_image(byte[] pro_image) {
		this.pro_image = pro_image;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
}
