package com.shop.dao;

import com.shop.entity.News;

public class NewsDao extends BaseDao<News> {

	public void updateStatus(News news) {
		this.getHibernateTemplate().bulkUpdate("update News set important = ? where id =?", news.getImportant(),news.getId());
	}

}
