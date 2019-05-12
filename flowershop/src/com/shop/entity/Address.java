package com.shop.entity;
/**
 * 收货地址实体
 * @author xiaohai
 *
 */
public class Address {
	private int id;
	private String name;
	private String gender;
	private String postalcode;
	private String address;
	private String phone;
	private Shopuser user;
	private int status;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Shopuser getUser() {
		return user;
	}
	public void setUser(Shopuser user) {
		this.user = user;
	}
}
