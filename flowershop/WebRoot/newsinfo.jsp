<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<div style=" min-width: 1400px; min-height:200px; padding:20px 100px;" id="feedback">
	<p style="font-size: 18px; color: #426100; font-weight: bold; text-align: center;"><s:property value='#news.title' escape='false' /></p>
	<br>
	<p style="text-align: center;">发布日期：<s:property value="%{getText('{0,date,yyyy-MM-dd}',{#news.createtime})}"/></p>
	<br/><br/>
	<s:property value='#news.comment' escape='false' />
</div>
<jsp:include page="bottom.jsp"></jsp:include>