package com.shop.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Feedback;
import com.shop.entity.Product;
import com.shop.service.FeedbackService;

public class FeedbackAction extends ActionSupport implements ModelDriven<Feedback> {
	//注入模型驱动
	private Feedback feedback = new Feedback();
	public Feedback getModel() {
		return feedback;
	}
	
	//sevice
	private FeedbackService feedbackService;
	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}
	/**
	 * 查找所有
	 * @throws IOException
	 */
	public void findAll() throws IOException{
		List<Feedback> list = feedbackService.findAll();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Feedback.class, "id","questions","answer");  
		ServletActionContext.getResponse().getWriter().write(JSONArray.toJSONString(list,filter,SerializerFeature.WriteMapNullValue));
	}
	/**
	 * 新增
	 * @return
	 * @throws IOException
	 */
	public String add() throws IOException{
		feedback.setTime(new Date());
		feedbackService.save(feedback);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"感谢您的反馈！\");window.location.href=\"index.jsp\";</script>");
		return NONE;
	}
}
