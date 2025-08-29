package com.springmvc.model;

import javax.persistence.*;

@Entity
@Table(name="Reciepts")
public class Reciept {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="reciept_id", nullable = false)
    private int reciept_id;

    @Column(name="date", nullable = false)
    private String date;

    @Column(name="total", nullable = false)
    private double total;

    @Column(name="email", nullable = false)
    private String email;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id", referencedColumnName = "address_id")
    private Address address;

    // Constructors, Getters, and Setters

    public Reciept() {
        super();
    }

    public Reciept(int reciept_id, String date, double total, String email, Address address) {
        this.reciept_id = reciept_id;
        this.date = date;
        this.total = total;
        this.email = email;
        this.address = address;
    }

    public int getReciept_id() {
        return reciept_id;
    }

    public void setReciept_id(int reciept_id) {
        this.reciept_id = reciept_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
