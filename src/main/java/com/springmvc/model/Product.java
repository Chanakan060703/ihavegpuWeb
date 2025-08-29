package com.springmvc.model;


import java.util.*;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "products")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name= "product_id",nullable = false)
	private int product_id;
	
	@Column(name="product_name",nullable = false)
	private String product_name;
	
	@Column(name="price", nullable = false)
	private double price;
	
	@Column(name="detail",nullable = false)
	private String detail;
	
	@Column(name="product_qty",nullable = false)
	private int product_qty;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "type_id")
	private Type type_id; 

	
	@Column(name="brand",nullable = false)
	private String brand;
	
	@Column(name="pic_product",nullable = false,length = 500)
	private String pic_product;
	
	@OneToMany(cascade = {CascadeType.ALL},mappedBy = "id.product",orphanRemoval = true)
	private List<RecieptDetail> listRepDall = new ArrayList<>();
	
	
	public Product(int product_id, String product_name, double price, String detail, Type type, String brand,
			String pic_product, List<RecieptDetail> listRepDall, int product_qty) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.detail = detail;
		this.type_id = type;
		this.brand = brand;
		this.pic_product = pic_product;
		this.listRepDall = listRepDall;
		this.product_qty = product_qty;
	}
	
	public Product() {
		super();
	}
	
	public int getProduct_qty() {
		return product_qty;
	}

	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}

	public Type getType_id() {
		return type_id;
	}

	public void setType_id(Type type_id) {
		this.type_id = type_id;
	}

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Double getPrice() {
		return price;
	}
	public List<RecieptDetail> getListRepDall() {
		return listRepDall;
	}
	public void setListRepDall(List<RecieptDetail> listRepDall) {
		this.listRepDall = listRepDall;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Type getType() {
		return type_id;
	}
	public void setType(Type type) {
		this.type_id = type;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPic_product() {
		return pic_product;
	}
	public void setPic_product(String pic_product) {
		this.pic_product = pic_product;
	}
}
