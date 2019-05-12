package com.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.CartDao;
import com.shop.entity.Cart;
import com.shop.entity.Shopuser;
/**
 * 购物车业务层
 * @author xiaohai
 *
 */
@Transactional
public class CartService {
	/*引入dao层*/
	private CartDao cartDao;
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	/**
	 * 添加购物车
	 * @param cart
	 */
	public void addCart(Cart cart) {
		cartDao.addCart(cart);
	}
	/**
	 * 查询购物车所有项
	 * @param uid 
	 * @return
	 */
	public List<Cart> findAllCart(Shopuser user) {
		// TODO Auto-generated method stub
		return cartDao.findAllCart(user.getId());
	}
	/**
	 * 根据pid查询购物车
	 * @param id
	 * @return 
	 */
	public Cart findByPid(Cart cart) {
		return cartDao.findByPid(cart.getProduct().getId(),cart.getShopuser().getId());
	}
	/**
	 * 根据id查询购物车
	 * @param id
	 * @return
	 */
	public Cart findById(int id) {
		return cartDao.findById(id);
	}
	/**
	 * 删除购物项
	 * @param cart
	 */
	public void deleteCart(Cart cart) {
		cartDao.deleteCart(cart);
	}
	
	
}
