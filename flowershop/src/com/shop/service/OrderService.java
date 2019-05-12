package com.shop.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.OrderDao;
import com.shop.entity.Order;
import com.shop.utils.PageModel;

@Transactional
public class OrderService {
	private OrderDao orderDao;
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	/**
	 * 保存订单
	 * @param order
	 */
	public void save(Order order) {
		orderDao.save(order);
	}
	/**
	 * 根据ID查询订单
	 * @param order
	 * @return
	 */
	public Order findById(Order order) {
		return orderDao.findById(order.getId());
	}
	/**
	 * 分页
	 * @param detachedCriteria
	 * @param currPage
	 * @return
	 */
	public PageModel<Order> findByPage(DetachedCriteria detachedCriteria,
			PageModel<Order> pageModel) {
		Integer totalCount = orderDao.findCount(detachedCriteria);
		pageModel.setTotalCount(totalCount);
		//封装总页数
		Double d = totalCount.doubleValue();
		//Math.ceil(d/4);//向上取整
		pageModel.setTotalPage((int) Math.ceil(d/pageModel.getPageSize()));
		//封装集合
		Integer begin = (pageModel.getCurrPage()-1)*pageModel.getPageSize();
		List<Order> list = orderDao.findByPage(detachedCriteria, begin, pageModel.getPageSize());
		pageModel.setList(list);
		return pageModel;
	}
	/**
	 * 更新订单状态
	 * @param order
	 */
	public void updatestatus(Order order) {
		orderDao.updatestatus(order);
	}
	
}
