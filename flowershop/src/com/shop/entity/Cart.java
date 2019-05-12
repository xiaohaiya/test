package com.shop.entity;

import java.util.Date;
/**
 * 购物项实体
 * @author xiaohai
 *
 */
public class Cart {
	private int id;
	private int number;
	private int status;
	private Date createtime;
	private Date updatetime;
	private Product product;
	private Shopuser shopuser;
	private Order order;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Shopuser getShopuser() {
		return shopuser;
	}
	public void setShopuser(Shopuser shopuser) {
		this.shopuser = shopuser;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

}
