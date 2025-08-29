package com.springmvc.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;


@Embeddable
public class RecieptDetailId implements Serializable{
	private static final long serialVersionUID = 1L;
	@ManyToOne(fetch = FetchType.LAZY)
	private Product product;
	@ManyToOne(fetch = FetchType.LAZY)
	private Reciept reciept;
	
	public RecieptDetailId() {
		super();
	}
	
	public RecieptDetailId(Product product, Reciept reciept) {
		super();
		this.product = product;
		this.reciept = reciept;
	}

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Reciept getReciept() {
		return reciept;
	}
	public void setReciept(Reciept reciept) {
		this.reciept = reciept;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
