package com.springmvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="news")
public class News {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="new_id",nullable = false)
	private int new_id;
	@Column(name="new_name",nullable = false)
	private String new_name;
	@Column(name="new_detail",nullable = false,length = 255)
	private String new_detail;
	@Column(name="new_date",nullable = false)
	private String new_date;
	@Column(name="new_pic",nullable = false,length = 500)
	private String new_pic;
	
	public News(int new_id, String new_name, String new_detail, String new_date, String new_pic) {
		super();
		this.new_id = new_id;
		this.new_name = new_name;
		this.new_detail = new_detail;
		this.new_date = new_date;
		this.new_pic = new_pic;
	}
	public News() {
		super();
	}
	public int getNew_id() {
		return new_id;
	}
	public void setNew_id(int new_id) {
		this.new_id = new_id;
	}
	public String getNew_name() {
		return new_name;
	}
	public void setNew_name(String new_name) {
		this.new_name = new_name;
	}
	public String getNew_detail() {
		return new_detail;
	}
	public void setNew_detail(String new_detail) {
		this.new_detail = new_detail;
	}
	public String getNew_date() {
		return new_date;
	}
	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}
	public String getNew_pic() {
		return new_pic;
	}
	public void setNew_pic(String new_pic) {
		this.new_pic = new_pic;
	}
	
}
