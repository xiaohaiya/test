package com.shop.entity;
/**
 * 商品分类实体
 * @author xiaohai
 *
 */
public class Category {
	int id;
	String cname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}
