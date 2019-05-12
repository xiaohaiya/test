package com.shop.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.shop.entity.Order;

public class OrderDao extends BaseDao<Order> {

	/**
	 * 更新订单状态
	 * @param order
	 */
	public void updatestatus(Order order) {
		this.getHibernateTemplate().bulkUpdate("update Order set updatetime = ?,status = ? where id = ?", order.getUpdatetime(),order.getStatus(),order.getId());
	}

	
}
