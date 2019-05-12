package com.shop.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户订单实体
 * @author xiaohai
 *
 */
public class Order {
	private String id;
	private Double total;
	private Date createtime;
	private Date updatetime;
	private String pay;
	private int status;
	private Address address;
	private Shopuser user;
	private String express;
	private String conmment;
	private Set<Cart> cart = new HashSet<Cart>();
	public Set<Cart> getCart() {
		return cart;
	}
	public void setCart(Set<Cart> cart) {
		this.cart = cart;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
	public String getConmment() {
		return conmment;
	}
	public void setConmment(String conmment) {
		this.conmment = conmment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Shopuser getUser() {
		return user;
	}
	public void setUser(Shopuser user) {
		this.user = user;
	}
}
