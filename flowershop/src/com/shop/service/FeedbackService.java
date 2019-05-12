package com.shop.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.FeedbackDao;
import com.shop.entity.Feedback;
import com.shop.entity.Shopuser;
import com.shop.utils.PageModel;

@Transactional
public class FeedbackService {

	private FeedbackDao feedbackDao;
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}
	/**
	 * 查询所有信息
	 * @return
	 */
	public List<Feedback> findAll() {
		return feedbackDao.findAll();
	}
	/**
	 * 保存反馈信息
	 * @param feedback
	 */
	public void save(Feedback feedback) {
		feedbackDao.save(feedback);
	}
	/**
	 * 分页查询
	 * @param detachedCriteria
	 * @param pageModel
	 * @return
	 */
	public PageModel<Feedback> findByPage(DetachedCriteria detachedCriteria,
			PageModel<Feedback> pageModel) {
		Integer totalCount = feedbackDao.findCount(detachedCriteria);
		pageModel.setTotalCount(totalCount);
		//封装总页数
		Double d = totalCount.doubleValue();
		//Math.ceil(d/4);//向上取整
		pageModel.setTotalPage((int) Math.ceil(d/pageModel.getPageSize()));
		//封装集合
		Integer begin = (pageModel.getCurrPage()-1)*pageModel.getPageSize();
		List<Feedback> list = feedbackDao.findByPage(detachedCriteria, begin, pageModel.getPageSize());
		pageModel.setList(list);
		return pageModel;
	}
	/**
	 * 根据id查询
	 * @param feedback
	 * @return
	 */
	public Feedback findById(Feedback feedback) {
		return feedbackDao.findById(feedback.getId());
	}
	/**
	 * 更新
	 * @param feedback
	 */
	public void update(Feedback feedback) {
		feedbackDao.update(feedback);
	}
	/**
	 * 更新回答
	 * @param feedback
	 */
	public void updateanswer(Feedback feedback) {
		Feedback feedback2 = feedbackDao.findById(feedback.getId());
		feedback2.setAnswer(feedback.getAnswer());
		feedbackDao.getHibernateTemplate().clear();
		feedbackDao.update(feedback2);
	}
	
}
