package com.springmvc.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RecieptDetails")
public class RecieptDetail {
	@EmbeddedId
	private RecieptDetailId id = new RecieptDetailId();
	private int amount;
	private double totalDetail;
	
	public RecieptDetail(RecieptDetailId id, int amount, double totalDetail) {
		super();
		this.id = id;
		this.amount = amount;
		this.totalDetail = totalDetail;
	}
	public RecieptDetail() {
		super();
	}
	public RecieptDetailId getId() {
		return id;
	}
	public void setId(RecieptDetailId id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getTotalDetail() {
		return totalDetail;
	}
	public void setTotalDetail(double totalDetail) {
		this.totalDetail = totalDetail;
	}
	
}
