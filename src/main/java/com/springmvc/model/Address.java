package com.springmvc.model;

import javax.persistence.*;

@Entity
@Table(name="Address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="address_id", nullable = false)
    private int address_id;

    @Column(name="house_number", nullable = false)
    private String house_number;

    @Column(name="province", nullable = false)
    private String province;

    @Column(name="building", nullable = false)
    private String building;

    @Column(name="district", nullable = false)
    private String district;

    @Column(name="sub_district", nullable = false)
    private String sub_district;

    @Column(name="emailA", nullable = false)
    private String emailA;

    @OneToOne(mappedBy = "address", cascade = CascadeType.ALL)
    private Reciept reciept;

    
    public Address() {
        super();
    }

    public Address(int address_id, String house_number, String province, String building, String district,
                   String sub_district, String emailA) {
        this.address_id = address_id;
        this.house_number = house_number;
        this.province = province;
        this.building = building;
        this.district = district;
        this.sub_district = sub_district;
        this.emailA = emailA;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getHouse_number() {
        return house_number;
    }

    public void setHouse_number(String house_number) {
        this.house_number = house_number;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getSub_district() {
        return sub_district;
    }

    public void setSub_district(String sub_district) {
        this.sub_district = sub_district;
    }

    public String getEmailA() {
        return emailA;
    }

    public void setEmailA(String emailA) {
        this.emailA = emailA;
    }

    public Reciept getReciept() {
        return reciept;
    }

    public void setReciept(Reciept reciept) {
        this.reciept = reciept;
    }
}
