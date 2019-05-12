package com.shop.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.NewsDao;
import com.shop.entity.News;
import com.shop.entity.Product;
import com.shop.utils.PageModel;

@Transactional
public class NewsService {
	
	private NewsDao newsDao;
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	
	public PageModel<News> findByPage(DetachedCriteria detachedCriteria,
			PageModel<News> pageModel) {
		Integer totalCount = newsDao.findCount(detachedCriteria);
		pageModel.setTotalCount(totalCount);
		//封装总页数
		Double d = totalCount.doubleValue();
		//Math.ceil(d/4);//向上取整
		pageModel.setTotalPage((int) Math.ceil(d/pageModel.getPageSize()));
		//封装集合
		Integer begin = (pageModel.getCurrPage()-1)*pageModel.getPageSize();
		List<News> list = newsDao.findByPage(detachedCriteria,begin,pageModel.getPageSize());
		pageModel.setList(list);
		return pageModel;
	}
	
	/**
	 * 保存操作
	 * @param news
	 */
	public void save(News news) {
		newsDao.save(news);
	}

	/**
	 * 查询新闻内容
	 * @param news
	 * @return
	 */
	public News findById(News news) {
		return newsDao.findById(news.getId());
	}

	/**
	 * 修改新闻状态
	 * @param news
	 */
	public void updateStatus(News news) {
		newsDao.updateStatus(news);
	}
	
}
