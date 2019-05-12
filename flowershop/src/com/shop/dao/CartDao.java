package com.shop.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.shop.entity.Cart;
import com.shop.entity.Product;

public class CartDao extends HibernateDaoSupport {
	/**
	 * 添加购物车
	 * @param cart
	 */
	public void addCart(Cart cart) {
		this.getHibernateTemplate().saveOrUpdate(cart);
	}
	/**
	 * 查询购物车所有项
	 * @param uid 
	 * @return
	 */
	public List<Cart> findAllCart(int uid) {
		// TODO Auto-generated method stub
		return (List<Cart>) this.getHibernateTemplate().find("from Cart where status = 0 and uid = ?",uid);
	}
	public Cart findByPid(int id,int uid) {
		List<Cart> list = (List<Cart>) this.getHibernateTemplate().find("from Cart where status = 0 and pid = ? and uid = ?", id,uid);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
			}
	}
	public Cart findById(int id) {
		List<Cart> list = (List<Cart>) this.getHibernateTemplate().find("from Cart where status = 0 and id = ?", id);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
			}
	}
	public void deleteCart(Cart cart) {
		this.getHibernateTemplate().delete(cart);
	}

	

}
