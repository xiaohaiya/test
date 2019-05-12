package com.shop.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.shop.entity.Images;
import com.shop.entity.Product;

public class ProductDao extends BaseDao<Product>{
	/**
	 * 保存图片
	 * @param img
	 */
	public void saveimg(Images img) {
		this.getHibernateTemplate().save(img);
	}
	/**
	 * 下架商品
	 * @param id
	 */
	public void offpro(Product product) {
		this.getHibernateTemplate().bulkUpdate("update Product set status = ?,offtime = ? where id = ?",1 , product.getOfftime(),product.getId());
	}


}
