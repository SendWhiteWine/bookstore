package com.book.pojo;

import java.util.Date;

public class Orders {
    private String oid;

    private Date ordertime;

    private Double total;

    private Integer state;

    private String address;

    private String name;

    private String telephone;

    private String uid;
    
    private String uname;
    
    public String getOid() {
        return oid;
    }

    public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", ordertime=" + ordertime + ", total=" + total + ", state=" + state
				+ ", address=" + address + ", name=" + name + ", telephone=" + telephone + ", uid=" + uid + ", uname="
				+ uname + "]";
	}
}