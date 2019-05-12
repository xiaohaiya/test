<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<div style="width: 100%; height:200px; padding-top: 80px;">
<div style="text-align: center; font-size: 25px;">
<img alt="支付成功" src="${pageContext.request.contextPath }/images/success.png" width="50" height="50">
您已成功支付，点此<a style="font-size: 25px;" href="${pageContext.request.contextPath }/order_orderinfo.action?id=<s:property value="#order.id"/>">查看订单详情</a>
</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>