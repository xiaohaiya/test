package com.shop.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.alibaba.fastjson.JSONArray;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Feedback;
import com.shop.entity.News;
import com.shop.service.NewsService;
import com.shop.utils.PageModel;

public class NewsAction extends ActionSupport implements ModelDriven<News> {
	
	private News news = new News();
	public News getModel() {
		return news;
	}
	
	private NewsService newsService;
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	
	private Integer currPage=1;
	public void setCurrPage(Integer currPage) {
		if(currPage==null) {
			currPage=1;
		}
		this.currPage = currPage;
	}
	
	/**
	 * 分页查询
	 */
	public String findAll(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(News.class);
		PageModel<News> pageModel = new PageModel<News>();
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = newsService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "findAll";
	}
	/**
	 * 新闻详情
	 * @throws IOException 
	 */
	public String findById() throws IOException{
		news = newsService.findById(news);
		ActionContext.getContext().put("news", news);
		return "findById";
	}
	
}
