package com.shop.action.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.shop.entity.Shopuser;

/**
 * 权限拦截器
 * @author xiaohai
 *
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session中是否有user对象
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user==null) {
			//将错误信息存进去
			ActionSupport actionSupport = (ActionSupport) invocation.getAction();
			actionSupport.addActionError("你还没有登陆！");
			return "login";
		}else {
			return invocation.invoke();
		}
	}

}
