package com.springmvc.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "types")
public class Type {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_id")
    private int type_id;

    @Column(name = "type_name")
    private String type_name;
    @Column(name = "icon_class")
    private String iconClass;
    @OneToMany(cascade = {CascadeType.ALL},mappedBy = "type_id",orphanRemoval = true)
	private List<Product> list = new ArrayList<>();
    
    
    public Type(int type_id, String type_name, String iconClass, List<Product> list) {
		super();
		this.type_id = type_id;
		this.type_name = type_name;
		this.iconClass = iconClass;
		this.list = list;
	}

	public Type() {
		super();
	}

	public List<Product> getList() {
		return list;
	}
    
	public String getIconClass() {
		return iconClass;
	}

	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	// getters and setters
    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
}