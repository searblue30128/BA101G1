package com.store.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class StoreVO implements Serializable{
	
	
	private String store_id;
	private Integer sc_id;
	private String store_name;
	private String store_content;
	private Integer store_phone;
	private String store_addr;
	private Date store_date;
	private Integer store_star;
	private Integer store_count;
	private Integer store_state;
	private byte[] store_image;
	private Integer store_report_count;
	private Timestamp store_start_time;
	private Timestamp store_end_time;
	private String store_pw;
	private String store_acc;
	private Integer store_out;
	private String store_zone;
	
	public StoreVO(){
		
	}


	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public Integer getSc_id() {
		return sc_id;
	}

	public void setSc_id(Integer sc_id) {
		this.sc_id = sc_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_content() {
		return store_content;
	}

	public void setStore_content(String store_content) {
		this.store_content = store_content;
	}

	public Integer getStore_phone() {
		return store_phone;
	}

	public void setStore_phone(Integer store_phone) {
		this.store_phone = store_phone;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public Date getStore_date() {
		return store_date;
	}

	public void setStore_date(Date store_date) {
		this.store_date = store_date;
	}

	public Integer getStore_star() {
		return store_star;
	}

	public void setStore_star(Integer store_star) {
		this.store_star = store_star;
	}

	public Integer getStore_count() {
		return store_count;
	}

	public void setStore_count(Integer store_count) {
		this.store_count = store_count;
	}

	public Integer getStore_state() {
		return store_state;
	}

	public void setStore_state(Integer store_state) {
		this.store_state = store_state;
	}

	public byte[] getStore_image() {
		return store_image;
	}

	public void setStore_image(byte[] store_image) {
		this.store_image = store_image;
	}

	public Integer getStore_report_count() {
		return store_report_count;
	}

	public void setStore_report_count(Integer store_report_count) {
		this.store_report_count = store_report_count;
	}

	public Timestamp getStore_start_time() {
		return store_start_time;
	}

	public void setStore_start_time(Timestamp store_start_time) {
		this.store_start_time = store_start_time;
	}

	public Timestamp getStore_end_time() {
		return store_end_time;
	}

	public void setStore_end_time(Timestamp store_end_time) {
		this.store_end_time = store_end_time;
	}

	public String getStore_pw() {
		return store_pw;
	}

	public void setStore_pw(String store_pw) {
		this.store_pw = store_pw;
	}

	public String getStore_acc() {
		return store_acc;
	}

	public void setStore_acc(String store_acc) {
		this.store_acc = store_acc;
	}

	public Integer getStore_out() {
		return store_out;
	}

	public void setStore_out(Integer store_out) {
		this.store_out = store_out;
	}

	public String getStore_zone() {
		return store_zone;
	}

	public void setStore_zone(String store_zone) {
		this.store_zone = store_zone;
	}
	
	
	
	

}